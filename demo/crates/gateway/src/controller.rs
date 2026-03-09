use serde_json::json;
use wasi_http_framework::{Request, Response};
use wasi_otel_framework::bindings::wasi::otel::tracing::{SpanKind, Status};

use crate::{
    TRACER,
    nebula::{core::types::Order, service},
    schema::{OrderRequest, QuoteResponse},
};

pub fn create_order(req: &Request) -> Response {
    let order = TRACER.start_span("parse-order", |span| {
        match serde_json::from_slice::<OrderRequest>(&req.body) {
            Ok(order) => Ok(Order::from(order)),
            Err(e) => {
                let msg = format!("Invalid order format: {}", e);
                span.set_status(Status::Error(msg.clone()));
                Err(msg)
            }
        }
    });

    let order = match order {
        Ok(o) => o,
        Err(e) => return Response::json(json!({ "error": e }), 400),
    };

    let quote = TRACER.start_span("create-order", |span| {
        let order_json = serde_json::to_string(&req.body).unwrap_or_default();
        span.set_attribute("order.body".to_string(), order_json);
        span.set_kind(SpanKind::Client);
        service::orders::create_order(&order)
    });

    Response::json(QuoteResponse::from(quote), 200)
}

pub fn read_quote(req: &Request) -> Response {
    let quote_id = req.path_params.get("id");

    let quote_id = match quote_id {
        Some(id) => id,
        None => {
            return Response::json(
                json!({ "error": "Missing or invalid `id` query parameter" }),
                400,
            );
        }
    };

    let quote = service::quotes::read_quote(quote_id);

    match quote {
        Some(quote) => Response::json(QuoteResponse::from(quote), 200),
        None => Response::json(json!({ "error": "Quote not found" }), 404),
    }
}
