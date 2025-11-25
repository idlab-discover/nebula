# Nebula Logistics Engine

This application consists of *3 top-level actors*/ Two of them are complex "Black Boxes" composed via wac.

## Actors

### The `Gateway` actor

A lightweight router that accepts HTTP requests and orchestrates the workflow.

### The `Inventory` actor

- `inventory-api` (Rust) - an outer shell exporting `wasi:http`
- `warehouse-engine` (Rust) - business rules for shipping
- `database-engine` (C++) - A specialized, highly optimized driver (mocked)

### The `Pricing` actor

- `pricing-api` (Rust) - an outer shell exporting `wasi:http`
- `tax-engine` (Typescript) - calculates VAT based on country rules 
- `currency-engine` (Rust) - fetch live currency rates (mocked)

## Scenario: "Black Friday Bottleneck"

A request is sent to place an order from a user in *Belgium*. The `tax-engine` inside the `Pricing` actor has a poorly optimized regex
for belgian postal codes that createsa massive CPU spike, only for Belgian customers.

### Behavior in wasmCloud

The lattice trace looks like this:

- `[2.5s] HTTP POST /order (Gateway)
   - `[0.2s] call: check_stock` (Inventory) -> OK, inventory is fast
   - `[2.2s] call: calculate_price` (Pricing) -> CRITICAL, pricing service is the bottleneck

We know the `Pricing` actor is slow But is it the `pricing-api`, `tax-engine` or `currency-engine`? With black-box tracing,
this is impossible to know *out-of-the-box*.

### Behavior with Glass-Box tracing (Hypothesis)

The new lattice trace looks like this:

- `[2.5s] HTTP POST /order` (Gateway)
   - `[0.2s] call: check_stock` (Inventory)
      - `[0.1s] internal: warehouse-engine.process` -> OK
      - `[0.05s] internal: database-engine.query` -> OK
   - `[2.2s] call: calculate_price` (Pricing)
      - `[0.01s] internal: currency-engine.get-rate` -> OK
      - `[2.15s] internal: tax-engine.calculate-vat` -> BOTTLENECK
         - Metadata: `{ country: 'BE' }`


With Glass-Box component tracing, we can more easily pinpoint where exactly the bottleneck is inside a build-time linked component.



