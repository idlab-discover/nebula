# PoC / WasmLens

**wasmlens** is a CLI tool that automatically instruments arbitrary WebAssembly components with distributed tracing through the `wasi:otel` interface, requiring no modifications to the component’s source code.

It operates by interposing every component import and top-level export with a tier-1 tracing middleware generated using [`splicer`](https://github.com/ejrgilbert/splicer). Leveraging splicer’s adapter generation capabilities, WasmLens constructs proxy components that mirror the complete import/export surface of the target component and transparently inject `wasi:otel` entry and exit spans around each proxied function call. The original component remains untouched; instrumentation is applied entirely at the composed-component layer through proxy wrapping.

Special thanks to Elizabeth Gilbert, the creator of `splicer`, for making this possible! This project aims to demonstrate a practical real-world use case for automatic instrumentation of arbitrary WebAssembly components.

## Background

### `wasi:otel` and static composition

The `wasi:otel/tracing` interface is the standard mechanism for WebAssembly components to emit OpenTelemetry spans. A component calls `on-start` to open a span and `on-end` to close it; both are handled by the host runtime.

A fundamental problem arises with **static composition** (e.g. components linked with [`wac`](https://github.com/bytecodealliance/wac)): the original [`wasi:otel@0.2.0-rc.2`](https://github.com/WebAssembly/wasi-otel/blob/7e6d50d0b8482944a2c245617736f22d80560fc5/wit/tracing.wit#L1) proposal exposed only `outer-span-context`, which always returns the host's outermost span context, not the innermost span currently active across logical component boundaries. When component A starts a span and then calls into component B, B has no way to discover A's span and therefore cannot establish the correct parent-child relationship. The resulting trace loses causality.

### The `inner-span-context` proposal

This project targets a revised `wasi:otel` proposal, defined in [`wit/wasi-otel/tracing.wit`](wit/wasi-otel/tracing.wit), that adds:

```wit
/// Returns the span context of the current span.
inner-span-context: func() -> span-context;
```

The host maintains a **stack** of active span contexts:

- `on-start` pushes a new context.
- `on-end` pops it.
- `inner-span-context` returns the top of the stack: the innermost currently-active span, regardless of which component started it.

This restores correct parent-child tracing across static composition boundaries, which is a prerequisite for automatic instrumentation of composed components to produce meaningful traces. This proposal was [accepted and merged](https://github.com/WebAssembly/wasi-otel/pull/16) into the main branch of `wasi:otel`.

## Usage

Instruments WebAssembly components by generating a proxy wrapper that adds logging and tracing capabilities to all exported interfaces. The tool and its accompanied demo depend on the updated `wasi:otel` interface and a fork of `wasmCloud` implementing it, included as a submodule. `wkg-registries.toml` contains the registries hosting the splicer middleware and updated `wasi:otel` WIT interfaces necessary to experiment with the PoC.

### Arguments

```sh
nebula instrument <INPUTS>... [OPTIONS]
```

| Argument      | Description                                                                       |
| :------------ | :-------------------------------------------------------------------------------- |
| `<INPUTS>...` | Path(s) to `.wasm` component files or a directory containing multiple components. |

By default, the tool detects all imports and top-level exports of the composition and instruments it through auto-generated splicer rules.

### Options

| Flag | Long Flag      | Description                                                                   | Default |
| :--- | :------------- | :---------------------------------------------------------------------------- | :------ |
| `-o` | `--output-dir` | The directory where the generated proxy source and WIT files will be written. | `./tmp` |
| `-h` | `--help`       | Print help information.                                                       |         |
| `-V` | `--version`    | Print version information.                                                    |         |

### Example

```sh
# Instrument a specific component and output to a custom directory
nebula instrument ./service.wasm -o ./generated_proxy

# Instrument all components in a folder
nebula instrument ./bin/components/
```

## Building

```sh
cargo build --release
```

Requires a Rust toolchain with the version specified in [`rust-toolchain.toml`](rust-toolchain.toml).

## License

MIT — see [LICENSE](LICENSE).
