# Nebula Logistics Engine

This application consists of _3 top-level actors_/ Two of them are complex "Black Boxes" composed via wac.

## Actors

### The `Gateway` actor

A lightweight router that accepts HTTP requests and orchestrates the workflow. Exposes a single HTTP endpoint.

```http
POST /order HTTP/1.1
Host: api.nebula-logistics.local
Content-Type: application/json

{
   "orderId": "aabbcc",
   "destination": "BE",
   "items": [
      {
         "sku": "123-456",
         "quantity": 2,
         "unitPrice": 49.99
      },
      {
         "sku": "654-321",
         "quantity": 8,
         "unitPrice": 19.99
      }
   ]
}
```

```http
HTTP/2 201 CREATED
Content-Type: application/json

{
   "subtotal": 259.90,
   "tax": 54.58,
   "total": 314.48,
   "currency": "EUR"
}
```

### The `Inventory` actor

- `inventory-api` (Rust) - an outer shell exposing the main functionality
- `warehouse-engine` (Rust) - business rules for shipping
- `database-engine` (C++) - A specialized, highly optimized driver (mocked)

### The `Pricing` actor

- `pricing-api` (Rust) - an outer shell exporting the main functionality
- `tax-engine` (Typescript) - calculates VAT based on country rules
- `currency-engine` (Rust) - fetch live currency rates (mocked)

## Scenario: "Black Friday Bottleneck"

A request is sent to place an order from a user in _Belgium_. The `tax-engine` inside the `Pricing` actor has a poorly optimized regex
for belgian postal codes that creates a massive CPU spike, only for Belgian customers.

### Behavior in wasmCloud

The lattice trace looks like this:

- `[2.5s] HTTP POST /order` (Gateway)
  - `[0.2s] call: check_stock` (Inventory)
  - `[2.2s] call: calculate_price`

We know the `Pricing` actor is slow But is it the `pricing-api`, `tax-engine` or `currency-engine`? With black-box tracing,
this is impossible to know _out-of-the-box_.

### Behavior with Glass-Box tracing

The new lattice trace should look like this:

- `[2.5s] HTTP POST /order` (Gateway)
  - `[0.2s] call: check_stock` (Inventory)
    - `[0.1s] internal: warehouse-engine.process`
    - `[0.05s] internal: database-engine.query`
  - `[2.2s] call: calculate_price` (Pricing)
    - `[0.01s] internal: currency-engine.get-rate`
    - `[2.15s] internal: tax-engine.calculate-vat`

With Glass-Box component tracing, we can more easily pinpoint where exactly the bottleneck is inside a component with build-time composition. The internal component calls can also contain additional metadata regarding to the arguments passed:

```json
{
  "result": 54.58,
  "params": {
    "subtotal": 259.9,
    "country": "BE"
  }
}
```
