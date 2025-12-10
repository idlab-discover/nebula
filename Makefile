## Top-level Makefile
## Build subprojects and gather artifacts into `bin/`.

SUBDIRS := components/gateway components/pricing components/inventory
BIN_DIR := bin

.PHONY: all build clean prepare help
all: build

prepare:
	@mkdir -p $(BIN_DIR)

# For each subdir: if it defines a `compose` target, run `make compose` (used by `pricing` and `inventory`),
# otherwise run `make build` (used by `gateway` and simple crates). Then collect generated .wasm files.
build: prepare
	@echo "Building inventory (compose)"
	@$(MAKE) -C components/inventory compose
	@echo "Building pricing (compose)"
	@$(MAKE) -C components/pricing compose

	@echo "Building gateway (build)"
	@$(MAKE) -C components/gateway build

	@echo "Collecting artifacts into $(BIN_DIR)/"
	@cp -v components/inventory/target/inventory.wasm $(BIN_DIR)/
	@cp -v components/pricing/target/pricing.wasm $(BIN_DIR)/
	@cp -v components/gateway/target/wasm32-wasip2/release/*.wasm $(BIN_DIR)/

clean:
	@echo "Cleaning subprojects and removing $(BIN_DIR)/"
	@for d in $(SUBDIRS); do \
		if [ -f $$d/Makefile ]; then \
			$(MAKE) -C $$d clean || true; \
		fi; \
	done
	@rm -rf $(BIN_DIR)

help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  build    - run subproject compose/build and collect .wasm into $(BIN_DIR)/"
	@echo "  clean    - clean subprojects and remove $(BIN_DIR)/"
	@echo "  help     - show this help"
