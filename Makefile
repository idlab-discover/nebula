DEMO_BIN_DIR := demo/bin
UNINSTRUMENTED_VARIANTS := $(wildcard $(DEMO_BIN_DIR)/nebulift-uninstrumented-rnd-*.wasm)

.PHONY: instrument

instrument:
	@if [ -z "$(UNINSTRUMENTED_VARIANTS)" ]; then \
		echo "No uninstrumented variants found in $(DEMO_BIN_DIR). Run 'make -C demo build-uninstrumented' first."; \
		exit 1; \
	fi
	@for wasm in $(UNINSTRUMENTED_VARIANTS); do \
		suffix=$${wasm##*-rnd-}; \
		out="$(DEMO_BIN_DIR)/nebulift-auto-instrumented-rnd-$$suffix"; \
		echo "Instrumenting $$wasm -> $$out"; \
		cargo run -- instrument "$$wasm" --output "$$out"; \
	done
