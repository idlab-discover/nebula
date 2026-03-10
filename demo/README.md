# nebula/demo

A demonstration application for the [nebula](../README.md) automatic instrumentation tool. It consists of a simple **orders API** built with two WebAssembly components — `gateway` and `service` that are statically composed using [`wac`](https://github.com/bytecodealliance/wac).

## Architecture

```
HTTP request
     │
     ▼
┌──────────┐   nebula:service/orders   ┌──────────┐
│ gateway  │ ────────────────────────► │ service  │
│ (wasm)   │   nebula:service/quotes   │ (wasm)   │
└──────────┘                           └──────────┘
     │                                      │
     └──────────────┬───────────────────────┘
                    ▼
           wac static composition
                    │
                    ▼
             orders.wasm (composed)
```

- **`gateway`** — Handles incoming `wasi:http` requests, routes them to the appropriate handler, and calls into `service` for business logic. Instrumented with developer-added `wasi:otel` spans.
- **`service`** — Implements the `nebula:service/orders` and `nebula:service/quotes` WIT interfaces. Each handler is broken down into child spans (`calculate-subtotal`, `calculate-tax`, `calculate-total`).
- **`otel`** (`wasi-otel-framework`) — A library crate that wraps the raw `wasi:otel` WIT bindings with an ergonomic Rust API (`Tracer`, `Span`).

Both components import `wasi:otel/tracing@0.3.0` and are composed together with `wac`. The composed binary is served by a WASM runtime that provides the `wasi:otel` host implementation.

## Planned use cases

This demo application is the target for three scenarios that nebula will showcase once automatic instrumentation is complete:

### 1. Automatic instrumentation alongside developer instrumentation

`gateway` and `service` already contain hand-written `wasi:otel` spans. Nebula will wrap the composed binary with an additional proxy layer that adds entry/exit spans around every exported function call. The two layers of spans work together in the same trace, demonstrating that automatic instrumentation does not interfere with or replace developer instrumentation.

## Planned use cases

This demo application is the target for three scenarios that nebula will showcase once automatic instrumentation is complete:

### 1. Automatic instrumentation alongside developer instrumentation

`gateway` and `service` already contain hand-written `wasi:otel` spans. Nebula will wrap the composed binary with an additional proxy layer that adds entry/exit spans around every exported function call. The two layers of spans work together in the same trace, demonstrating that automatic instrumentation does not interfere with or replace developer instrumentation.

### 2. Ergonomic tracing library

The `crates/otel` crate (`wasi-otel-framework`) demonstrates a thin ergonomic wrapper around the raw `wasi:otel` WIT bindings:

```rust
let tracer = Tracer::new("my-service");

tracer.start_span("handle-request", |span| {
    span.set_attribute("http.path".to_string(), "/orders".to_string());

    tracer.start_span("create-order", |span| {
        span.set_attribute("order.id".to_string(), "abc123".to_string());
    });
});
```

Context propagation is handled automatically through `inner-span-context`.

### 3. Benchmarks

Three configurations will be benchmarked against each other:

| Configuration         | Description                                         |
| --------------------- | --------------------------------------------------- |
| **No tracing**        | Components compiled without any `wasi:otel` imports |
| **Manual tracing**    | Developer-written spans as seen in this demo        |
| **Automatic tracing** | Nebula-generated proxy component                    |

## Building

Prerequisites: `cargo`, `wkg`, `wac`

```sh
# Fetch WIT dependencies, build all components, and compose them
make

# Or step by step:
make fetch    # wkg wit fetch for each crate
make build    # cargo build --release --target wasm32-wasip2
make compose  # wac compose → target/wasm32-wasip2/release/orders.wasm
```

The final composed component is written to `target/wasm32-wasip2/release/orders.wasm`.

## Observability stack

The demo uses the [.NET Aspire standalone dashboard](https://learn.microsoft.com/en-us/dotnet/aspire/fundamentals/dashboard/standalone) container as the local observability host. It provides distributed tracing, metrics, and structured logs out of the box.

The WASM runtime exports spans over OTLP to the Aspire collector endpoint.

### Running

Prerequisites: Docker

```sh
cd otel
docker compose -f otel/docker-compose-aspire.yml up
```

| Endpoint                 | Purpose             |
| ------------------------ | ------------------- |
| `http://localhost:18888` | Aspire dashboard UI |
| `localhost:4317`         | OTLP gRPC receiver  |
| `localhost:4318`         | OTLP HTTP receiver  |
