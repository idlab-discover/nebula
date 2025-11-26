# Project Setup

This document lists the tools and steps needed to build the Nebula workspace (Rust + C/C++ components) and produce WebAssembly (WASM) artifacts, including WASI-targeted builds and WIT interface binding generation.

## Overview

Required tools:

- `make` (build automation)
- `rustup` / `cargo` (Rust toolchain)
- `wit-bindgen` (WIT binding generator)
- `wasm-pkg-tools` (packaging)
- `wasi-sdk` (to compile C/C++ to WASM)
- `wasm-tools` (optional, binary inspection, wasm utilities)

## Rust toolchain

Install `rustup` (if missing) and a recent Rust toolchain:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup default stable
cargo --version
```

Add the WASM/WASI target used by this project:

```bash
rustup target add wasm32-wasi
```

Note: the workspace references WASI/WIT interfaces. If you specifically need an experimental preview ABI (preview-1/preview-2), consult the runtime/tooling docs you use (Wasmtime/Wasmer/wasip1/wasip2) — the canonical Rust target is `wasm32-wasi`.

## Install WIT / WASM helper tools

Install `wit-bindgen` (binding generation for WIT interfaces):

```bash
cargo install wit-bindgen-cli
```

Install `wasm-tools` for inspecting and manipulating wasm binaries:

```bash
cargo install wasm-tools
```

Install `wasm-pkg-tools` for automatic WIT dependency management and fetching.

```bash
cargo install wkg
```

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

If you intended a specific `wasm-pkg-tools` project, you can install that tool similarly (via its recommended method).

Verify installs:

```bash
wit-bindgen --version
wasm-tools --version
wkg --version
```

## WASI SDK (C/C++ -> WASM)

To compile C/C++ sources to WASM (WASI target), install the WASI SDK from the official repo:

- Releases: https://github.com/WebAssembly/wasi-sdk/releases

Add `export WASI_SDK_PATH=...` to your shell startup (`~/.profile`, `~/.bashrc`, `~/.zshrc`) if you want it persistent.

## Go Toolchain (Go -> WASM)

- Follow the TinyGo installation instructions to install the TinyGo compiler.

## Building to WASM

All subprojects in this repo have a `Makefile` which handles the build step, the commands below are included for completeness.

### Building from Rust

From the workspace root you can build a crate for the WASI target:

```bash
cargo build --release --target wasm32-wasip2
```

### Building from C/C++

From the project root, run (where `WASI_SDK_PATH` is the path to the downloaded WASI SDK):

```bash
$(WASI_SDK_PATH)/bin/wasm32-wasip2-clang \
	-mexec-model=reactor $(SRCS) -o component.wasm
```

### Building from Go

```go
tinygo build -target=wasip2 \                                                   17:13:28
    -o target/$(OUT)
```

## WIT ommon workflows

- Use `wit-bindgen` to generate host or guest bindings from `.wit` files found under `wit/` and each crate's `wit/` directory.

- Typical pattern:

```bash
# from a crate directory containing a .wit file
wit-bindgen generate --guest rust path/to/world.wit -o src/bindings

# or generate host bindings for another language/runtime
wit-bindgen generate --host c path/to/world.wit -o ./src/bindings
```

For rust, the `wit_bindgen` crate exposes useful macros for automatically generating bindings based on the exports/imports of the WIT world.

```
cargo add wit_bindgen
```

```rs
// lib.rs
wit_bindgen::generate!({
    path: "wit",
    world: "world",
    generate_all,
});
```
