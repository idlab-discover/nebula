use crate::nebula::demo::types::{Coordinates, Driver, User, Vehicle};

pub fn mock_drivers() -> Vec<Driver> {
	vec![
		Driver {
			user:     User {
				id:    "driver-001".to_string(),
				name:  "Ava Vermeulen".to_string(),
				email: "ava@example.com".to_string(),
			},
			vehicle:  Vehicle::Sedan,
			location: Coordinates { latitude: 51.0543, longitude: 3.7174 },
		},
		Driver {
			user:     User {
				id:    "driver-002".to_string(),
				name:  "Noah Janssen".to_string(),
				email: "noah@example.com".to_string(),
			},
			vehicle:  Vehicle::Suv,
			location: Coordinates { latitude: 51.2194, longitude: 4.4025 },
		},
		Driver {
			user:     User {
				id:    "driver-003".to_string(),
				name:  "Mila Peeters".to_string(),
				email: "mila@example.com".to_string(),
			},
			vehicle:  Vehicle::Truck,
			location: Coordinates { latitude: 50.8503, longitude: 4.3517 },
		},
		Driver {
			user:     User {
				id:    "driver-004".to_string(),
				name:  "Lucas De Smet".to_string(),
				email: "lucas@example.com".to_string(),
			},
			vehicle:  Vehicle::Motorcycle,
			location: Coordinates { latitude: 52.3676, longitude: 4.9041 },
		},
		Driver {
			user:     User {
				id:    "driver-005".to_string(),
				name:  "Emma Van den Berg".to_string(),
				email: "emma@example.com".to_string(),
			},
			vehicle:  Vehicle::Sedan,
			location: Coordinates { latitude: 51.4416, longitude: 5.4697 },
		},
		Driver {
			user:     User {
				id:    "driver-006".to_string(),
				name:  "Finn Dubois".to_string(),
				email: "finn@example.com".to_string(),
			},
			vehicle:  Vehicle::Suv,
			location: Coordinates { latitude: 50.9375, longitude: 5.3507 },
		},
		Driver {
			user:     User {
				id:    "driver-007".to_string(),
				name:  "Lina Meijer".to_string(),
				email: "lina@example.com".to_string(),
			},
			vehicle:  Vehicle::Truck,
			location: Coordinates { latitude: 51.8250, longitude: 4.6730 },
		},
		Driver {
			user:     User {
				id:    "driver-008".to_string(),
				name:  "Owen Claes".to_string(),
				email: "owen@example.com".to_string(),
			},
			vehicle:  Vehicle::Motorcycle,
			location: Coordinates { latitude: 51.2602, longitude: 4.4028 },
		},
		Driver {
			user:     User {
				id:    "driver-009".to_string(),
				name:  "Zoe De Wilde".to_string(),
				email: "zoe@example.com".to_string(),
			},
			vehicle:  Vehicle::Sedan,
			location: Coordinates { latitude: 50.6326, longitude: 3.0586 },
		},
		Driver {
			user:     User {
				id:    "driver-010".to_string(),
				name:  "Mason Leroy".to_string(),
				email: "mason@example.com".to_string(),
			},
			vehicle:  Vehicle::Suv,
			location: Coordinates { latitude: 50.6292, longitude: 5.5797 },
		},
		Driver {
			user:     User {
				id:    "driver-011".to_string(),
				name:  "Iris Moens".to_string(),
				email: "iris@example.com".to_string(),
			},
			vehicle:  Vehicle::Truck,
			location: Coordinates { latitude: 48.8566, longitude: 2.3522 },
		},
		Driver {
			user:     User {
				id:    "driver-012".to_string(),
				name:  "Finn De Cock".to_string(),
				email: "finn.decock@example.com".to_string(),
			},
			vehicle:  Vehicle::Motorcycle,
			location: Coordinates { latitude: 51.0443, longitude: 3.7340 },
		},
	]
}

pub(crate) fn closest_driver<'a>(
	drivers: &'a [Driver],
	vehicle: Vehicle,
	location: &Coordinates,
) -> Option<(usize, &'a Driver, f64)> {
	drivers
		.iter()
		.enumerate()
		.filter(|(_, driver)| driver.vehicle == vehicle)
		.map(|(index, driver)| {
			(index, driver, location.distance_to(&driver.location))
		})
		.min_by(|left, right| left.2.total_cmp(&right.2))
}

#[cfg(test)]
mod tests {
	use super::*;

	#[test]
	fn mock_drivers_cover_all_vehicle_types() {
		let drivers = mock_drivers();

		assert!(drivers.len() >= 10);
		assert!(drivers.iter().any(|driver| driver.vehicle == Vehicle::Sedan));
		assert!(drivers.iter().any(|driver| driver.vehicle == Vehicle::Suv));
		assert!(drivers.iter().any(|driver| driver.vehicle == Vehicle::Truck));
		assert!(
			drivers.iter().any(|driver| driver.vehicle == Vehicle::Motorcycle)
		);
	}
}
