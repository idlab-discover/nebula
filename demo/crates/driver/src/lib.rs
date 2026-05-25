use rand::random;
use wasi_otel_framework::tracing::Tracer;

use crate::exports::nebula::demo::driver::Guest;
use crate::nebula::demo::driver::Driver;

wit_bindgen::generate!({
	path: "wit",
	world: "driver",
	generate_all
});

#[cfg(nebula_rnd_1_2)]
const RND_THRESHOLD: f64 = 1.0 / 2.0;
#[cfg(nebula_rnd_1_3)]
const RND_THRESHOLD: f64 = 1.0 / 3.0;
#[cfg(nebula_rnd_1_4)]
const RND_THRESHOLD: f64 = 1.0 / 4.0;
#[cfg(nebula_rnd_1_5)]
const RND_THRESHOLD: f64 = 1.0 / 5.0;
#[cfg(nebula_rnd_1_6)]
const RND_THRESHOLD: f64 = 1.0 / 6.0;
#[cfg(nebula_rnd_1_8)]
const RND_THRESHOLD: f64 = 1.0 / 8.0;
#[cfg(nebula_rnd_1_10)]
const RND_THRESHOLD: f64 = 1.0 / 10.0;
#[cfg(nebula_rnd_1_15)]
const RND_THRESHOLD: f64 = 1.0 / 15.0;
#[cfg(nebula_rnd_1_20)]
const RND_THRESHOLD: f64 = 1.0 / 20.0;
#[cfg(not(any(
	nebula_rnd_1_2,
	nebula_rnd_1_3,
	nebula_rnd_1_4,
	nebula_rnd_1_5,
	nebula_rnd_1_6,
	nebula_rnd_1_8,
	nebula_rnd_1_10,
	nebula_rnd_1_15,
	nebula_rnd_1_20,
)))]
const RND_THRESHOLD: f64 = 1.0;

pub struct Comp;

impl Guest for Comp {
	//// Confirm a ride request for a given user and driver, returning whether
	//// the confirmation was successful or not.
	#[allow(async_fn_in_trait)]
	fn check(_driver: Driver, _distance: f64, _price: f64) -> bool {
		let tracer = Tracer::new("demo-driver");

		tracer.start_span("driver::check", |_span| {
			// let distance = distance.max(0.0);
			// let price = price.max(0.0);

			// let price_per_km =
			// 	if distance > 0.0 { price / distance } else { price };

			// let mut acceptance: f64 = 0.75;

			// // Rate bonus based on price per km
			// acceptance += match price_per_km {
			// 	r if r >= 3.0 => 0.15,
			// 	r if r >= 2.0 => 0.10,
			// 	r if r >= 1.0 => 0.05,
			// 	_ => 0.0,
			// };

			// // Absolute price bonus
			// if price >= 50.0 {
			// 	acceptance += 0.05;
			// }

			// // Distance penalty
			// acceptance -= match distance {
			// 	d if d > 10_000.0 => 0.10,
			// 	d if d > 5_000.0 => 0.05,
			// 	_ => 0.0,
			// };

			let rnd: f64 = random();
			rnd <= RND_THRESHOLD
		})
	}
}

export!(Comp);
