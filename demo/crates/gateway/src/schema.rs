use serde::{Deserialize, Serialize};

use crate::nebula::demo::types::{Coordinates, Driver, User, Vehicle};

#[derive(Deserialize, Serialize, Debug)]
#[serde(remote = "Coordinates")]
pub struct DerivedCoordinates {
	pub latitude:  f64,
	pub longitude: f64,
}

/// Earth radius in meters.
const EARTH_RADIUS: f64 = 6371000.0;

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

#[derive(Deserialize, Serialize)]
#[serde(remote = "Vehicle")]
pub enum DerivedVehicle {
	Sedan,
	Suv,
	Truck,
	Motorcycle,
}

#[derive(Serialize, Deserialize)]
#[serde(remote = "User")]
pub struct DerivedUser {
	pub id:    String,
	pub name:  String,
	pub email: String,
}

#[derive(Serialize, Deserialize)]
#[serde(remote = "Driver")]
pub struct DerivedDriver {
	#[serde(with = "DerivedUser")]
	pub user:     User,
	#[serde(with = "DerivedVehicle")]
	pub vehicle:  Vehicle,
	#[serde(with = "DerivedCoordinates")]
	pub location: Coordinates,
}

#[derive(Deserialize)]
pub struct RideRequest {
	#[serde(with = "DerivedVehicle")]
	pub vehicle: Vehicle,
	#[serde(with = "DerivedCoordinates")]
	pub pickup:  Coordinates,
	#[serde(with = "DerivedCoordinates")]
	pub dropoff: Coordinates,
}

#[derive(Serialize)]
pub struct RideResponse {
	#[serde(with = "DerivedDriver")]
	pub driver:      Driver,
	pub price:       String,
	pub distance:    String,
	pub payment_url: String,
}
