mod controller;
mod schema;

use serde_json::json;
use wasi_http_framework::wasi::http::types::{
	IncomingRequest,
	ResponseOutparam,
};
use wasi_http_framework::{Request, Response, Router};
use wasi_otel_framework::tracing::Tracer;

use crate::exports::wasi::http::incoming_handler::Guest;

wit_bindgen::generate!({
	path: "wit",
	world: "gateway",
	generate_all,
	with: {
		"wasi:http/types@0.2.10": wasi_http_framework::wasi::http::types,
	}
});

static TRACER: LazyLock<Tracer> =
	LazyLock::new(|| Tracer::new("nebula-order-service"));

pub struct Gateway;

impl Guest for Gateway {
	/// Handle an incoming HTTP request for the Order API.
	fn handle(req: IncomingRequest, res: ResponseOutparam) -> () {
		let mut router = Router::new();

		// Order routes
		router = router.post("/ride", controller::request_ride);
		router = router.get("/token", controller::get_token);

		if let Some(path) = req.path_with_query() {
			TRACER.start_span(path.as_str(), |_span| {
				if let Ok(request) = Request::from_wasi(req) {
					let response = router.handle(request);
					let _ = response.send(res);
				} else {
					let json = json!({ "error": "Invalid request" });
					let response = Response::json(json, 400);
					let _ = response.send(res);
				}
			});
		} else {
			let json = json!({ "error": "Invalid request path" });
			let response = Response::json(json, 400);
			let _ = response.send(res);
		}
	}
}

export!(Gateway);
