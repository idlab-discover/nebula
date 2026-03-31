use clap::Parser;

use crate::command::{CliCommand, NebulaCli};
use crate::config::NebulaConfig;

pub mod command;
pub mod config;
pub mod util;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
	// Initialize logging with tracing, using a compact format and no target
	// field.
	tracing_subscriber::fmt().with_target(false).compact().init();

	// Parse the command-line arguments and execute the specified command.
	let cfg = NebulaConfig::load_from_workspace().await?;
	let cli = NebulaCli::parse();
	cli.command.handle(cfg.as_ref()).await
}
