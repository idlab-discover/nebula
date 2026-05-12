mod controller;
mod schema;

use serde_json::json;
use wasi_http_framework::wasi::http::types::{
	IncomingRequest,
	ResponseOutparam,
};
use wasi_http_framework::{Request, Response, Router};

// use wasi_otel_framework::tracing::Tracer;
use crate::exports::wasi::http::incoming_handler::Guest;

wit_bindgen::generate!({
	path: "wit",
	world: "gateway",
	generate_all,
	with: {
		"wasi:http/types@0.2.10": wasi_http_framework::wasi::http::types,
	}
});

// static TRACER: LazyLock<Tracer> =
// 	LazyLock::new(|| Tracer::new("nebula-order-service"));

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

		if let Ok(request) = Request::from_wasi(req) {
			let response = router.handle(request);
			response.send(res);
		} else {
			let json = json!({ "error": "Invalid request" });
			let response = Response::json(json, 400);
			response.send(res);
		}
	}
}

export!(Gateway);
