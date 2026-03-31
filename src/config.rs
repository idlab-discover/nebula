use std::collections::HashMap;
use std::io::ErrorKind;
use std::path::PathBuf;

use anyhow::{Context, Result};
use serde::Deserialize;

#[derive(Clone, Debug, Deserialize)]
pub struct NebulaConfig {
	#[serde(default)]
	package: PackageConfig,
}

#[derive(Clone, Debug, Default, Deserialize)]
struct PackageConfig {
	#[serde(default)]
	overrides: HashMap<String, OverridePath>,
}

#[derive(Clone, Debug, Deserialize)]
struct OverridePath {
	path: PathBuf,
}

impl NebulaConfig {
	/// Attempts to load the `nebula.toml` configuration file from the current
	/// workspace.
	pub async fn load_from_workspace() -> Result<Option<Self>> {
		match tokio::fs::read_to_string("nebula.toml").await {
			Ok(contents) => {
				let config = toml::from_str::<NebulaConfig>(&contents)
					.context("failed to parse nebula.toml")?;
				Ok(Some(config))
			},
			Err(err) if err.kind() == ErrorKind::NotFound => Ok(None),
			Err(err) => Err(err).context("failed to read nebula.toml"),
		}
	}

	/// Checks if there is an override path for the given package name in the
	/// configuration.
	pub fn override_path_for(&self, package_name: &str) -> Option<&PathBuf> {
		self.package.overrides.get(package_name).map(|entry| &entry.path)
	}
}
