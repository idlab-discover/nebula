use crate::nebula::core::types::{Item, Order, Quote};

#[derive(serde::Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ItemRequest {
	sku: String,
	quantity: u32,
	unit_price: f64,
}

impl From<ItemRequest> for Item {
	fn from(item: ItemRequest) -> Self {
		Item {
			sku: item.sku,
			quantity: item.quantity,
			unit_price: item.unit_price,
		}
	}
}

#[derive(serde::Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct OrderRequest {
	pub order_id: String,
	pub items: Vec<ItemRequest>,
	pub destination: String,
}

impl From<OrderRequest> for Order {
	fn from(order: OrderRequest) -> Self {
		Order {
			order_id: order.order_id,
			items: order
				.items
				.into_iter()
				.map(std::convert::Into::into)
				.collect(),
			destination: order.destination,
		}
	}
}

#[derive(serde::Serialize)]
#[serde(rename_all = "camelCase")]
pub struct QuoteResponse {
	subtotal: f32,
	tax: f32,
	total: f32,
	currency: String,
}

impl From<Quote> for QuoteResponse {
	fn from(quote: Quote) -> Self {
		QuoteResponse {
			subtotal: quote.subtotal,
			tax: quote.tax,
			total: quote.total,
			currency: quote.currency,
		}
	}
}
