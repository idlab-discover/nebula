use crate::exports::nebula::inventory::inventory_api::{Guest, Item, Stock};
use crate::nebula::inventory::warehouse_engine::assess_fulfillment;

wit_bindgen::generate!({
	path: "wit",
	world: "inventory-api",
	generate_all,
});

struct InventoryApi;

impl Guest for InventoryApi {
	fn check_stock(items: Vec<Item>) -> Vec<Stock> {
		items.iter().flat_map(assess_fulfillment).collect()
	}
}

export!(InventoryApi);
