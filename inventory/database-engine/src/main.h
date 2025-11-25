#include "./bindings/database_engine.h"

#ifndef main_h
#define main_h

#define get_random_u64 wasi_random_random_get_random_u64
#define get_stock_level exports_nebula_inventory_database_engine_get_stock_level

#endif