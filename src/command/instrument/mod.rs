mod bindings;
mod codegen;
mod wit;

use std::path::{Path, PathBuf};

use anyhow::{Context, Result, anyhow};
use clap::Args;
use fs_extra::dir::{CopyOptions, copy};
use tracing::info;
use wit_component::WitPrinter;
use wit_parser::{Resolve, WorldId};

use self::bindings::{
	emit_world_bindings,
	generate_bindgen_options,
	generate_bindings,
};
use self::wit::{
	decode_to_world,
	emit_wit_package,
	emit_wit_world,
	get_exported_interface_refs,
};
use crate::command::CliCommand;
use crate::util::resolve_input_paths;

struct ProxyResolve {
	resolve: Resolve,
	world:   WorldId,
}

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
	fn handle(&self) -> Result<()> {
		let wasm_files = resolve_input_paths(&self.paths, true)?;
		let output_root = prepare_output_root(self.output_dir.as_deref())?;

		// 1. Build the proxy world by decoding the input WASM files, extracting
		//    their exported interfaces, and generating WIT files for them and a
		//    proxy world that imports and re-exports those interfaces.
		let mut proxy = self.build_proxy_wit(&wasm_files, &output_root)?;

		// 2. Build the proxy bindings by running wit-bindgen on the generated
		//    proxy world, configuring it to only generate bindings for the
		//    interfaces imported by the proxy world.
		self.build_proxy_bindings(&output_root, &mut proxy)?;

		// 3. Build the proxy implementation by rendering the `lib.rs` source
		//    file for the proxy crate, which contains the implementation of the
		//    proxy world that forwards calls to the imported interfaces, and
		//    writing it to the output directory.
		self.build_proxy_implementation(&output_root, &proxy)?;

		info!(path = %output_root.display(), "Template project written");
		Ok(())
	}
}

impl InstrumentCommand {
	/// Builds the proxy world by decoding the input WASM files, extracting
	/// their exported interfaces, and generating WIT files for them and a proxy
	/// world that imports and re-exports those interfaces.
	fn build_proxy_wit(
		&self,
		wasm_files: &[PathBuf],
		output_root: &PathBuf,
	) -> Result<ProxyResolve> {
		let wit_output_root = output_root.join("wit");
		let mut exported_interface_refs: Vec<String> = Vec::new();

		for wasm_file in wasm_files {
			// Decode the WASM file to a WIT world.
			let wasm_bytes = std::fs::read(wasm_file)?;
			let (resolve, world_id) = decode_to_world(&wasm_bytes, wasm_file)?;

			// Collect the package/interface refs exported by this WASM
			// component.
			let refs = get_exported_interface_refs(&resolve, world_id)?;
			exported_interface_refs.extend(refs);

			// For each package in the component's dependency graph, emit a WIT
			// file containing just that package. This allows the generated
			// world to import from these packages.
			for package_id in resolve.topological_packages() {
				let package = &resolve.packages[package_id];

				if package.interfaces.is_empty() {
					continue;
				}

				let mut local = resolve.clone();
				local.packages[package_id].worlds.clear();

				let mut printer = WitPrinter::default();
				printer.print(&local, package_id, &[])?;
				let wit_text = printer.output.to_string();

				emit_wit_package(&wit_output_root, &package.name, &wit_text)?;
			}
		}

		emit_wit_world(&wit_output_root, &exported_interface_refs)?;
		info!(path = %wit_output_root.display(), "WIT output written");

		// Load the generated WIT files into a new Resolve to prepare for
		// generating bindings.
		let mut resolve = Resolve::default();
		let (main_package, _) =
			resolve.push_path(&wit_output_root).with_context(|| {
				format!("failed to load WIT from {}", wit_output_root.display())
			})?;

		let world = resolve
			.select_world(&[main_package], Some("proxy"))
			.context("failed to select world 'proxy' from generated WIT")?;

		let proxy_resolve = ProxyResolve { resolve, world };

		Ok(proxy_resolve)
	}

	/// Builds the proxy bindings by running wit-bindgen on the generated proxy
	/// world, configuring it to only generate bindings for the interfaces
	/// imported by the proxy world.
	fn build_proxy_bindings(
		&self,
		output_root: &PathBuf,
		proxy: &mut ProxyResolve,
	) -> Result<()> {
		let opts = generate_bindgen_options(&proxy.resolve, proxy.world);
		let files = generate_bindings(&mut proxy.resolve, proxy.world, opts)?;

		let Some(generated) = files
			.iter()
			.find_map(|(name, bytes)| name.ends_with(".rs").then_some(bytes))
		else {
			return Err(anyhow!("wit-bindgen did not produce a .rs file"));
		};

		emit_world_bindings(output_root, generated)?;

		Ok(())
	}

	/// Builds the proxy implementation by rendering the `lib.rs` source file
	/// for the proxy crate, which contains the implementation of the proxy
	/// world that forwards calls to the imported interfaces, and writing it to
	/// the output directory.
	fn build_proxy_implementation(
		&self,
		_output_root: &PathBuf,
		_proxy: &ProxyResolve,
	) -> Result<()> {
		todo!()
	}
}

/// Creates the output directory under the system temp directory and stores the
/// chosen path in `.last_wit_output` for later steps to reuse.
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
		Path::new(env!("CARGO_MANIFEST_DIR")).join("templates/proxy");
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
