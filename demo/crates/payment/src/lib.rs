use wasi_otel_framework::tracing::Tracer;

use crate::exports::nebula::demo::payment::Guest;
use crate::nebula::demo::types::User;

wit_bindgen::generate!({
	path: "wit",
	world: "payment",
	generate_all
});

pub struct Payment;

impl Guest for Payment {
	//// Generate a payment link for a given amount and user.
	#[allow(async_fn_in_trait)]
	fn generate_link(user: User, amount: f64) -> Result<String, String> {
		let tracer = Tracer::new("demo-payment");

		tracer.start_span("payment::generate-link", |_span| {
			if amount <= 0.0 {
				return Err("amount must be greater than 0".to_string());
			}

			Ok(format!(
				"https://payments.nebula.demo/pay?user_id={}&amount={:.2}",
				user.id, amount
			))
		})
	}
}

export!(Payment);
