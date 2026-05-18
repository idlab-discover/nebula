use serde_json::json;
use wasi_http_framework::{Request, Response};

use crate::nebula::demo::{identity, matcher, payment, pricing};
use crate::schema::{RideRequest, RideResponse};

pub fn request_ride(req: &Request) -> Response {
	let request = match serde_json::from_slice::<RideRequest>(&req.body) {
		Ok(request) => request,
		Err(e) => {
			let msg = format!("Invalid request format: {}", e);
			return Response::json(json!({ "error": msg }), 400);
		},
	};

	// Authenticate the user based on the header bearer token
	let Some(token) = req
		.headers
		.iter()
		.find(|(k, _)| k.to_lowercase() == "authorization")
		.map(|(_, v)| v)
	else {
		return Response::json(
			json!({ "error": "Missing authorization token" }),
			401,
		);
	};

	let user = match identity::validate(token) {
		Ok(user) => user,
		Err(e) => {
			let msg = format!("Invalid token: {}", e);
			return Response::json(json!({ "error": msg }), 401);
		},
	};

	// Get the tentative pricing for the requested ride.
	let distance = request.pickup.distance_to(&request.dropoff);
	let price = pricing::calculate(distance, request.vehicle);

	// Find a driver
	let driver = match matcher::find(request.vehicle, request.pickup, price) {
		Ok(driver) => driver,
		Err(e) => {
			let msg = format!("Failed to find driver: {}", e);
			return Response::json(json!({ "error": msg }), 500);
		},
	};

	// Calculate payment URL
	let payment_url = match payment::generate_link(&user, price) {
		Ok(url) => url,
		Err(e) => {
			let msg = format!("Failed to generate payment link: {}", e);
			return Response::json(json!({ "error": msg }), 500);
		},
	};

	let distance_km = format!("{:.2}km", distance / 1000.0);
	let price_str = format!("€{:.2}", price);

	let response = RideResponse {
		driver,
		price: price_str,
		distance: distance_km,
		payment_url,
	};

	return Response::json(response, 200);
}

pub fn get_token(_req: &Request) -> Response {
	let token = match identity::token("id", "Ewout", "ewout.verlinde@ugent.be")
	{
		Ok(token) => token,
		Err(e) => {
			let msg = format!("Failed to generate token: {}", e);
			return Response::json(json!({ "error": msg }), 500);
		},
	};

	Response::json(json!({ "token": token }), 200)
}
