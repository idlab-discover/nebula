.PHONY: lint fmt build

CLIPPY_FLAGS := -W clippy::pedantic -D warnings

lint:
	cargo +nightly clippy --all-targets --allow-dirty --fix -- $(CLIPPY_FLAGS)

fmt:
	cargo +nightly fmt

build:
	cargo build --release --target wasm32-wasip2

clean:
	cargo clean