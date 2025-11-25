use serde_json::json;
use wasi_http_framework::{Request, Response};

use crate::nebula::core::types::Order;
use crate::nebula::inventory::inventory_api;
use crate::nebula::pricing::pricing_api;
use crate::schema::{OrderRequest, QuoteResponse};

pub fn handle_order_request(req: &Request) -> Response {
	let body = serde_json::from_slice::<OrderRequest>(&req.body);

	let order = match body {
		Ok(order) => Order::from(order),
		Err(_) => {
			return Response::json(
				json!({ "error": "Invalid order format" }),
				400,
			);
		},
	};

	let items = &order.items;
	let stock_checks = inventory_api::check_stock(items);

	for item in items {
		let mut total_available_stock = 0;
		let mut item_found_in_inventory = false;

		for stock_entry in &stock_checks {
			if stock_entry.sku == item.sku {
				item_found_in_inventory = true;
				total_available_stock += stock_entry.quantity;
			}
		}

		if !item_found_in_inventory {
			let code = "ITEM_NOT_FOUND";

			let error = format!(
				"Item {} is not recognized by the inventory system.",
				item.sku
			);

			return Response::json(
				json!({
					"error": error,
					"code": code
				}),
				400,
			);
		}

		if item.quantity > total_available_stock {
			let code = "INSUFFICIENT_STOCK";

			let error = format!(
				"Item {} is out of stock (Available: {}, Requested: {}).",
				item.sku, total_available_stock, item.quantity
			);

			return Response::json(
				json!({
					"error": error,
					"code": code
				}),
				400,
			);
		}
	}

	let quote = pricing_api::generate_quote(&order);

	Response::json(QuoteResponse::from(quote), 201)
}
