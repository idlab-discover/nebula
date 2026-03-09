mod controller;
mod schema;

use std::sync::LazyLock;

use serde_json::json;
use wasi_otel_framework::tracing::Tracer;

use wasi_http_framework::{
    Request, Response, Router,
    wasi::http::types::{IncomingRequest, ResponseOutparam},
};

use crate::exports::wasi::http::incoming_handler::Guest;

wit_bindgen::generate!({
    path: "wit",
    world: "gateway",
    generate_all,
    with: {
        "wasi:http/types@0.2.10": wasi_http_framework::wasi::http::types,
    }
});

static TRACER: LazyLock<Tracer> = LazyLock::new(|| Tracer::new("nebula-order-service"));

pub struct Gateway;

impl Guest for Gateway {
    /// Handle an incoming HTTP request for the Order API.
    fn handle(req: IncomingRequest, res: ResponseOutparam) -> () {
        let mut router = Router::new();

        // Order routes
        router = router.post("/orders", controller::create_order);
        // .get("/orders/:id", get_order)
        // .delete("/orders/:id", delete_order);

        // Quote routes
        router = router.get("/quotes/:id", controller::read_quote);
        // .post("/quotes", create_quote)
        // .delete("/quotes/:id", delete_quote);

        let trace_name = req.path_with_query().unwrap_or("<unknown>".to_string());

        TRACER.start_span(trace_name.as_str(), |span| {
            if let Ok(request) = Request::from_wasi(req) {
                span.set_attribute("http.method".to_string(), request.method());
                span.set_attribute("http.path".to_string(), request.path.clone());

                let response = router.handle(request);
                response.send(res);
            } else {
                let json = json!({ "error": "Invalid request" });
                let response = Response::json(json, 400);
                response.send(res);
            }
        });
    }
}

export!(Gateway);
