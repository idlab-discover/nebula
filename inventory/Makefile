
WAC ?= wac
COMPOSITION ?= composition.wac
OUT ?= target/composed-inventory.wasm

.PHONY: all build target

all: build

build: target
	$(WAC) compose $(COMPOSITION) \
	  --dep nebula:database-engine=./database-engine/target/database_engine.wasm \
	  --dep nebula:warehouse-engine=./warehouse-engine/target/wasm32-wasip2/release/warehouse_engine.wasm \
	  --dep nebula:inventory-api=./inventory-api/target/wasm32-wasip2/release/inventory_api.wasm \
	  -o $(OUT)

target:
	mkdir -p target

