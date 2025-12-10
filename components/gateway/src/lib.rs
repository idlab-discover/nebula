mod controller;
mod schema;

use serde_json::json;
use wasi_http_framework::wasi::http::types::{
	IncomingRequest, ResponseOutparam,
};
use wasi_http_framework::{Request, Response, Router};

use crate::controller::handle_order_request;
use crate::exports::wasi::http::incoming_handler::Guest;

wit_bindgen::generate!({
	path: "wit",
	world: "gateway",
	generate_all,
	with: {
		"wasi:http/types@0.2.8": wasi_http_framework::wasi::http::types,
	}
});

pub struct Gateway;

impl Guest for Gateway {
	/// Handle an incoming HTTP request for the Nebula API.
	fn handle(request: IncomingRequest, out: ResponseOutparam) {
		let router = Router::new().post("/order", handle_order_request);

		if let Ok(request) = Request::from_wasi(request) {
			let response = router.handle(request);
			response.send(out);
		} else {
			let json = json!({ "error": "Invalid request" });
			let response = Response::json(json, 400);
			response.send(out);
		}
	}
}

export!(Gateway);
