### General

- [x] Pull `wirm`, `splicer` and `wasi-otel` as forked submodules
- [ ] Pull `wasmCloud` as forked submodule
- [ ] Extend `splicer` rules with glob interface matching

### Refactor

- [x] Using `splicer`, skip original component inputs
  - [x] Split input component into its composed parts (in-memory)
  - [x] Generate `wac` composition for the reverse operation (in-memory)
- [x] Write general tracing middleware importing `wasi:otel@0.3.0` and `splicer:adapter`
- [x] Test on the `demo` project

### Demo & Benchmarking

- [ ] Improve demo with CPU-intensive cross-cutting-flows (old nebula demo?)
- [ ] Add benchmarking logic: auto-instrumented otel vs. non-instrumented
