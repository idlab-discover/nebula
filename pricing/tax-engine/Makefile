.PHONY: lint fmt build fetch

CLIPPY_FLAGS := -W clippy::pedantic -D warnings

lint:
	cargo +nightly clippy --all-targets --allow-dirty --fix -- $(CLIPPY_FLAGS)

fmt:
	cargo +nightly fmt

build: fetch
	cargo build --release --target wasm32-wasip2

fetch:
	wkg wit fetch

clean:
	cargo clean