use rand::random;
use wasi_otel_framework::tracing::Tracer;

use crate::exports::nebula::demo::driver::Guest;
use crate::nebula::demo::driver::Driver;

wit_bindgen::generate!({
	path: "wit",
	world: "driver",
	generate_all
});

pub struct Comp;

impl Guest for Comp {
	//// Confirm a ride request for a given user and driver, returning whether
	//// the confirmation was successful or not.
	#[allow(async_fn_in_trait)]
	fn check(_driver: Driver, distance: f64, price: f64) -> bool {
		let tracer = Tracer::new("demo-driver");

		tracer.start_span("driver::check", |_span| {
			let distance = distance.max(0.0);
			let price = price.max(0.0);

			let price_per_km =
				if distance > 0.0 { price / distance } else { price };

			let mut acceptance: f64 = 0.75;

			// Rate bonus based on price per km
			acceptance += match price_per_km {
				r if r >= 3.0 => 0.15,
				r if r >= 2.0 => 0.10,
				r if r >= 1.0 => 0.05,
				_ => 0.0,
			};

			// Absolute price bonus
			if price >= 50.0 {
				acceptance += 0.05;
			}

			// Distance penalty
			acceptance -= match distance {
				d if d > 10_000.0 => 0.10,
				d if d > 5_000.0 => 0.05,
				_ => 0.0,
			};

			let rnd: f64 = random();
			rnd < acceptance.clamp(0.0, 1.0)
		})
	}
}

export!(Comp);
