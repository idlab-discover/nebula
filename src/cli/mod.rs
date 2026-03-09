mod instrument;

use anyhow::Result;
use clap::{Parser, Subcommand};

use crate::cli::instrument::InstrumentCommand;

#[derive(Parser)]
#[command(name = "nebula", version, about)]
pub struct NebulaCli {
	#[command(subcommand)]
	pub command: NebulaCliCommand,
}

/// A trait that defines the interface for all CLI commands
pub trait CliCommand {
	async fn handle(&self) -> Result<()>;
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
	async fn handle(&self) -> Result<()> {
		match self {
			NebulaCliCommand::Instrument(cmd) => cmd.handle().await,
		}
	}
}
