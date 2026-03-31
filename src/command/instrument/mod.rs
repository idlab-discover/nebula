mod codegen;
mod compose;
mod resolve;

use std::collections::{HashMap, HashSet};
use std::path::{Path, PathBuf};

use anyhow::{Context, Result, anyhow};
use clap::Args;
use fs_extra::dir::{CopyOptions, copy};
use tokio::task::JoinSet;
use tracing::info;
use wit_bindgen_core::{Files, WorldGenerator};
use wit_bindgen_rust::Opts;
use wit_component::{DecodedWasm, decode};
use wit_parser::{
	Docs,
	IndexMap,
	Package,
	PackageName,
	Resolve,
	Span,
	Stability,
	UnresolvedPackage,
	World,
	WorldId,
	WorldItem,
	WorldKey,
};

use crate::command::CliCommand;
use crate::command::instrument::compose::{
	emit_proxy_composition,
	register_proxy_packages,
	wire_proxy_composition,
};
use crate::command::instrument::resolve::resolve_package;
use crate::config::NebulaConfig;
use crate::util::resolve_input_paths;

const PROXY_PACKAGE_NAMESPACE: &str = "nebula";
const PROXY_PACKAGE_NAME: &str = "proxy";
const PROXY_WORLD_NAME: &str = "proxy";

#[derive(Args)]
pub struct InstrumentCommand {
	#[clap(
		required = true,
		help = "WASM file(s) to instrument, or a directory to scan recursively"
	)]
	pub paths:      Vec<PathBuf>,
	#[clap(
		long,
		short = 'o',
		value_name = "DIR",
		help = "Directory for the generated Rust project (defaults to system \
		        temp)"
	)]
	pub output_dir: Option<PathBuf>,
}

impl CliCommand for InstrumentCommand {
	async fn handle(&self, nebula_config: Option<&NebulaConfig>) -> Result<()> {
		// Resolve the input paths to find all WASM files to instrument, and
		// prepare the output directory by copying the template project into it.
		let wasm_files = resolve_input_paths(&self.paths, true)?;
		let output_root = prepare_output_root(self.output_dir.as_deref())?;

		// 1. Decode the input WASM files to extract their WIT worlds.
		let input_worlds = self.resolve_input_worlds(&wasm_files).await?;

		// 2. Create a new resolve for the proxy, and prefetch all packages
		//    referenced by the input worlds into it.
		let (mut proxy_resolve, proxy_world) =
			self.resolve_proxy_world(&input_worlds, nebula_config).await?;

		// 3. Generate Rust bindings for the proxy world and write them into the
		//    template project.
		self.build_proxy_bindings(
			&mut proxy_resolve,
			&proxy_world,
			&output_root,
		)?;

		// 4. Build the proxy component from the template project, compose it
		//    with the input components, and emit the final proxied component.
		self.build_proxy_component(&output_root)?;

		info!(path = %output_root.display(), "Template project written");

		Ok(())
	}
}

impl InstrumentCommand {
	/// Resolves the input WASM files to extract their WIT worlds, returning a
	/// vector of resolves and world IDs for the input components.
	async fn resolve_input_worlds(
		&self,
		wasm_files: &[PathBuf],
	) -> Result<Vec<(Resolve, WorldId)>> {
		let mut worlds = Vec::new();

		for wasm_file in wasm_files {
			let wasm_bytes = std::fs::read(wasm_file)?;
			let wasm_decoded = decode(&wasm_bytes)?;

			let resolved_world = match wasm_decoded {
				DecodedWasm::Component(resolve, world) => Ok((resolve, world)),
				_ => {
					Err(anyhow!(
						"failed to decode bytes as WIT component: {}",
						wasm_file.display()
					))
				},
			}?;

			worlds.push(resolved_world);
		}

		Ok(worlds)
	}

