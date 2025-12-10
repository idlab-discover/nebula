use rand::Rng;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug, Clone, Copy)]
#[serde(rename_all = "UPPERCASE")]
pub enum Country {
    Be,
    Us,
    Uk,
    Jp,
    Au,
    Ca,
}

impl Country {
    pub fn random<R: Rng>(rng: &mut R) -> Self {
        match rng.random_range(0..6) {
            0 => Country::Be,
            1 => Country::Us,
            2 => Country::Uk,
            3 => Country::Jp,
            4 => Country::Au,
            _ => Country::Ca,
        }
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct ItemRequest {
    sku: String,
    quantity: u32,
    unit_price: f64,
}

impl ItemRequest {
    pub fn random<R: Rng>(rng: &mut R) -> Self {
        let sku = format!("SKU-{:05}", rng.random_range(10000..99999));
        let quantity = rng.random_range(1..51);

        let unit_price = f64::from(rng.random_range(5.0..1000.0));
        let unit_price = (unit_price * 100.0).round() / 100.0;

        ItemRequest {
            sku,
            quantity,
            unit_price,
        }
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct OrderRequest {
    pub order_id: String,
    pub items: Vec<ItemRequest>,
    pub destination: Country,
}

impl OrderRequest {
    pub fn random<R: Rng>(rng: &mut R) -> Self {
        let order_id = format!("ORD-2025-{:06}", rng.random_range(100000..999999));

        let item_count = rng.random_range(1..13);
        let items: Vec<ItemRequest> = (0..item_count).map(|_| ItemRequest::random(rng)).collect();

        let destination = Country::random(rng);

        OrderRequest {
            order_id,
            items,
            destination,
        }
    }
}
