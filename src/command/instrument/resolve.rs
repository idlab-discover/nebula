use std::time::{SystemTime, UNIX_EPOCH};

use anyhow::{Context, Result, anyhow};
use tokio::task::JoinSet;
use wasm_pkg_client::Client;
use wasm_pkg_client::caching::{CachingClient, FileCache};
use wasm_pkg_core::resolver::{
	Dependency,
	DependencyResolver,
	RegistryPackage,
};
use wasm_pkg_core::wit::{OutputType, populate_dependencies};
use wit_component::WitPrinter;
use wit_parser::{PackageId, PackageName, Resolve, UnresolvedPackageGroup};

#[derive(Debug, Clone)]
pub struct ResolvedPackageWit {
	pub package_name: PackageName,
	pub wit_text:     String,
}

/// Resolves WIT for the given decoded WASM components by emitting local WIT
/// for non-WASI dependencies.
pub async fn resolve_custom_package_wit(
	package_ids: &[PackageId],
	resolve: &Resolve,
) -> Result<Vec<ResolvedPackageWit>> {
	let mut packages = Vec::new();
	let mut tasks: JoinSet<Result<ResolvedPackageWit>> = JoinSet::new();

	for package_id in package_ids.iter().copied() {
		let resolve = resolve.clone();

		tasks.spawn_blocking(move || -> Result<ResolvedPackageWit> {
			let package_name = resolve.packages[package_id].name.clone();
			let wit_text = {
				let mut local = resolve;
				local.packages[package_id].worlds.clear();

				let mut printer = WitPrinter::default();
				printer.print(&local, package_id, &[])?;
				printer.output.to_string()
			};

			Ok(ResolvedPackageWit { package_name, wit_text })
		});
	}

	while let Some(task) = tasks.join_next().await {
		let package =
			task.context("custom package resolve task panicked")??;
		packages.push(package);
	}

	Ok(packages)
}

/// Resolves WASI package WIT by fetching from configured registries instead of
/// using stripped local definitions from the decoded component.
/// TODO: simplify
pub async fn resolve_wasi_package_wit(
	package_ids: &[PackageId],
	resolve: &Resolve,
) -> Result<Vec<ResolvedPackageWit>> {
	if package_ids.is_empty() {
		return Ok(Vec::new());
	}

	let cache = FileCache::global_cache()
		.await
		.context("failed to initialize wasm-pkg cache")?;
	let client = Client::with_global_defaults()
		.await
		.context("failed to initialize wasm-pkg client")?;
	let client = CachingClient::new(Some(client), cache);

	let mut resolver = DependencyResolver::new_with_client(client, None)
		.context("failed to initialize WASI dependency resolver")?;

	for package_id in package_ids {
		let package_name = &resolve.packages[*package_id].name;
		if package_name.namespace != "wasi" {
			continue;
		}

		let package_ref: wasm_pkg_client::PackageRef =
			format!("{}:{}", package_name.namespace, package_name.name)
				.parse()
				.with_context(|| {
					format!(
						"failed to parse package ref {}:{}",
						package_name.namespace, package_name.name
					)
				})?;

		let version_req = package_name
			.version
			.as_ref()
			.map(|version| format!("={version}"))
			.unwrap_or_else(|| "*".to_string())
			.parse()
			.with_context(|| {
				format!(
					"failed to parse version requirement for package {}",
					package_name
				)
			})?;

		resolver
			.add_dependency(
				&package_ref,
				&Dependency::Package(RegistryPackage {
					name:     Some(package_ref.clone()),
					version:  version_req,
					registry: None,
				}),
			)
			.await
			.with_context(|| {
				format!("failed to add WASI dependency {}", package_ref)
			})?;
	}

	let dependency_map = resolver
		.resolve()
		.await
		.context("failed to resolve WASI dependencies from registry")?;

	if dependency_map.is_empty() {
		return Ok(Vec::new());
	}

	let ts = SystemTime::now()
		.duration_since(UNIX_EPOCH)
		.context("system clock is before UNIX_EPOCH")?
		.as_nanos();
	let tmp_root = std::env::temp_dir().join(format!("nebula-wasi-{ts}"));
	std::fs::create_dir_all(&tmp_root)
		.with_context(|| format!("failed to create {}", tmp_root.display()))?;

	let placeholder_world = tmp_root.join("world.wit");
	std::fs::write(
		&placeholder_world,
		"package nebula:wasi-resolver;\n\nworld resolver {}\n",
	)
	.with_context(|| {
		format!(
			"failed to write temporary root world {}",
			placeholder_world.display()
		)
	})?;

	populate_dependencies(&tmp_root, &dependency_map, OutputType::Wit)
		.await
		.context("failed to populate WASI dependencies")?;

	let deps_root = tmp_root.join("deps");
	let mut packages = Vec::new();

	if deps_root.exists() {
		for entry in std::fs::read_dir(&deps_root).with_context(|| {
			format!("failed to read {}", deps_root.display())
		})? {
			let entry = entry?;
			let dep_dir = entry.path();
			if !dep_dir.is_dir() {
				continue;
			}

			let package_file = dep_dir.join("package.wit");
			if !package_file.exists() {
				continue;
			}

			let wit_text = std::fs::read_to_string(&package_file)
				.with_context(|| {
					format!("failed to read {}", package_file.display())
				})?;
			let parsed =
				UnresolvedPackageGroup::parse(&package_file, &wit_text)
					.with_context(|| {
						format!(
							"failed to parse generated WIT package {}",
							package_file.display()
						)
					})?;

			packages.push(ResolvedPackageWit {
				package_name: parsed.main.name,
				wit_text,
			});
		}
	}

	let _ = std::fs::remove_dir_all(&tmp_root);

	if packages.is_empty() {
		return Err(anyhow!(
			"no WASI packages were generated under {}",
			deps_root.display()
		));
	}

	Ok(packages)
}
