use anyhow::{Context, Result, anyhow};
use bytes::Bytes;
use futures::TryStreamExt;
use wasm_pkg_client::{
	caching::{CachingClient, FileCache},
	Client,
	PackageRef,
	Version,
};
use wit_component::{DecodedWasm, WitPrinter, decode};
use wit_parser::{PackageName, UnresolvedPackage, UnresolvedPackageGroup};

use crate::config::NebulaConfig;

/// Fetches a package from the local filesystem if an override exists,
/// otherwise fetches from the registry.
pub async fn resolve_package(
	pkg_name: &PackageName,
	nebula_config: Option<&NebulaConfig>,
) -> Result<UnresolvedPackage> {
	let pkg_ref = PackageRef::try_from(format!(
		"{}:{}",
		pkg_name.namespace, pkg_name.name
	))?;

	// Check for an override path in the configuration, and if one exists,
	// attempt to load the package from that path instead of the registry.
	let override_path = nebula_config
		.and_then(|c| c.override_path_for(&pkg_ref.to_string()).cloned());

	if let Some(path) = override_path {
		let group = UnresolvedPackageGroup::parse_dir(path)?;

		return std::iter::once(&group.main)
			.chain(&group.nested)
			.find(|pkg| pkg.name == *pkg_name)
			.cloned()
			.ok_or_else(|| {
				anyhow!("Package {pkg_name} not found in override")
			});
	}

	// If no override is found, proceed to fetch the package from the registry.
	let client = Client::with_global_defaults().await?;
	let pkg_ver = resolve_registry_version(&client, &pkg_ref, pkg_name).await?;
	let binary = if let Ok(file_cache) = FileCache::global_cache().await {
		let caching_client = CachingClient::new(Some(client.clone()), file_cache);
		let release = caching_client.get_release(&pkg_ref, &pkg_ver).await?;
		let chunks: Vec<Bytes> = caching_client
			.get_content(&pkg_ref, &release)
			.await?
			.try_collect()
			.await?;
		chunks.concat()
	} else {
		let release = client.get_release(&pkg_ref, &pkg_ver).await?;
		let chunks: Vec<Bytes> =
			client.stream_content(&pkg_ref, &release).await?.try_collect().await?;
		chunks.concat()
	};

	decode_registry_wit_package(&binary, pkg_name)
}

/// Resolves the version of a package from the registry, using the specified
/// version if provided, or selecting the best available version otherwise.
async fn resolve_registry_version(
	client: &Client,
	pkg_ref: &PackageRef,
	pkg_name: &PackageName,
) -> Result<Version> {
	if let Some(version) = &pkg_name.version {
		return Version::parse(&version.to_string()).with_context(|| {
			format!("invalid package version for `{pkg_name}`")
		});
	}

	// If no version is specified, fetch the list of available versions.
	let versions = client
		.list_all_versions(pkg_ref)
		.await
		.with_context(|| format!("failed to list versions for `{pkg_name}`"))?;

	// Select the best available version, preferring non-yanked versions and
	// using semantic versioning to determine the latest version.
	let best_version = versions
		.iter()
		.filter(|info| !info.yanked)
		.max_by(|a, b| a.version.cmp(&b.version))
		.map(|info| info.version.clone())
		.ok_or_else(|| anyhow!("no non-yanked versions found"));

	best_version
}

/// Decodes a WIT package from the registry binary content, returning an
/// `UnresolvedPackage` that can be used for further processing.
fn decode_registry_wit_package(
	binary: &[u8],
	pkg_name: &PackageName,
) -> Result<UnresolvedPackage> {
	// Decode the binary content as a WIT package, ensuring that it is valid and
	// well-formed.
	let decoded_package = decode(binary).with_context(|| {
		format!("failed to decode registry package `{pkg_name}` as WIT")
	})?;

	// Ensure that the decoded package is a WIT package and extract the resolve
	// and package ID information.
	let DecodedWasm::WitPackage(resolve, package_id) = decoded_package else {
		return Err(anyhow!(
			"registry package `{pkg_name}` was not a WIT package"
		));
	};

	// Use the WitPrinter to convert the resolved WIT package into a string
	// format that can be parsed by the UnresolvedPackageGroup parser.
	let mut printer = WitPrinter::default();
	printer
		.print(&resolve, package_id, &[])
		.with_context(|| format!("failed to print WIT for `{pkg_name}`"))?;

	// Parse the printed WIT output to create an UnresolvedPackageGroup.
	let unresolved_group = UnresolvedPackageGroup::parse(
		format!("{pkg_name}.wit"),
		&printer.output.to_string(),
	)?;

	Ok(unresolved_group.main)
}
