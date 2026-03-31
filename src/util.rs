use std::path::{Path, PathBuf};

use anyhow::{Result, anyhow};
use tracing::warn;
use walkdir::WalkDir;

/// Resolves the input paths to a list of .wasm files, scanning directories
///
/// # Errors
///
/// This function will return an error if no .wasm files are found in the
/// provided input paths.
pub fn resolve_input_paths(
	paths: &Vec<PathBuf>,
	wasm_only: bool,
) -> Result<Vec<PathBuf>> {
	let wasm_files: Vec<PathBuf> = paths
		.iter()
		.flat_map(|root| {
			if !root.exists() {
				warn!(path = %root.display(), "Input path does not exist");
			}

			WalkDir::new(root)
				.into_iter()
				.filter_map(|e| {
					match e {
						Ok(entry) => Some(entry),
						Err(err) => {
							warn!(error = %err, "Skipping unreadable path while scanning");
							None
						},
					}
				})
				.filter(|e| !wasm_only || is_wasm_file(e.path()))
				.map(|e| e.into_path())
		})
		.collect();

	if wasm_files.is_empty() {
		return Err(anyhow!(
			"No .wasm files found in the provided input path(s)"
		));
	}

	Ok(wasm_files)
}

/// Checks if a file has a .wasm extension.
fn is_wasm_file(path: &Path) -> bool {
	path.extension().map_or(false, |ext| ext.eq_ignore_ascii_case("wasm"))
}
