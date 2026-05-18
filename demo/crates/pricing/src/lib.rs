use wasi_otel_framework::tracing::Tracer;

use crate::exports::nebula::demo::pricing::Guest;
use crate::nebula::demo::types::Vehicle;

wit_bindgen::generate!({
	path: "wit",
	world: "pricing",
	generate_all
});

pub struct Pricing;

impl Guest for Pricing {
	//// Calculate the indicative price for a ride based on the distance and
	//// vehicle type.
	#[allow(async_fn_in_trait)]
	fn calculate(distance: f64, vehicle: Vehicle) -> f64 {
		let tracer = Tracer::new("demo-pricing");

		tracer.start_span("pricing::calculate", |span| {
			let distance_km = distance / 1000.0;

			let base_fare = 2.5;

			let distance_rate = match vehicle {
				Vehicle::Sedan => 1.2,
				Vehicle::Suv => 1.6,
				Vehicle::Truck => 2.0,
				Vehicle::Motorcycle => 0.8,
			};

			base_fare + distance_km.max(0.0) * distance_rate
		})
	}
}

export!(Pricing);
