use std::fs;

use anyhow::Result;
use clap::Args;
use wirm::Component;
use wirm::ir::component::Component as IrComponent;
use wirm::wasmparser::{ComponentExternalKind, ComponentTypeRef};

use super::CliCommand;

#[derive(Args)]
pub struct InstrumentCommand {
	#[clap(long = "file", help = "Path to the WASM component to instrument")]
	pub path: String,
}

impl CliCommand for InstrumentCommand {
	async fn handle(&self) -> Result<()> {
		let buff = fs::read(&self.path)?;
		let comp = Component::parse(&buff, false, false)?;

		walk_component(&comp);

		Ok(())
	}
}

fn walk_component(comp: &IrComponent) {
	// Component-level function imports (e.g. WASI HTTP incoming-handler)
	for import in comp.imports.iter() {
		if matches!(import.ty, ComponentTypeRef::Func(_)) {
			println!("import: {}", import.name.0);
		}
	}

	// Component-level function exports (e.g. create-order)
	for export in comp.exports.iter() {
		if matches!(export.kind, ComponentExternalKind::Func) {
			println!("export: {}", export.name.0);
		}
	}

	for nested in comp.components.iter() {
		walk_component(nested);
	}
}
