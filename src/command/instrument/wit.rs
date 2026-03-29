use std::path::Path;

use anyhow::{Context, Result, anyhow};
use wit_parser::decoding::{DecodedWasm, decode};
use wit_parser::{PackageName, Resolve, WorldId, WorldItem, WorldKey};

/// Emits a WIT file containing the given package WIT text.
pub fn emit_wit_package(
	output_root: &Path,
	name: &PackageName,
	wit_text: &str,
) -> Result<String> {
	let dep_name = wit_dependency_dir_name(name);
	let dep_dir = output_root.join("deps").join(&dep_name);
	std::fs::create_dir_all(&dep_dir).with_context(|| {
		format!("failed to create dependency dir {}", dep_dir.display())
	})?;

	let package_file = dep_dir.join("package.wit");
	std::fs::write(&package_file, wit_text).with_context(|| {
		format!("failed to write {}", package_file.display())
	})?;

	Ok(dep_name)
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
		r#"package nebula:proxy;

world proxy {{
	{}

	{}
}}
"#,
		imports, exports
	);

	let world_file = output_root.join("world.wit");
	std::fs::write(&world_file, &world_text)
		.with_context(|| format!("failed to write {}", world_file.display()))?;

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
			let world =
				resolve.select_world(&[package], None).with_context(|| {
					"decoded file is a WIT package with no unambiguous world"
				})?;
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

fn wit_dependency_dir_name(package_name: &PackageName) -> String {
	let base = format!("{}-{}", package_name.namespace, package_name.name)
		.replace(':', "-")
		.replace('@', "-");

	match &package_name.version {
		Some(version) => format!("{}-{}", base, version),
		None => base,
	}
}
