use jsonwebtoken::{
	Algorithm,
	DecodingKey,
	EncodingKey,
	Header,
	Validation,
	decode,
	encode,
};
use serde::{Deserialize, Serialize};
use wasi_otel_framework::tracing::Tracer;

use crate::exports::nebula::demo::identity::Guest;
use crate::nebula::demo::types::User;

wit_bindgen::generate!({
	path: "wit",
	world: "identity",
	generate_all
});

#[derive(Serialize, Deserialize)]
struct JwtPayload {
	id:    String,
	name:  String,
	email: String,
	exp:   usize,
}

const JWT_SECRET: &[u8] = b"nebula-demo-identity-secret";
const JWT_TTL_SECS: usize = 12 * 60 * 60;

// static TRACER: LazyLock<Tracer> =
// 	LazyLock::new(|| Tracer::new("nebula-order-service"));

pub struct Identity;

impl Guest for Identity {
	//// Validate a JWT token and return the corresponding user record.
	#[allow(async_fn_in_trait)]
	fn validate(token: String) -> Result<User, String> {
		let tracer = Tracer::new("demo-identity");

		tracer.start_span("identity::validate", |_span| {
			let validation = Validation::new(Algorithm::HS256);
			let claims = decode::<JwtPayload>(
				&token,
				&DecodingKey::from_secret(JWT_SECRET),
				&validation,
			)
			.map_err(|e| format!("jwt decode error: {}", e))?
			.claims;

			Ok(User {
				id:    claims.id,
				name:  claims.name,
				email: claims.email,
			})
		})
	}

	/// Get a JWT token for a given user.
	#[allow(async_fn_in_trait)]
	fn token(
		id: String,
		name: String,
		email: String,
	) -> Result<String, String> {
		let tracer = Tracer::new("demo-identity");

		tracer.start_span("identity::token", |_span| {
			let now = std::time::SystemTime::now()
				.duration_since(std::time::UNIX_EPOCH)
				.map_err(|e| format!("time error: {}", e))?
				.as_secs() as usize;

			let claims =
				JwtPayload { id, name, email, exp: now + JWT_TTL_SECS };

			encode(
				&Header::new(Algorithm::HS256),
				&claims,
				&EncodingKey::from_secret(JWT_SECRET),
			)
			.map_err(|e| format!("jwt encode error: {}", e))
		})
	}
}

export!(Identity);
