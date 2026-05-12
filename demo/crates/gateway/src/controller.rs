use serde_json::json;
use wasi_http_framework::{Request, Response};

use crate::nebula::core::types::Order;
use crate::nebula::service;
use crate::schema::{OrderRequest, QuoteResponse};

pub fn create_order(req: &Request) -> Response {
	let order = match serde_json::from_slice::<OrderRequest>(&req.body) {
		Ok(order) => Ok(Order::from(order)),
		Err(e) => {
			let msg = format!("Invalid order format: {}", e);
			Err(msg)
		},
	};

	let order = match order {
		Ok(o) => o,
		Err(e) => return Response::json(json!({ "error": e }), 400),
	};

	// let order_json = serde_json::to_string(&req.body).unwrap_or_default();

	let quote = service::orders::create_order(&order);

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
		},
	};

	let quote = service::quotes::read_quote(quote_id);

	match quote {
		Some(quote) => Response::json(QuoteResponse::from(quote), 200),
		None => Response::json(json!({ "error": "Quote not found" }), 404),
	}
}
