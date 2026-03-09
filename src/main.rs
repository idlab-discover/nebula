use clap::Parser;

use crate::cli::{CliCommand, NebulaCli};

mod cli;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
	let cli = NebulaCli::parse();
	cli.command.handle().await
}
