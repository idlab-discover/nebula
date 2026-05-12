TARGET_DIR   := ./target/wasm32-wasip2/release
MEMBERS      := gateway driver identity matcher payment pricing
COMPOSITION  := wac/composition.wac

.PHONY: all build fetch compose clean

all: fetch build compose

# --features wasi-otel-framework/traces

build:
	cargo build --release --features wasi-otel-framework/traces --target wasm32-wasip2

fetch:
	@$(foreach m,$(MEMBERS) otel http, \
		echo "Fetching WIT for $(m)..."; \
		cd crates/$(m) && wkg wit fetch; \
		cd ../..; \
	)

compose: build
	wac compose $(COMPOSITION) \
		$(foreach m,$(MEMBERS), \
			--dep nebula:$(m)=$(TARGET_DIR)/$(m).wasm \
		) \
		-o $(TARGET_DIR)/nebulift.wasm

clean:
	cargo clean