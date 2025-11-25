use serde_json::json;
use std::collections::HashMap;
use wasi_http_framework::{Request, Response};

use crate::nebula::core::types::Order;
use crate::nebula::inventory::inventory_api;
use crate::nebula::pricing::pricing_api;
use crate::schema::{OrderRequest, QuoteResponse};

/// Handle an incoming order request.
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

	// Check stock for each item in the order.
	let items = &order.items;
	let stock_checks = inventory_api::check_stock(items);

	let item_map: HashMap<_, _> =
		items.iter().map(|i| (i.sku.clone(), i)).collect();

	for stock in stock_checks {
		if let Some(item) = item_map.get(&stock.sku)
			&& stock.quantity < item.quantity {
				return Response::json(
					json!({ "error": format!("Item {} is out of stock", stock.sku) }),
					400,
				);
			}
	}

	// Create a quote for the order
	let quote = pricing_api::generate_quote(&order);

	// Return the quote as JSON response
	Response::json(QuoteResponse::from(quote), 200)
}
