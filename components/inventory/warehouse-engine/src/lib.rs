pub mod warehouse;

use crate::{
	exports::nebula::inventory::warehouse_engine::{Guest, Item, Stock},
	nebula::inventory::database_engine,
	warehouse::load_warehouse_slugs,
};

wit_bindgen::generate!({
	path: "wit",
	world: "warehouse-engine",
	generate_all
});

struct WarehouseEngine;

impl Guest for WarehouseEngine {
	/// Assess fulfillment for a given item across all warehouses.
	fn assess_fulfillment(item: Item) -> Vec<Stock> {
		let warehouses = load_warehouse_slugs().unwrap_or_default();

		warehouses
			.iter()
			.map(|warehouse_id| {
				let sku = item.sku.clone();
				let quantity =
					database_engine::get_stock_level(&sku, warehouse_id);
				Stock { sku, quantity, warehouse_id: warehouse_id.clone() }
			})
			.collect()
	}
}

export!(WarehouseEngine);
