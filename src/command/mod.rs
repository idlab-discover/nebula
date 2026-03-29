pub mod instrument;

use anyhow::Result;
use clap::{Parser, Subcommand};

use crate::command::instrument::InstrumentCommand;

#[derive(Parser)]
#[command(name = "nebula", version, about)]
pub struct NebulaCli {
	#[command(subcommand)]
	pub command: NebulaCliCommand,
}

/// A trait that defines the interface for all CLI commands
pub trait CliCommand {
	fn handle(&self) -> Result<()>;
}

#[derive(Subcommand)]
pub enum NebulaCliCommand {
	#[clap(
		name = "instrument",
		long_about = "Instrument a WASM component with OTEL tracing"
	)]
	Instrument(InstrumentCommand),
}

impl CliCommand for NebulaCliCommand {
	fn handle(&self) -> Result<()> {
		match self {
			NebulaCliCommand::Instrument(cmd) => cmd.handle(),
		}
	}
}