	/// Build and resolve a proxy world that re-exports + imports the exports
	/// from the input worlds, and returns the resolved proxy world along with
	/// its world ID.
	async fn resolve_proxy_world(
		&self,
		input_worlds: &[(Resolve, WorldId)],
		nebula_config: Option<&NebulaConfig>,
	) -> Result<(Resolve, WorldId)> {
		let mut proxy_resolve = Resolve::default();
		self.prefetch_and_push_packages(
			&mut proxy_resolve,
			input_worlds,
			nebula_config,
		)
		.await?;

		let proxy_package_id = proxy_resolve.packages.alloc(Package {
			name:       PackageName {
				namespace: PROXY_PACKAGE_NAMESPACE.to_string(),
				name:      PROXY_PACKAGE_NAME.to_string(),
				version:   None,
			},
			docs:       Docs::default(),
			interfaces: IndexMap::default(),
			worlds:     IndexMap::default(),
		});

		let proxy_world_id = proxy_resolve.worlds.alloc(World {
			name:      PROXY_WORLD_NAME.to_string(),
			package:   Some(proxy_package_id),
			exports:   IndexMap::new(),
			imports:   IndexMap::new(),
			stability: Stability::Unknown,
			docs:      Docs::default(),
			includes:  Vec::new(),
			span:      Span::default(),
		});

		proxy_resolve.packages[proxy_package_id]
			.worlds
			.insert(PROXY_WORLD_NAME.to_string(), proxy_world_id);

		let mut resolved_items = Vec::new();

		for (input_resolve, input_world_id) in input_worlds {
			let input_world = &input_resolve.worlds[*input_world_id];

			for (key, item) in &input_world.exports {
				let new_item = match item {
					WorldItem::Interface { id, stability, span } => {
						let old_interface = &input_resolve.interfaces[*id];
						let old_pkg_id =
							old_interface.package.with_context(|| {
								format!(
									"exported interface `{}` has no owning \
									 package",
									old_interface
										.name
										.as_deref()
										.unwrap_or("<unnamed>")
								)
							})?;
						let old_pkg = &input_resolve.packages[old_pkg_id];

						let pkg_id = *proxy_resolve
							.package_names
							.get(&old_pkg.name)
							.with_context(|| {
								format!(
									"package `{}` was not preloaded into \
									 proxy resolve",
									old_pkg.name
								)
							})?;

						let interface_name =
							old_interface.name.as_ref().with_context(|| {
								format!(
									"exported interface in package `{}` is \
									 unnamed",
									old_pkg.name
								)
							})?;

						let interface_id = *proxy_resolve.packages[pkg_id]
							.interfaces
							.get(interface_name)
							.with_context(|| {
								format!(
									"interface `{}` not found in resolved \
									 package `{}`",
									interface_name, old_pkg.name
								)
							})?;

						WorldItem::Interface {
							id:        interface_id,
							stability: stability.clone(),
							span:      span.clone(),
						}
					},
					WorldItem::Function(f) => WorldItem::Function(f.clone()),
					_ => continue,
				};

				let new_key = match (key, &new_item) {
					(WorldKey::Name(n), _) => WorldKey::Name(n.clone()),
					(
						WorldKey::Interface(_),
						WorldItem::Interface { id, .. },
					) => WorldKey::Interface(*id),
					(k, _) => k.clone(),
				};

				resolved_items.push((new_key, new_item));
			}
		}

		let proxy_world = &mut proxy_resolve.worlds[proxy_world_id];
		for (key, item) in resolved_items {
			proxy_world.exports.insert(key.clone(), item.clone());
			proxy_world.imports.insert(key, item);
		}

		proxy_resolve.merge_world_imports_based_on_semver(proxy_world_id)?;

		Ok((proxy_resolve, proxy_world_id))
	}

