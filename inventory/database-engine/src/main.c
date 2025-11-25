#include "main.h"

uint32_t get_stock_level(
    database_engine_string_t *sku,
    database_engine_string_t *warehouse_id)
{
    // Get a random stock level for demonstration purposes
    uint64_t stock_level = get_random_u64() % 100;

    // Free the input strings
    database_engine_string_free(sku);
    database_engine_string_free(warehouse_id);

    return stock_level;
}