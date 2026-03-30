use std::collections::HashSet;
use std::path::Path;

use anyhow::{Context, Result, anyhow};
use wit_parser::decoding::{DecodedWasm, decode};
use wit_parser::{
	PackageId,
	PackageName,
	Resolve,
	WorldId,
	WorldItem,
	WorldKey,
};

use crate::command::instrument::resolve::{
	ResolvedPackageWit,
	resolve_custom_package_wit,
	resolve_wasi_package_wit,
};

/// Emits local, non-WASI package WIT files from the given package IDs.
pub async fn emit_custom_packages(
	output_root: &Path,
	batches: &[(Vec<PackageId>, Resolve)],
) -> Result<()> {
	let mut packages = Vec::new();
	for (package_ids, resolve) in batches {
		let mut resolved =
			resolve_custom_package_wit(package_ids, resolve).await?;
		packages.append(&mut resolved);
	}
	write_packages(output_root, packages)
}

/// Emits full WASI package WIT files by resolving from configured registries
/// instead of using stripped local definitions from the decoded component.
pub async fn emit_wasi_packages(
	output_root: &Path,
	batches: &[(Vec<PackageId>, Resolve)],
) -> Result<()> {
	let mut packages = Vec::new();
	for (package_ids, resolve) in batches {
		let mut resolved =
			resolve_wasi_package_wit(package_ids, resolve).await?;
		packages.append(&mut resolved);
	}
	write_packages(output_root, packages)
}

/// Emits a WIT world file that imports and re-exports the given interfaces.
pub fn emit_wit_world(
	output_root: &Path,
	exported_refs: &[String],
) -> Result<String> {
	let imports = exported_refs
		.iter()
		.map(|export_ref| format!("  import {};", export_ref))
		.collect::<Vec<_>>()
		.join("\n");

	let exports = exported_refs
		.iter()
		.map(|export_ref| format!("  export {};", export_ref))
		.collect::<Vec<_>>()
		.join("\n");

	let world_text = format!(
		"package nebula:proxy;\n\nworld proxy {{\n{}\n\n{}\n}}\n",
		imports, exports
	);

	let world_file = output_root.join("world.wit");
	std::fs::write(&world_file, &world_text)?;

	Ok(world_text)
}

/// Decodes the given bytes as either a WIT package or a component, returning
/// the resolved world and its resolver.
pub fn decode_to_world(
	bytes: &[u8],
	source: &Path,
) -> Result<(Resolve, WorldId)> {
	let decoded = decode(bytes).with_context(|| {
		format!("failed to decode interface types from {}", source.display())
	})?;

	match decoded {
		DecodedWasm::Component(resolve, world) => Ok((resolve, world)),
		DecodedWasm::WitPackage(resolve, package) => {
			let world = resolve.select_world(&[package], None)?;
			Ok((resolve, world))
		},
	}
}

/// Scans the given resolved world for all exported interfaces and returns a
/// list of their package-qualified refs.
pub fn get_exported_interface_refs(
	resolve: &Resolve,
	world_id: WorldId,
) -> Result<Vec<String>> {
	let mut refs = Vec::new();
	let world = &resolve.worlds[world_id];

	for (key, item) in &world.exports {
		let WorldItem::Interface { id, .. } = item else {
			continue;
		};

		let interface = &resolve.interfaces[*id];
		let package_id = interface.package.ok_or_else(|| {
			anyhow!("exported interface is missing package metadata")
		})?;

		let package = &resolve.packages[package_id].name;

		let interface_name = interface
			.name
			.clone()
			.or_else(|| {
				match key {
					WorldKey::Name(name) => Some(name.clone()),
					WorldKey::Interface(_) => None,
				}
			})
			.ok_or_else(|| anyhow!("exported interface is missing a name"))?;

		refs.push(get_interface_ref(package, &interface_name));
	}

	refs.sort();
	refs.dedup();

	Ok(refs)
}

/// Get a package-qualified ref for an interface, including version if
/// available.
fn get_interface_ref(package: &PackageName, interface_name: &str) -> String {
	let mut out =
		format!("{}:{}/{}", package.namespace, package.name, interface_name);

	if let Some(version) = &package.version {
		out.push_str(&format!("@{}", version));
	}

	out
}

/// Get the directory name to use for a package dependency, including version if
/// available, and replacing characters that aren't suitable for file paths.
fn wit_dependency_dir_name(package_name: &PackageName) -> String {
	let base = format!("{}-{}", package_name.namespace, package_name.name)
		.replace(':', "-")
		.replace('@', "-");

	match &package_name.version {
		Some(version) => format!("{}-{}", base, version),
		None => base,
	}
}

fn write_packages(
	output_root: &Path,
	packages: Vec<ResolvedPackageWit>,
) -> Result<()> {
	let mut seen = HashSet::new();

	for package in packages {
		let dep_name = wit_dependency_dir_name(&package.package_name);
		if !seen.insert(dep_name.clone()) {
			continue;
		}

		let dep_dir = output_root.join("deps").join(&dep_name);
		std::fs::create_dir_all(&dep_dir).with_context(|| {
			format!("failed to create dependency dir {}", dep_dir.display())
		})?;

		let package_file = dep_dir.join("package.wit");
		std::fs::write(&package_file, package.wit_text).with_context(|| {
			format!("failed to write {}", package_file.display())
		})?;
	}

	Ok(())
}
