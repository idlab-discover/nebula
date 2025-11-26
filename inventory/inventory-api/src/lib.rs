use crate::exports::nebula::inventory::inventory_api::{Guest, Item, Stock};
use crate::nebula::inventory::warehouse_engine;
use crate::wasi::logging::logging::{Level, log};

wit_bindgen::generate!({
	path: "wit",
	world: "inventory-api",
	generate_all,
});

const WORLD: &str = "inventory-api";

struct InventoryApi;

impl Guest for InventoryApi {
	fn check_stock(items: Vec<Item>) -> Vec<Stock> {
		log(
			Level::Info,
			WORLD,
			format!("Checking stock for {:?} items", items).as_str(),
		);
		items.iter().flat_map(warehouse_engine::assess_fulfillment).collect()
	}
}

export!(InventoryApi);
