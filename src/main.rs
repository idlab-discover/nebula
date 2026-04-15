use clap::Parser;

use crate::command::{CliCommand, NebulaCli};

pub mod command;
pub mod util;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
	// Initialize logging with tracing, using a compact format and no target
	// field.
	tracing_subscriber::fmt().with_target(false).compact().init();
	// Parse the command-line arguments and execute the specified command.
	let cli = NebulaCli::parse();
	// Handle the command, passing in the loaded configuration if it exists.
	cli.command.handle().await
}
