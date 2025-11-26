.PHONY: fetch bindings build clean

CLANG := ./sdk/bin/wasm32-wasip2-clang \
	-mexec-model=reactor

SRC_DIR := src
BINDINGS_DIR := $(SRC_DIR)/bindings
OUT_DIR := target

SRCS := $(SRC_DIR)/main.c $(wildcard $(BINDINGS_DIR)/*.c $(BINDINGS_DIR)/*.o)
OUT := $(OUT_DIR)/database_engine.wasm
	
fetch:
	wkg wit fetch

bindings:
	wit-bindgen c --out-dir=$(BINDINGS_DIR) wit

build: fetch bindings $(OUT)

clean:
	rm -f $(OUT)

$(OUT): $(SRCS)
	@mkdir -p $(OUT_DIR)
	$(CLANG) $(CLANG_FLAGS) $^ -o $@