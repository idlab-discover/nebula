use crate::exports::nebula::pricing::tax_engine::{Country, Guest};

wit_bindgen::generate!({
	path: "wit",
	world: "tax-engine",
	generate_all,
});

struct TaxEngine;

impl Guest for TaxEngine {
	fn calculate_vat(subtotal: f64, country: Country) -> f64 {
		match country {
			Country::Be => subtotal * 0.21,
			Country::Us => subtotal * 0.0,
			Country::Uk => subtotal * 0.20,
			Country::Jp => subtotal * 0.10,
			Country::Au => subtotal * 0.10,
			Country::Ca => subtotal * 0.05,
		}
	}
}

export!(TaxEngine);
