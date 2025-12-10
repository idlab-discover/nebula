#ifndef main_h
#define main_h

#include "./bindings/database_engine.h"

/* nebula:inventory/database-engine */
#define get_stock_level exports_nebula_inventory_database_engine_get_stock_level

/* wasi:io/poll */
#define own_pollable_t wasi_io_poll_own_pollable_t
#define drop_own_pollable wasi_io_poll_pollable_drop_own

#define borrow_pollable_t wasi_io_poll_borrow_pollable_t
#define borrow_pollable wasi_io_poll_borrow_pollable
#define drop_borrowed_pollable wasi_io_poll_pollable_drop_borrow

#define pollable_ready wasi_io_poll_method_pollable_ready
#define pollable_block wasi_io_poll_method_pollable_block

/* wasi:clocks/monotonic-clock */
#define duration_t wasi_clocks_monotonic_clock_duration_t
#define subscribe_duration wasi_clocks_monotonic_clock_subscribe_duration

/* wasi:random/random */
#define get_random_u64 wasi_random_random_get_random_u64

/**
 * Poll for the given duration in milliseconds.
 * @param ms Duration in milliseconds to poll for.
 */
void poll_for_ms(duration_t ms);

#endif