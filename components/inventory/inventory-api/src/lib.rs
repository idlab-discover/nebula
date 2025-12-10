use crate::exports::nebula::inventory::inventory_api::{Guest, Item, Stock};
use crate::nebula::inventory::warehouse_engine;

wit_bindgen::generate!({
	path: "wit",
	world: "inventory-api",
	generate_all,
});

struct InventoryApi;

impl Guest for InventoryApi {
	/// Check stock for a list of items.
	fn check_stock(items: Vec<Item>) -> Vec<Stock> {
		items.iter().flat_map(warehouse_engine::assess_fulfillment).collect()
	}
}

export!(InventoryApi);
