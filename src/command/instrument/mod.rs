use std::collections::{BTreeMap, HashMap};
use std::path::{Path, PathBuf};

use anyhow::{Context, Result, bail};
use clap::{Args, ValueEnum};
use splicer::cviz::parse::component::parse_component;
use splicer::lowlevel::{Injection, SpliceRule, split_out_composition};
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

        // 2. Build the splicer rules directly from the discovered interfaces
        //    and requested instrumentation(s).
        let interfaces: Vec<String> = graph.component_exports.keys().cloned().collect();

        let rules = build_splice_rules(&interfaces, &self.instrumentation)?;

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

/// Builds the splicer rules directly from the discovered interfaces and
/// requested instrumentation(s). For each combination of interface and
/// instrumentation, a rule is created that injects the corresponding middleware
/// into the interface.
fn build_splice_rules(
    interfaces: &[String],
    _instrumentation: &[Instrumentation],
) -> Result<Vec<SpliceRule>> {
    if interfaces.is_empty() {
        bail!(
            "no exported interfaces found in component; cannot derive \
			 instrumentation targets"
        );
    }

    let tracing_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("proxies")
        .join("bin")
        .join("tracing.wasm");

    if !tracing_path.exists() {
        bail!(
            "missing tracing proxy component at {}",
            tracing_path.display()
        );
    }

    let tracing_path = tracing_path
        .into_os_string()
        .into_string()
        .map_err(|_| anyhow::anyhow!("tracing proxy path contains non-UTF-8 bytes"))?;

    let rules = vec![SpliceRule::Before {
        interface_glob: "*".to_string(),
        provider_name: None,
        provider_alias: None,
        inject: vec![Injection::from_path("tracing", tracing_path.clone())],
    }];

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
