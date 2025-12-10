use crate::exports::nebula::pricing::pricing_api::{Guest, Order, Quote};
use crate::nebula::pricing::{currency_engine, tax_engine};

wit_bindgen::generate!({
	path: "wit",
	world: "pricing-api",
	generate_all,
});

struct PricingApi;

impl Guest for PricingApi {
	/// Generate a quote for the given order
	fn generate_quote(order: Order) -> Quote {
		// Get the conversion rate for the destination currency
		let currency = currency_engine::get_currency(order.destination);
		let rate = currency_engine::get_rate(currency);

		// Calculate the subtotal
		let subtotal = order
			.items
			.iter()
			.map(|item| item.unit_price * f64::from(item.quantity))
			.sum::<f64>()
			* rate;

		// Calculate the tax
		let tax = tax_engine::calculate_vat(subtotal, order.destination);

		let subtotal = (subtotal * 100.0).round() / 100.0;
		let tax = (tax * 100.0).round() / 100.0;
		let total = subtotal + tax;

		Quote { currency, subtotal, tax, total }
	}
}

export!(PricingApi);
