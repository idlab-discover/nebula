use std::collections::BTreeSet;
use std::path::Path;

use anyhow::{Context, Result};
use wit_bindgen_core::{Files, WorldGenerator};
use wit_parser::{Resolve, WorldId, WorldItem};

/// Builds wit-bindgen options for a proxy world by generating `with` mappings
/// for all imported interfaces.
pub fn generate_bindgen_options(
	resolve: &Resolve,
	world: WorldId,
) -> wit_bindgen_rust::Opts {
	let mut with_keys = BTreeSet::new();
	for (key, item) in &resolve.worlds[world].imports {
		if let WorldItem::Interface { .. } = item {
			with_keys.insert(resolve.name_world_key(key));
		}
	}

	let mut opts = wit_bindgen_rust::Opts::default();
	opts.with = with_keys
		.into_iter()
		.map(|key| (key, wit_bindgen_rust::WithOption::Generate))
		.collect();

	opts
}

/// Runs wit-bindgen with the provided options and returns generated files.
pub fn generate_bindings(
	resolve: &mut Resolve,
	world: WorldId,
	opts: wit_bindgen_rust::Opts,
) -> Result<Files> {
	let mut files = Files::default();
	let mut generator = opts.build();
	generator.generate(resolve, world, &mut files)?;
	Ok(files)
}

/// Emits generated Rust bindings to `src/bindings.rs` in the output project.
pub fn emit_world_bindings(output_root: &Path, generated: &[u8]) -> Result<()> {
	let bindings_file = output_root.join("src/bindings.rs");
	std::fs::write(&bindings_file, generated)
		.with_context(|| format!("failed to write {}", bindings_file.display()))
}
