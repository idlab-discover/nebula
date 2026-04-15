### General

- [x] Pull `wirm`, `splicer` and `wasi-otel` as forked submodules
- [ ] Extend `splicer` rules with glob interface matching

### Refactor

- [ ] Using `splicer`, skip original component inputs
  - [ ] Split input component into its composed parts (in-memory)
  - [ ] Generate `wac` composition for the reverse operation (in-memory)
- [ ] Write general tracing middleware importing `wasi:otel@0.3.0` and `splicer:adapter`
- [ ] Test on the `demo` project (and get rid of the `otel` helper crate)

###
