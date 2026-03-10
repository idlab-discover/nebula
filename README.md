# PoC / Nebula

**nebula** is a CLI tool that automatically instruments arbitrary WebAssembly components with [OpenTelemetry](https://opentelemetry.io/) tracing via the `wasi:otel` interface, with no changes required to the component's source code.

It works by generating a **proxy component** that mirrors every import and export of the target component, and injects `wasi:otel` entry/exit spans around each proxied function call. The original component is left unmodified; the proxy wraps it at the composed-component level.

> **Status:** active development. The `instrument` command currently parses a component's imports and exports. Proxy generation and `wasi:otel` injection are in progress.

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

This restores correct parent-child tracing across static composition boundaries, which is a prerequisite for automatic instrumentation of composed components to produce meaningful traces.

## Usage

```sh
nebula instrument --file path/to/component.wasm
```

| Flag     | Description                         |
| -------- | ----------------------------------- |
| `--file` | Path to the input `.wasm` component |

## Building

```sh
cargo build --release
```

Requires a Rust toolchain with the version specified in [`rust-toolchain.toml`](rust-toolchain.toml).

## Roadmap

- [x] Parse component imports and exports (`wirm`)
- [ ] Generate proxy component skeleton
- [ ] Inject `wasi:otel` spans into proxy
- [ ] Emit composed `.wasm` output
- [ ] Demo: automatic + manual instrumentation working together
- [ ] Demo: benchmarks (no tracing / manual / automatic)

## License

MIT — see [LICENSE](LICENSE).
