TARGET_DIR   := ./target/wasm32-wasip2/release
BIN_DIR      := ./bin
MEMBERS      := gateway driver identity matcher payment pricing
NON_DRIVER_MEMBERS := gateway identity matcher payment pricing
COMPOSITION  := wac/composition.wac
DRIVER_RND_SUFFIXES := 1_0 1_2 1_3 1_4 1_5 1_6
FEATURES     ?= --features wasi-otel-framework/traces
RUSTFLAGS    ?=
OUTPUT       ?= $(TARGET_DIR)/nebulift.wasm

.PHONY: all build build-instrumented build-uninstrumented build-driver-variants compose-driver-variants fetch compose artifacts clean

all: fetch build compose

# --features wasi-otel-framework/traces

build:
	RUSTFLAGS="$(RUSTFLAGS)" cargo build --release $(FEATURES) --target wasm32-wasip2

build-instrumented:
	$(MAKE) --no-print-directory build FEATURES="--features wasi-otel-framework/traces"
	$(MAKE) --no-print-directory build-driver-variants FEATURES="--features wasi-otel-framework/traces" DRIVER_VARIANT_PREFIX="driver-manual-instrument"
	$(MAKE) --no-print-directory compose-driver-variants DRIVER_VARIANT_PREFIX="driver-manual-instrument" COMPOSED_VARIANT_PREFIX="nebulift-manual-instrument"

build-uninstrumented:
	$(MAKE) --no-print-directory build FEATURES=""
	$(MAKE) --no-print-directory build-driver-variants FEATURES="" DRIVER_VARIANT_PREFIX="driver-uninstrumented"
	$(MAKE) --no-print-directory compose-driver-variants DRIVER_VARIANT_PREFIX="driver-uninstrumented" COMPOSED_VARIANT_PREFIX="nebulift-uninstrumented"

build-driver-variants:
	@mkdir -p $(BIN_DIR)
	@for suffix in $(DRIVER_RND_SUFFIXES); do \
		cfg=""; \
		if [ "$$suffix" != "1_0" ]; then cfg="--cfg nebula_rnd_$$suffix"; fi; \
		echo "Building driver variant $$suffix ($(DRIVER_VARIANT_PREFIX))..."; \
		CARGO_TARGET_DIR="./target/driver-rnd-variants/$$suffix" \
		RUSTFLAGS="$(RUSTFLAGS) $$cfg" \
		cargo build --release $(FEATURES) --target wasm32-wasip2 -p driver; \
		cp "./target/driver-rnd-variants/$$suffix/wasm32-wasip2/release/driver.wasm" "$(BIN_DIR)/$(DRIVER_VARIANT_PREFIX)-rnd-$$suffix.wasm"; \
	done

compose-driver-variants:
	@mkdir -p $(BIN_DIR)
	@for suffix in $(DRIVER_RND_SUFFIXES); do \
		echo "Composing variant $$suffix ($(COMPOSED_VARIANT_PREFIX))..."; \
		wac compose $(COMPOSITION) \
			$(foreach m,$(NON_DRIVER_MEMBERS),--dep nebula:$(m)=$(TARGET_DIR)/$(m).wasm) \
			--dep nebula:driver="$(BIN_DIR)/$(DRIVER_VARIANT_PREFIX)-rnd-$$suffix.wasm" \
			-o "$(BIN_DIR)/$(COMPOSED_VARIANT_PREFIX)-rnd-$$suffix.wasm"; \
	done

fetch:
	@$(foreach m,$(MEMBERS) otel http, \
		echo "Fetching WIT for $(m)..."; \
		cd crates/$(m) && wkg wit fetch; \
		cd ../..; \
	)

compose:
	wac compose $(COMPOSITION) \
		$(foreach m,$(MEMBERS), \
			--dep nebula:$(m)=$(TARGET_DIR)/$(m).wasm \
		) \
		-o $(OUTPUT)

define compose_variant
	$(MAKE) --no-print-directory compose FEATURES="$(1)" RUSTFLAGS="$(2)" OUTPUT="$(BIN_DIR)/$(3)"
endef

artifacts:
	@mkdir -p $(BIN_DIR)
	$(call compose_variant,,,nebulift-uninstrumented.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,,nebulift-manual-instrument.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_2,nebulift-uninstrumented-rnd-1_2.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_2,nebulift-manual-instrument-rnd-1_2.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_3,nebulift-uninstrumented-rnd-1_3.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_3,nebulift-manual-instrument-rnd-1_3.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_4,nebulift-uninstrumented-rnd-1_4.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_4,nebulift-manual-instrument-rnd-1_4.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_5,nebulift-uninstrumented-rnd-1_5.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_5,nebulift-manual-instrument-rnd-1_5.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_6,nebulift-uninstrumented-rnd-1_6.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_6,nebulift-manual-instrument-rnd-1_6.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_8,nebulift-uninstrumented-rnd-1_8.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_8,nebulift-manual-instrument-rnd-1_8.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_10,nebulift-uninstrumented-rnd-1_10.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_10,nebulift-manual-instrument-rnd-1_10.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_15,nebulift-uninstrumented-rnd-1_15.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_15,nebulift-manual-instrument-rnd-1_15.wasm)
	$(call compose_variant,,--cfg nebula_rnd_1_20,nebulift-uninstrumented-rnd-1_20.wasm)
	$(call compose_variant,--features wasi-otel-framework/traces,--cfg nebula_rnd_1_20,nebulift-manual-instrument-rnd-1_20.wasm)

clean:
	cargo clean