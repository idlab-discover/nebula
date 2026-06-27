use wasi_otel_framework::tracing::Tracer;

use crate::exports::nebula::demo::matcher::Guest;
use crate::nebula::demo::driver;
use crate::nebula::demo::types::{Coordinates, Driver, Vehicle};

wit_bindgen::generate!({
	path: "wit",
	world: "matcher",
	generate_all
});

mod mock;

pub struct Matcher;

const EARTH_RADIUS: f64 = 6_371_000.0;

impl Coordinates {
	/// Returns distance in meters between two coordinates using the Haversine
	/// formula.
	pub fn distance_to(&self, other: &Coordinates) -> f64 {
		let lat1 = self.latitude.to_radians();
		let lat2 = other.latitude.to_radians();
		let dlat = (other.latitude - self.latitude).to_radians();
		let dlng = (other.longitude - self.longitude).to_radians();

		let a = (dlat / 2.0).sin().powi(2)
			+ lat1.cos() * lat2.cos() * (dlng / 2.0).sin().powi(2);

		2.0 * EARTH_RADIUS * a.sqrt().asin()
	}
}

impl Guest for Matcher {
	//// Find a matching driver for a given vehicle and location and return the
	//// driver record.
	#[allow(async_fn_in_trait)]
	fn find(
		vehicle: Vehicle,
		location: Coordinates,
		price: f64,
	) -> Result<Driver, String> {
		let tracer = Tracer::new("demo-matcher");

		tracer.start_span("matcher::find", |_span| {
			// thread::sleep(Duration::from_micros(250));
			let mut candidates = crate::mock::mock_drivers();

			while !candidates.is_empty() {
				let Some((index, candidate, distance)) =
					crate::mock::closest_driver(
						&candidates,
						vehicle,
						&location,
					)
				else {
					return Err(String::from(
						"no mock drivers match the requested vehicle",
					));
				};

				if driver::check(&candidate, distance, price) {
					return Ok(candidates.remove(index));
				}

				candidates.remove(index);
			}

			Err("no matching driver accepted the ride request".to_string())
		})
	}
}

export!(Matcher);
