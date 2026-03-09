use std::sync::LazyLock;

use wasi_otel_framework::tracing::Tracer;

use crate::exports::nebula::service::orders::Guest as OrdersGuest;
use crate::exports::nebula::service::quotes::Guest as QuotesGuest;
use crate::nebula::core::types::{Country, Currency, Item, Order, Quote};

wit_bindgen::generate!({
    path: "wit",
    world: "service",
    generate_all
});

static TRACER: LazyLock<Tracer> = LazyLock::new(|| Tracer::new("nebula-order-service"));

struct Service;

impl OrdersGuest for Service {
    /// Create an order and return a quote for it.
    fn create_order(order: Order) -> Quote {
        let subtotal = TRACER.start_span("calculate-subtotal", |_| {
            order
                .items
                .iter()
                .map(|item| item.quantity as f64 * item.unit_price)
                .sum::<f64>()
        });

        let tax = TRACER.start_span("calculate-tax", |_| match order.destination {
            Country::Be => 0.2,
            Country::Us => 0.15,
            Country::Uk => 0.18,
            Country::Au => 0.1,
            _ => 0.1,
        });

        let total = TRACER.start_span("calculate-total", |_| subtotal * (1.0 + tax));

        let currency = match order.destination {
            Country::Be | Country::Uk => Currency::Eur,
            Country::Us => Currency::Usd,
            Country::Au => Currency::Aud,
            _ => Currency::Usd,
        };

        Quote {
            order_id: order.order_id,
            subtotal: subtotal,
            tax: tax,
            total: total,
            currency,
        }
    }

    /// Delete an order by its ID.
    fn delete_order(_order_id: String) -> () {}

    /// Read an order by its ID and return its details.
    fn read_order(order_id: String) -> Option<Order> {
        Some(Order {
            order_id,
            destination: Country::Be,
            items: vec![Item {
                sku: "example-sku".to_string(),
                quantity: 1,
                unit_price: 50.0,
            }],
        })
    }
}

impl QuotesGuest for Service {
    /// Delete a quote by its order ID.
    fn delete_quote(_order_id: String) -> () {}

    /// Read a quote by its order ID and return its details.
    fn read_quote(order_id: String) -> Option<Quote> {
        Some(Quote {
            order_id,
            subtotal: 100.0,
            tax: 10.0,
            total: 110.0,
            currency: Currency::Usd,
        })
    }
}

export!(Service);
