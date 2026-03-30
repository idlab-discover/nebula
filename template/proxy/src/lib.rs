use crate::bindings::export;
use crate::bindings::exports::nebula::service as service_export;
use crate::bindings::exports::wasi::http as http_export;
use crate::bindings::nebula::service as service_import;
use crate::bindings::wasi::http as http_import;

pub mod bindings;

pub struct Proxy;

impl service_export::orders::Guest for Proxy {
	fn create_order(
		order: service_export::orders::Order,
	) -> service_export::orders::Quote {
		println!("Creating order: {:?}", order);
		let order = service_import::orders::Order {
			order_id: "SKIBIDI IT WORKS!!".to_string(),
			..order
		};
		let result = service_import::orders::create_order(&order);
		println!("Order created: {:?}", result);
		result
	}

	fn delete_order(order_id: String) -> () {
		println!("Deleting order: {}", order_id);
		service_import::orders::delete_order(&order_id);
		println!("Order deleted");
	}

	fn read_order(order_id: String) -> Option<service_export::orders::Order> {
		println!("Reading order: {}", order_id);
		let result = service_import::orders::read_order(&order_id);
		println!("Order read: {:?}", result);
		result
	}
}

impl service_export::quotes::Guest for Proxy {
	fn read_quote(order_id: String) -> Option<service_export::quotes::Quote> {
		println!("Reading quote for order: {}", order_id);
		let result = service_import::quotes::read_quote(&order_id);
		println!("Quote received: {:?}", result);
		result
	}

	fn delete_quote(order_id: String) -> () {
		println!("Deleting quote for order: {}", order_id);
		service_import::quotes::delete_quote(&order_id);
		println!("Quote deleted");
	}
}

impl http_export::incoming_handler::Guest for Proxy {
	fn handle(
		request: http_export::incoming_handler::IncomingRequest,
		response_out: http_export::incoming_handler::ResponseOutparam,
	) -> () {
		println!("Received HTTP request: {:?}", request);
		http_import::incoming_handler::handle(request, response_out);
		println!("HTTP request handled");
	}
}

export!(Proxy with_types_in crate::bindings);
