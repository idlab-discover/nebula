use std::collections::{BTreeMap, HashMap};
use std::path::{Path, PathBuf};

use anyhow::{Context, Result, bail};
use clap::{Args, ValueEnum};
use splicer::cviz::model::CompositionGraph;
use splicer::cviz::parse::component::parse_component;
use splicer::lowlevel::{Injection, SpliceRule, split_out_composition};
use tracing::info;
use wac_graph::EncodeOptions;
use wac_parser::Document;
use wac_resolver::FileSystemPackageResolver;

use crate::command::CliCommand;

#[derive(Clone, Debug, Eq, PartialEq, ValueEnum)]
pub enum Instrumentation {
    Tracing,
}

#[derive(Args)]
pub struct InstrumentCommand {
    /// Path to the input Wasm component to instrument.
    #[arg(value_name = "INPUT")]
    pub input: PathBuf,

    /// Instrumentation(s) to add to every found interface function.
    /// Accepts a comma-separated list, e.g. --instrumentation tracing.
    #[arg(
		short = 'i',
		long = "instrumentation",
		value_enum,
		value_delimiter = ',',
		default_values_t = vec![Instrumentation::Tracing]
	)]
    pub instrumentation: Vec<Instrumentation>,

    /// Output path for the instrumented component.
    #[arg(short, long)]
    pub output: PathBuf,
}

impl CliCommand for InstrumentCommand {
    /// Handles the `instrument` command by parsing the input component,
    /// building the splicer rules based on the requested instrumentation(s),
    /// invoking the splicer to generate the instrumented WAC and its
    /// dependencies, and finally composing the generated WAC into a single
    /// Wasm component and writing it to the specified output path.
    async fn handle(&self) -> Result<()> {
        if self.instrumentation.is_empty() {
            bail!("at least one instrumentation must be provided");
        }

        let input_path = self
            .input
            .canonicalize()
            .with_context(|| format!("failed to resolve input path: {}", self.input.display()))?;

        if !input_path.is_file() {
            bail!("input path is not a file: {}", input_path.display());
        }

        let output_path = &self.output;

        if let Some(parent) = output_path.parent() {
            std::fs::create_dir_all(parent).with_context(|| {
                format!("failed to create output directory: {}", parent.display())
            })?;
        }

        // 1. Read the input component into memory and parse it to extract the
        //    list of exported interfaces, which will be used to derive the
        //    instrumentation targets for the splicing step.
        let input_bytes = std::fs::read(&input_path)
            .with_context(|| format!("failed to read input component: {}", input_path.display()))?;

        let graph = parse_component(&input_bytes)
            .with_context(|| format!("failed to parse component: {}", input_path.display()))?;

        // 2. Build the splicer rules directly from the discovered graph
        //    and requested instrumentation(s).
        let rules = build_splice_rules(&graph)?;

        // 3. Split the component and run the splicer low-level pipeline.
        let splits_dir =
            std::env::temp_dir().join(format!("nebula-splicer-{}", std::process::id()));

        let splits_dir_str = splits_dir
            .to_str()
            .context("splits_dir contains non-UTF-8 bytes")?
            .to_string();

        let (splits_path, shim_comps) = split_out_composition(&input_path, &Some(splits_dir_str))?;

        let wac_out = splicer::lowlevel::generate_wac(
            shim_comps,
            &splits_path,
            &graph,
            &rules,
            None,
            "nebula:instrumented",
        )?;

        // 4. Compose the generated WAC and its dependencies into a single Wasm
        //    component, and write it to the specified output path.
        let working_dir = std::env::current_dir().context("failed to resolve current directory")?;

        let composed = compose_wac_to_component(&wac_out.wac, wac_out.wac_deps, &working_dir)?;

        std::fs::write(&output_path, composed).with_context(|| {
            format!(
                "failed to write instrumented component to {}",
                output_path.display()
            )
        })?;

        println!("Wrote instrumented component to {}", output_path.display());

        Ok(())
    }
}

///
fn injection_suffix(index: usize) -> String {
    if index < 26 {
        return ((b'a' + index as u8) as char).to_string();
    }

    // Skip "aa"
    let n = index - 25;

    let first = ((n / 25) % 26) as u8;
    let second = ((n % 25) + 1) as u8;

    format!("{}{}", (b'a' + first) as char, (b'a' + second) as char)
}

fn build_splice_rules(graph: &CompositionGraph) -> Result<Vec<SpliceRule>> {
    let tracing_path = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("proxies/bin/tracing.wasm");

    if !tracing_path.exists() {
        bail!(
            "missing tracing proxy component at {}",
            tracing_path.display()
        );
    }

    let tracing_path = tracing_path
        .into_os_string()
        .into_string()
        .map_err(|_| anyhow::anyhow!("Could not map tracing path to string"))?;

    let mut rules = Vec::new();
    let mut injection_idx = 0;

    let mut push_rule = |interface: String, provider_name: String| {
        let name = format!("tracing-{}", injection_suffix(injection_idx));
        injection_idx += 1;

        rules.push(SpliceRule::Before {
            interface,
            provider_name: Some(provider_name),
            provider_alias: None,
            inject: vec![Injection::from_path(name, tracing_path.clone())],
        });
    };

    for (iface, export) in &graph.component_exports {
        let provider = graph.nodes[&export.source_instance].name.clone();
        push_rule(iface.clone(), provider);
    }

    for node in graph.real_nodes() {
        for import in &node.imports {
            if let Some(source) = &import.source_instance {
                let provider = graph.nodes[source].name.clone();
                push_rule(import.interface_name.clone(), provider);
            }
        }
    }

    info!(?rules);

    Ok(rules)
}

/// Composes the generated WAC and its dependencies into a single Wasm
/// component.
fn compose_wac_to_component(
    wac: &str,
    deps: BTreeMap<String, PathBuf>,
    working_dir: &Path,
) -> Result<Vec<u8>> {
    let doc = Document::parse(wac).context("failed to parse generated WAC")?;
    let keys = wac_resolver::packages(&doc)?;

    let overrides: HashMap<String, PathBuf> = deps.into_iter().collect();
    let resolver = FileSystemPackageResolver::new(working_dir, overrides, true);
    let pkgs = resolver.resolve(&keys)?;

    let resolution = doc.resolve(pkgs)?;
    let encoded = resolution.encode(EncodeOptions::default())?;

    Ok(encoded)
}
