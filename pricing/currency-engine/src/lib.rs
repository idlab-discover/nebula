use crate::exports::nebula::pricing::currency_engine::{
	Country, Currency, Guest,
};
use crate::wasi::clocks::monotonic_clock::subscribe_duration;
use crate::wasi::random::random::get_random_u64;

wit_bindgen::generate!({
	path: "wit",
	world: "currency-engine",
	generate_all,
});

struct CurrencyEngine;

impl Guest for CurrencyEngine {
	/// Get the currency for a given destination
	fn get_currency(destination: Country) -> Currency {
		match destination {
			Country::Be => Currency::Eur,
			Country::Us => Currency::Usd,
			Country::Uk => Currency::Gbp,
			Country::Jp => Currency::Jpy,
			Country::Au => Currency::Aud,
			Country::Ca => Currency::Cad,
		}
	}

	/// Get the exchange rate for a given target currency from USD
	fn get_rate(currency: Currency) -> f64 {
		// Artifical API delay for USD -> EUR rates
		if currency == Currency::Eur {
			let random_sleep_ms = 2000 + get_random_u64() % 500;
			let random_sleep_ns = random_sleep_ms * 1_000_000;
			subscribe_duration(random_sleep_ns).block();
		}

		match currency {
			Currency::Usd => 1.0,
			Currency::Eur => 0.85,
			Currency::Gbp => 0.75,
			Currency::Jpy => 110.0,
			Currency::Aud => 1.35,
			Currency::Cad => 1.25,
		}
	}
}

export!(CurrencyEngine);
