TARGET_DIR   := ./target/wasm32-wasip2/release
MEMBERS      := parent child

.PHONY: all build fetch compose clean

all: fetch build compose

build:
	cargo build --release --target wasm32-wasip2

fetch:
	@$(foreach m,$(MEMBERS), \
		echo "Fetching WIT for $(m)..."; \
		cd $(m) && wkg wit fetch; \
		cd ..; \
	)

clean:
	cargo clean