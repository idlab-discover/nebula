.PHONY: lint fmt build virt clean build-unvirt

CLIPPY_FLAGS := -W clippy::pedantic -D warnings

build: fetch
	cargo build --release --target wasm32-wasip2

fetch:
	wkg wit fetch

lint:
	cargo +nightly clippy --all-targets --allow-dirty --fix -- $(CLIPPY_FLAGS)

fmt:
	cargo +nightly fmt


clean:
	cargo clean