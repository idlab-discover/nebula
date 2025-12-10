#include "main.h"

uint32_t get_stock_level(
    database_engine_string_t *sku,
    database_engine_string_t *warehouse_id)
{
    // Simulate some delay using a random duration
    duration_t random_sleep_ms = (duration_t)get_random_u64() * 0;
    poll_for_ms(random_sleep_ms);

    // Free the input strings
    database_engine_string_free(sku);
    database_engine_string_free(warehouse_id);

    // Simulate random stock level
    uint64_t stock_level = get_random_u64() % 100;

    return stock_level;
}

void poll_for_ms(duration_t ms)
{
    duration_t ns = ms * 1000000;
    own_pollable_t timer_own = subscribe_duration(ns);

    borrow_pollable_t timer_borrowed = borrow_pollable(timer_own);
    pollable_block(timer_borrowed);

    drop_own_pollable(timer_own);
}