WAC ?= wac
COMPOSITION ?= composition.wac

UNVIRT_OUT ?= target/inventory.unvirt.wasm
VIRT_OUT ?= target/inventory.wasm

DB_DIR := database-engine
WH_DIR := warehouse-engine
API_DIR := inventory-api

.PHONY: all compose build-deps target clean

all: compose

build-deps:
	@echo "Building dependencies..."
	$(MAKE) -C $(DB_DIR) build
	$(MAKE) -C $(WH_DIR) build
	$(MAKE) -C $(API_DIR) build

compose: clean build-deps target
	@echo "Composing final wasm with $(WAC)..."
	$(WAC) compose $(COMPOSITION) \
	  --dep nebula:database-engine=$(DB_DIR)/target/database_engine.wasm \
	  --dep nebula:warehouse-engine=$(WH_DIR)/target/wasm32-wasip2/release/warehouse_engine.wasm \
	  --dep nebula:inventory-api=$(API_DIR)/target/wasm32-wasip2/release/inventory_api.wasm \
	  -o $(VIRT_OUT)
	$(MAKE) virt

virt:
	@echo Virtualizing WASM module...
# 	wasi-virt "$(UNVIRT_OUT)" --allow-all -o "$(VIRT_OUT)"
# 	rm $(UNVIRT_OUT)

target:
	@mkdir -p target

clean:
	@echo "Cleaning top-level target"
	rm -rf target