	async fn prefetch_and_push_packages(
		&self,
		proxy_resolve: &mut Resolve,
		input_worlds: &[(Resolve, WorldId)],
		nebula_config: Option<&NebulaConfig>,
	) -> Result<()> {
		let mut initial = HashSet::new();
		for (input_resolve, input_world_id) in input_worlds {
			let input_world = &input_resolve.worlds[*input_world_id];
			for item in input_world.exports.values() {
				if let WorldItem::Interface { id, .. } = item {
					let interface = &input_resolve.interfaces[*id];
					let package_id = interface.package.with_context(|| {
						format!(
							"exported interface `{}` has no owning package",
							interface.name.as_deref().unwrap_or("<unnamed>")
						)
					})?;
					let package = &input_resolve.packages[package_id];
					initial.insert(package.name.clone());
				}
			}
		}

		let mut pending = initial;
		let mut fetched = HashMap::<PackageName, UnresolvedPackage>::new();

		while !pending.is_empty() {
			let frontier: Vec<PackageName> = pending.drain().collect();
			let mut join_set = JoinSet::new();

			for package_name in frontier {
				let nebula_config = nebula_config.cloned();
				join_set.spawn(async move {
					let unresolved =
						resolve_package(&package_name, nebula_config.as_ref())
							.await?;
					Ok::<_, anyhow::Error>((package_name, unresolved))
				});
			}

			while let Some(join_result) = join_set.join_next().await {
				let (package_name, unresolved) =
					join_result.context("package resolution task failed")??;
				let resolved_name = unresolved.name.clone();
				let remove_alt_key = package_name != resolved_name;

				if proxy_resolve.package_names.contains_key(&resolved_name)
					|| fetched.contains_key(&resolved_name)
				{
					continue;
				}

				for dep_name in unresolved.foreign_deps.keys() {
					if !fetched.contains_key(dep_name)
						&& !proxy_resolve.package_names.contains_key(dep_name)
					{
						pending.insert(dep_name.clone());
					}
				}

				fetched.insert(resolved_name, unresolved);
				if remove_alt_key {
					pending.remove(&package_name);
				}
			}
		}

		let mut remaining = fetched;

		let no_dep_packages: Vec<PackageName> = remaining
			.iter()
			.filter_map(|(name, unresolved)| {
				unresolved.foreign_deps.is_empty().then_some(name.clone())
			})
			.collect();

		for package_name in no_dep_packages {
			let unresolved = remaining.remove(&package_name).unwrap();
			if proxy_resolve.package_names.contains_key(&unresolved.name) {
				continue;
			}
			proxy_resolve.push(unresolved, 0).with_context(|| {
				format!(
					"failed to push package `{package_name}` into proxy \
					 resolve"
				)
			})?;
		}

		while !remaining.is_empty() {
			let ready: Vec<PackageName> = remaining
				.iter()
				.filter_map(|(name, unresolved)| {
					for dep_name in unresolved.foreign_deps.keys() {
						if !proxy_resolve.package_names.contains_key(dep_name) {
							return None;
						}
					}
					Some(name.clone())
				})
				.collect();

			if ready.is_empty() {
				let unresolved_names = remaining
					.keys()
					.map(ToString::to_string)
					.collect::<Vec<_>>()
					.join(", ");
				return Err(anyhow!(
					"could not topologically resolve package dependencies \
					 for: {}",
					unresolved_names
				));
			}

			for package_name in ready {
				let unresolved = remaining.remove(&package_name).unwrap();
				if proxy_resolve.package_names.contains_key(&unresolved.name) {
					continue;
				}
				proxy_resolve.push(unresolved, 0).with_context(|| {
					format!(
						"failed to push package `{package_name}` into proxy \
						 resolve"
					)
				})?;
			}
		}

		Ok(())
	}

