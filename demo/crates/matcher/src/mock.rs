use crate::nebula::demo::types::{Coordinates, Driver, User, Vehicle};

pub fn mock_drivers() -> Vec<Driver> {
	vec![
		Driver {
			user:     User {
				id:    "driver-013".to_string(),
				name:  "Jules Maes".to_string(),
				email: "jules@example.com".to_string(),
			},
			vehicle:  Vehicle::Sedan,
			location: Coordinates { latitude: 50.8798, longitude: 4.7005 },
		},
		Driver {
			user:     User {
				id:    "driver-014".to_string(),
				name:  "Lotte Willems".to_string(),
				email: "lotte@example.com".to_string(),
			},
			vehicle:  Vehicle::Sedan,
			location: Coordinates { latitude: 51.2093, longitude: 3.2247 },
		},
		Driver {
			user:     User {
				id:    "driver-015".to_string(),
				name:  "Sep Vandenberghe".to_string(),
				email: "sep@example.com".to_string(),
			},
			vehicle:  Vehicle::Sedan,
			location: Coordinates { latitude: 50.9331, longitude: 5.3378 },
		},
		Driver {
			user:     User {
				id:    "driver-016".to_string(),
				name:  "Nina Martens".to_string(),
				email: "nina@example.com".to_string(),
			},
			vehicle:  Vehicle::Sedan,
			location: Coordinates { latitude: 51.0281, longitude: 4.4803 },
		},
		Driver {
			user:     User {
				id:    "driver-017".to_string(),
				name:  "Rune Jacobs".to_string(),
				email: "rune@example.com".to_string(),
			},
			vehicle:  Vehicle::Sedan,
			location: Coordinates { latitude: 50.6400, longitude: 5.5718 },
		},
		Driver {
			user:     User {
				id:    "driver-018".to_string(),
				name:  "Tibo Claeys".to_string(),
				email: "tibo@example.com".to_string(),
			},
			vehicle:  Vehicle::Suv,
			location: Coordinates { latitude: 51.1651, longitude: 4.1432 },
		},
		Driver {
    user: User {
        id: "driver-058".to_string(),
        name: "Milan Vandenberghe".to_string(),
        email: "milan@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 50.8503, longitude: 4.3517 }, // Brussels
},
Driver {
    user: User {
        id: "driver-059".to_string(),
        name: "Eline De Smet".to_string(),
        email: "eline@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 51.2194, longitude: 4.4025 }, // Antwerp
},
Driver {
    user: User {
        id: "driver-060".to_string(),
        name: "Robbe Vermeiren".to_string(),
        email: "robbe@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 51.0543, longitude: 3.7174 }, // Ghent
},
Driver {
    user: User {
        id: "driver-061".to_string(),
        name: "Lien Van den Broeck".to_string(),
        email: "lien@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 51.2093, longitude: 3.2247 }, // Bruges
},
Driver {
    user: User {
        id: "driver-062".to_string(),
        name: "Jasper Declercq".to_string(),
        email: "jasper@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 50.8798, longitude: 4.7005 }, // Leuven
},
Driver {
    user: User {
        id: "driver-063".to_string(),
        name: "Hanne Willems".to_string(),
        email: "hanne@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 50.9307, longitude: 5.3378 }, // Hasselt
},
Driver {
    user: User {
        id: "driver-064".to_string(),
        name: "Tomas Peeters".to_string(),
        email: "tomas@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 50.8282, longitude: 3.2649 }, // Kortrijk
},
Driver {
    user: User {
        id: "driver-065".to_string(),
        name: "Nora Maes".to_string(),
        email: "nora@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 51.2240, longitude: 2.9287 }, // Ostend
},
		Driver {
			user:     User {
				id:    "driver-019".to_string(),
				name:  "Elise Dupont".to_string(),
				email: "elise@example.com".to_string(),
			},
			vehicle:  Vehicle::Suv,
			location: Coordinates { latitude: 50.4542, longitude: 3.9523 },
		},
		Driver {
			user:     User {
				id:    "driver-020".to_string(),
				name:  "Mats Peeters".to_string(),
				email: "mats@example.com".to_string(),
			},
			vehicle:  Vehicle::Suv,
			location: Coordinates { latitude: 51.0536, longitude: 3.7304 },
		},
		Driver {
			user:     User {
				id:    "driver-021".to_string(),
				name:  "Sarah Verbruggen".to_string(),
				email: "sarah@example.com".to_string(),
			},
			vehicle:  Vehicle::Suv,
			location: Coordinates { latitude: 50.8500, longitude: 4.3700 },
		},
		Driver {
			user:     User {
				id:    "driver-022".to_string(),
				name:  "Kobe Mertens".to_string(),
				email: "kobe@example.com".to_string(),
			},
			vehicle:  Vehicle::Suv,
			location: Coordinates { latitude: 51.3000, longitude: 4.5000 },
		},
		Driver {
			user:     User {
				id:    "driver-023".to_string(),
				name:  "Amber Dierckx".to_string(),
				email: "amber@example.com".to_string(),
			},
			vehicle:  Vehicle::Truck,
			location: Coordinates { latitude: 50.9500, longitude: 3.1200 },
		},
		Driver {
			user:     User {
				id:    "driver-024".to_string(),
				name:  "Victor Hermans".to_string(),
				email: "victor@example.com".to_string(),
			},
			vehicle:  Vehicle::Truck,
			location: Coordinates { latitude: 51.1700, longitude: 5.4700 },
		},
		Driver {
			user:     User {
				id:    "driver-025".to_string(),
				name:  "Lars Goossens".to_string(),
				email: "lars@example.com".to_string(),
			},
			vehicle:  Vehicle::Truck,
			location: Coordinates { latitude: 50.4108, longitude: 4.4446 },
		},
		Driver {
			user:     User {
				id:    "driver-026".to_string(),
				name:  "Femke De Vos".to_string(),
				email: "femke@example.com".to_string(),
			},
			vehicle:  Vehicle::Truck,
			location: Coordinates { latitude: 51.0000, longitude: 3.9000 },
		},
		Driver {
			user:     User {
				id:    "driver-027".to_string(),
				name:  "Arne Michiels".to_string(),
				email: "arne@example.com".to_string(),
			},
			vehicle:  Vehicle::Truck,
			location: Coordinates { latitude: 50.8700, longitude: 4.6900 },
		},
		Driver {
			user:     User {
				id:    "driver-028".to_string(),
				name:  "Yara Smits".to_string(),
				email: "yara@example.com".to_string(),
			},
			vehicle:  Vehicle::Motorcycle,
			location: Coordinates { latitude: 51.0800, longitude: 3.7200 },
		},
		Driver {
			user:     User {
				id:    "driver-029".to_string(),
				name:  "Daan Verhaeghe".to_string(),
				email: "daan@example.com".to_string(),
			},
			vehicle:  Vehicle::Motorcycle,
			location: Coordinates { latitude: 50.9800, longitude: 5.5000 },
		},
		Driver {
			user:     User {
				id:    "driver-030".to_string(),
				name:  "Lena Claes".to_string(),
				email: "lena@example.com".to_string(),
			},
			vehicle:  Vehicle::Motorcycle,
			location: Coordinates { latitude: 50.6400, longitude: 4.6100 },
		},
		Driver {
			user:     User {
				id:    "driver-031".to_string(),
				name:  "Brent Wouters".to_string(),
				email: "brent@example.com".to_string(),
			},
			vehicle:  Vehicle::Motorcycle,
			location: Coordinates { latitude: 51.2300, longitude: 4.4100 },
		},
		Driver {
			user:     User {
				id:    "driver-032".to_string(),
				name:  "Kato Jans".to_string(),
				email: "kato@example.com".to_string(),
			},
			vehicle:  Vehicle::Motorcycle,
			location: Coordinates { latitude: 50.8500, longitude: 3.6000 },
		},
		Driver {
    user: User {
        id: "driver-033".to_string(),
        name: "Liam Vercammen".to_string(),
        email: "liam@example.com".to_string(),
    },
    vehicle: Vehicle::Sedan,
    location: Coordinates { latitude: 50.8503, longitude: 4.3517 }, // Brussels
},
Driver {
    user: User {
        id: "driver-034".to_string(),
        name: "Emma Declercq".to_string(),
        email: "emma@example.com".to_string(),
    },
    vehicle: Vehicle::Sedan,
    location: Coordinates { latitude: 51.2194, longitude: 4.4025 }, // Antwerp
},
Driver {
    user: User {
        id: "driver-035".to_string(),
        name: "Noah Van Acker".to_string(),
        email: "noah@example.com".to_string(),
    },
    vehicle: Vehicle::Sedan,
    location: Coordinates { latitude: 51.0543, longitude: 3.7174 }, // Ghent
},
Driver {
    user: User {
        id: "driver-036".to_string(),
        name: "Fien Willems".to_string(),
        email: "fien@example.com".to_string(),
    },
    vehicle: Vehicle::Sedan,
    location: Coordinates { latitude: 51.2093, longitude: 3.2247 }, // Bruges
},
Driver {
    user: User {
        id: "driver-037".to_string(),
        name: "Lucas Hermans".to_string(),
        email: "lucas@example.com".to_string(),
    },
    vehicle: Vehicle::Sedan,
    location: Coordinates { latitude: 50.8798, longitude: 4.7005 }, // Leuven
},
Driver {
    user: User {
        id: "driver-038".to_string(),
        name: "Marie Verstraeten".to_string(),
        email: "marie@example.com".to_string(),
    },
    vehicle: Vehicle::Sedan,
    location: Coordinates { latitude: 50.9307, longitude: 5.3378 }, // Hasselt
},
Driver {
    user: User {
        id: "driver-039".to_string(),
        name: "Thomas Jacobs".to_string(),
        email: "thomas@example.com".to_string(),
    },
    vehicle: Vehicle::Sedan,
    location: Coordinates { latitude: 50.8282, longitude: 3.2649 }, // Kortrijk
},
Driver {
    user: User {
        id: "driver-040".to_string(),
        name: "Sanne Peeters".to_string(),
        email: "sanne@example.com".to_string(),
    },
    vehicle: Vehicle::Sedan,
    location: Coordinates { latitude: 51.2240, longitude: 2.9287 }, // Ostend
},

// SUVs
Driver {
    user: User {
        id: "driver-041".to_string(),
        name: "Bram De Winter".to_string(),
        email: "bram@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 50.8503, longitude: 4.3517 },
},
Driver {
    user: User {
        id: "driver-042".to_string(),
        name: "Julie Claes".to_string(),
        email: "julie@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 51.2194, longitude: 4.4025 },
},
Driver {
    user: User {
        id: "driver-043".to_string(),
        name: "Seppe Van Dyck".to_string(),
        email: "seppe@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 51.0543, longitude: 3.7174 },
},
Driver {
    user: User {
        id: "driver-044".to_string(),
        name: "Anke Maertens".to_string(),
        email: "anke@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 50.8798, longitude: 4.7005 },
},
Driver {
    user: User {
        id: "driver-045".to_string(),
        name: "Niels Vandenbroeck".to_string(),
        email: "niels@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 50.9307, longitude: 5.3378 },
},
Driver {
    user: User {
        id: "driver-046".to_string(),
        name: "Laura Dierickx".to_string(),
        email: "laura@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 51.2093, longitude: 3.2247 },
},
Driver {
    user: User {
        id: "driver-047".to_string(),
        name: "Mathis Goossens".to_string(),
        email: "mathis@example.com".to_string(),
    },
    vehicle: Vehicle::Suv,
    location: Coordinates { latitude: 50.8282, longitude: 3.2649 },
},

// Trucks
Driver {
    user: User {
        id: "driver-048".to_string(),
        name: "Kenzo Van Damme".to_string(),
        email: "kenzo@example.com".to_string(),
    },
    vehicle: Vehicle::Truck,
    location: Coordinates { latitude: 51.2194, longitude: 4.4025 },
},
Driver {
    user: User {
        id: "driver-049".to_string(),
        name: "Brecht Smets".to_string(),
        email: "brecht@example.com".to_string(),
    },
    vehicle: Vehicle::Truck,
    location: Coordinates { latitude: 50.8503, longitude: 4.3517 },
},
Driver {
    user: User {
        id: "driver-050".to_string(),
        name: "Jens Verhaegen".to_string(),
        email: "jens@example.com".to_string(),
    },
    vehicle: Vehicle::Truck,
    location: Coordinates { latitude: 51.0543, longitude: 3.7174 },
},
Driver {
    user: User {
        id: "driver-051".to_string(),
        name: "Koenraad De Vos".to_string(),
        email: "koenraad@example.com".to_string(),
    },
    vehicle: Vehicle::Truck,
    location: Coordinates { latitude: 50.8282, longitude: 3.2649 },
},
Driver {
    user: User {
        id: "driver-052".to_string(),
        name: "Pieter Janssens".to_string(),
        email: "pieter@example.com".to_string(),
    },
    vehicle: Vehicle::Truck,
    location: Coordinates { latitude: 51.2240, longitude: 2.9287 },
},

// Motorcycles
Driver {
    user: User {
        id: "driver-053".to_string(),
        name: "Arno Vermeulen".to_string(),
        email: "arno@example.com".to_string(),
    },
    vehicle: Vehicle::Motorcycle,
    location: Coordinates { latitude: 51.2194, longitude: 4.4025 },
},
Driver {
    user: User {
        id: "driver-054".to_string(),
        name: "Kyan Wille".to_string(),
        email: "kyan@example.com".to_string(),
    },
    vehicle: Vehicle::Motorcycle,
    location: Coordinates { latitude: 50.8503, longitude: 4.3517 },
},
Driver {
    user: User {
        id: "driver-055".to_string(),
        name: "Lotte Smits".to_string(),
        email: "lotte.s@example.com".to_string(),
    },
    vehicle: Vehicle::Motorcycle,
    location: Coordinates { latitude: 51.0543, longitude: 3.7174 },
},
Driver {
    user: User {
        id: "driver-056".to_string(),
        name: "Finn Claeys".to_string(),
        email: "finn@example.com".to_string(),
    },
    vehicle: Vehicle::Motorcycle,
    location: Coordinates { latitude: 50.8798, longitude: 4.7005 },
},
Driver {
    user: User {
        id: "driver-057".to_string(),
        name: "Daan Peeters".to_string(),
        email: "daan.p@example.com".to_string(),
    },
    vehicle: Vehicle::Motorcycle,
    location: Coordinates { latitude: 50.9307, longitude: 5.3378 },
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
