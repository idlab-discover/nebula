use std::path::Path;

use anyhow::Result;
use wac_graph::types::Package;
use wac_graph::{CompositionGraph, EncodeOptions};

pub struct RegisteredPackages {
	pub service: wac_graph::PackageId,
	pub gateway: wac_graph::PackageId,
	pub proxy:   wac_graph::PackageId,
}

pub fn register_proxy_packages(
	graph: &mut CompositionGraph,
	workspace_root: &Path,
	output_root: &Path,
) -> Result<RegisteredPackages> {
	let service_path = workspace_root.join("input/service.wasm");
	let gateway_path = workspace_root.join("input/gateway.wasm");
	let proxy_path =
		output_root.join("target/wasm32-wasip2/release/proxy.wasm");

	let service_package = Package::from_file(
		"nebula:service",
		None,
		&service_path,
		graph.types_mut(),
	)?;

	let gateway_package = Package::from_file(
		"nebula:gateway",
		None,
		&gateway_path,
		graph.types_mut(),
	)?;

	let proxy_package = Package::from_file(
		"nebula:proxy",
		None,
		&proxy_path,
		graph.types_mut(),
	)?;

	let service = graph.register_package(service_package)?;
	let gateway = graph.register_package(gateway_package)?;
	let proxy = graph.register_package(proxy_package)?;

	Ok(RegisteredPackages { service, gateway, proxy })
}

pub fn wire_proxy_composition(
	graph: &mut CompositionGraph,
	packages: &RegisteredPackages,
) -> Result<()> {
	let service = graph.instantiate(packages.service);
	let gateway_bootstrap = graph.instantiate(packages.gateway);
	let proxy_service = graph.instantiate(packages.proxy);
	let gateway = graph.instantiate(packages.gateway);
	let proxy_http = graph.instantiate(packages.proxy);

	// Service exports
	let service_orders =
		graph.alias_instance_export(service, "nebula:service/orders")?;
	let service_quotes =
		graph.alias_instance_export(service, "nebula:service/quotes")?;

	// Bootstrap gateway instance provides an initial incoming-handler so
	// proxy-service does not rely on a composition-level import.
	graph.set_instantiation_argument(
		gateway_bootstrap,
		"nebula:service/orders",
		service_orders,
	)?;
	graph.set_instantiation_argument(
		gateway_bootstrap,
		"nebula:service/quotes",
		service_quotes,
	)?;
	let gateway_bootstrap_http = graph.alias_instance_export(
		gateway_bootstrap,
		"wasi:http/incoming-handler@0.2.10",
	)?;

	// First proxy instance, used as provider for gateway imports.
	graph.set_instantiation_argument(
		proxy_service,
		"nebula:service/orders",
		service_orders,
	)?;
	graph.set_instantiation_argument(
		proxy_service,
		"nebula:service/quotes",
		service_quotes,
	)?;
	graph.set_instantiation_argument(
		proxy_service,
		"wasi:http/incoming-handler@0.2.10",
		gateway_bootstrap_http,
	)?;

	let proxy_service_orders =
		graph.alias_instance_export(proxy_service, "nebula:service/orders")?;
	let proxy_service_quotes =
		graph.alias_instance_export(proxy_service, "nebula:service/quotes")?;

	// Gateway imports come from proxy exports.
	graph.set_instantiation_argument(
		gateway,
		"nebula:service/orders",
		proxy_service_orders,
	)?;
	graph.set_instantiation_argument(
		gateway,
		"nebula:service/quotes",
		proxy_service_quotes,
	)?;

	let gateway_http = graph
		.alias_instance_export(gateway, "wasi:http/incoming-handler@0.2.10")?;

	// Second proxy instance wraps gateway incoming handler for final export.
	graph.set_instantiation_argument(
		proxy_http,
		"wasi:http/incoming-handler@0.2.10",
		gateway_http,
	)?;
	graph.set_instantiation_argument(
		proxy_http,
		"nebula:service/orders",
		service_orders,
	)?;
	graph.set_instantiation_argument(
		proxy_http,
		"nebula:service/quotes",
		service_quotes,
	)?;

	let final_handler = graph.alias_instance_export(
		proxy_http,
		"wasi:http/incoming-handler@0.2.10",
	)?;
	graph.export(final_handler, "wasi:http/incoming-handler@0.2.10")?;

	Ok(())
}

pub fn emit_proxy_composition(
	graph: &CompositionGraph,
	output_root: &Path,
) -> Result<()> {
	let bytes = graph.encode(EncodeOptions::default())?;

	let output_file = output_root.join("proxied.wasm");
	std::fs::write(&output_file, bytes)?;

	Ok(())
}