	/// Generates Rust bindings for the proxy world using `wit-bindgen` and
	/// writes them into the template project in the output directory.
	fn build_proxy_bindings(
		&self,
		proxy_resolve: &mut Resolve,
		proxy_world: &WorldId,
		output_root: &PathBuf,
	) -> Result<()> {
		let opts = Opts { generate_all: true, ..Default::default() };

		let mut files = Files::default();
		let mut generator = opts.build();
		generator.generate(proxy_resolve, *proxy_world, &mut files)?;

		let Some(generated) = files
			.iter()
			.find_map(|(name, bytes)| name.ends_with(".rs").then_some(bytes))
		else {
			return Err(anyhow!("wit-bindgen did not produce a .rs file"));
		};

		let bindings_file = output_root.join("src/bindings.rs");
		std::fs::write(&bindings_file, generated)?;

		Ok(())
	}

	/// Builds the proxy component using the bindings, composes it with the
	/// input components, and emits the final proxied component into the output
	/// directory.
	fn build_proxy_component(&self, output_root: &PathBuf) -> Result<()> {
		let workspace_root = Path::new(env!("CARGO_MANIFEST_DIR"));

		let status = std::process::Command::new("cargo")
			.current_dir(output_root)
			.args(["build", "--release", "--target", "wasm32-wasip2"])
			.status()
			.with_context(|| {
				format!(
					"failed to run cargo build in {}",
					output_root.display()
				)
			})?;

		if !status.success() {
			anyhow::bail!(
				"cargo build failed in {} with status {}",
				output_root.display(),
				status
			);
		}

		let proxy_wasm =
			output_root.join("target/wasm32-wasip2/release/proxy.wasm");

		if !proxy_wasm.exists() {
			anyhow::bail!(
				"proxy component not found after build: {}",
				proxy_wasm.display()
			);
		}

		let mut graph = wac_graph::CompositionGraph::new();
		let packages =
			register_proxy_packages(&mut graph, workspace_root, output_root)?;

		wire_proxy_composition(&mut graph, &packages)?;

		emit_proxy_composition(&graph, output_root).with_context(|| {
			format!(
				"failed to emit proxied component into {}",
				output_root.display()
			)
		})?;

		info!(
			path = %output_root.join("proxied.wasm").display(),
			"Proxied component written"
		);

		Ok(())
	}
}

/// Prepares the output directory by copying the template project into it, and
/// returns the path to the output directory. If a custom output directory is
/// provided, it is used directly; otherwise, a temporary directory is created
/// for the output.
fn prepare_output_root(custom_output_dir: Option<&Path>) -> Result<PathBuf> {
	let tmp_root = std::env::temp_dir().join("nebula");
	std::fs::create_dir_all(&tmp_root).with_context(|| {
		format!("failed to create tmp directory {}", tmp_root.display())
	})?;

	let output_root = custom_output_dir
		.map(Path::to_path_buf)
		.unwrap_or_else(|| tmp_root.join("wit"));

	if output_root.exists() {
		std::fs::remove_dir_all(&output_root).with_context(|| {
			format!(
				"failed to clean output directory {}",
				output_root.display()
			)
		})?;
	}

	let template_root =
		Path::new(env!("CARGO_MANIFEST_DIR")).join("template/proxy");

	if !template_root.exists() {
		anyhow::bail!(
			"template directory not found: {}",
			template_root.display()
		);
	}

	std::fs::create_dir_all(&output_root).with_context(|| {
		format!("failed to create output directory {}", output_root.display())
	})?;

	let copy_options = CopyOptions {
		overwrite: true,
		content_only: true,
		..Default::default()
	};

	copy(&template_root, &output_root, &copy_options).with_context(|| {
		format!(
			"failed to copy template from {} to {}",
			template_root.display(),
			output_root.display()
		)
	})?;

	let wit_root = output_root.join("wit");
	std::fs::create_dir_all(&wit_root).with_context(|| {
		format!("failed to create output directory {}", wit_root.display())
	})?;

	let marker = tmp_root.join(".last_wit_output");
	std::fs::write(&marker, format!("{}\n", output_root.display()))
		.with_context(|| {
			format!("failed to write marker file {}", marker.display())
		})?;

	Ok(output_root)
}
