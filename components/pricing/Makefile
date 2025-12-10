
WAC ?= wac
COMPOSITION ?= composition.wac
OUT ?= target/pricing.wasm

CUR_DIR = currency-engine
TAX_DIR = tax-engine
API_DIR = pricing-api

.PHONY: all compose build-deps target clean

all: compose

build-deps:
	@echo "Building dependencies..."
	$(MAKE) -C $(CUR_DIR) build
	$(MAKE) -C $(TAX_DIR) build
	$(MAKE) -C $(API_DIR) build

compose: clean build-deps target
	@echo "Composing final wasm with $(WAC)..."
	$(WAC) compose $(COMPOSITION) \
	  --dep nebula:currency-engine=$(CUR_DIR)/target/wasm32-wasip2/release/currency_engine.wasm \
	  --dep nebula:tax-engine=$(TAX_DIR)/target/wasm32-wasip2/release/tax_engine.wasm \
	  --dep nebula:pricing-api=$(API_DIR)/target/wasm32-wasip2/release/pricing_api.wasm \
	  -o $(OUT)

target:
	mkdir -p target

clean:
	@echo "Cleaning top-level target"
	rm -rf target