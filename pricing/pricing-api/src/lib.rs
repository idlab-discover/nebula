use crate::exports::nebula::pricing::pricing_api::{Guest, Order, Quote};
use crate::nebula::pricing::{currency_engine, tax_engine};
use crate::wasi::logging::logging::{Level, log};

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

		log(
			Level::Info,
			"nebula:pricing/pricing-api",
			&format!("Generating quote in {:?} with rate {}", currency, rate),
		);

		// Calculate the subtotal
		let subtotal = order
			.items
			.iter()
			.map(|item| item.unit_price * f64::from(item.quantity))
			.sum::<f64>()
			* rate;

		log(
			Level::Info,
			"nebula:pricing/pricing-api",
			&format!("Calculated subtotal: {}", subtotal),
		);

		// Calculate the tax
		let tax = tax_engine::calculate_vat(subtotal, order.destination);

		log(
			Level::Info,
			"nebula:pricing/pricing-api",
			&format!("Calculated tax: {}", tax),
		);

		let subtotal = (subtotal * 100.0).round() / 100.0;
		let tax = (tax * 100.0).round() / 100.0;
		let total = subtotal + tax;

		Quote { currency, subtotal, tax, total }
	}
}

export!(PricingApi);
