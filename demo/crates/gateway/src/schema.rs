use crate::nebula::core::types::{
    Country as CoreCountry, Currency as CoreCurrency, Item, Order, Quote,
};

// Local wrapper types so `serde` can derive on the gateway request/response
// types while still converting to/from the generated core types.
#[derive(serde::Deserialize, serde::Serialize, Debug, Clone, Copy)]
#[serde(rename_all = "UPPERCASE")]
pub enum Country {
    Be,
    Us,
    Uk,
    Jp,
    Au,
    Ca,
}

impl From<Country> for CoreCountry {
    fn from(c: Country) -> Self {
        match c {
            Country::Be => CoreCountry::Be,
            Country::Us => CoreCountry::Us,
            Country::Uk => CoreCountry::Uk,
            Country::Jp => CoreCountry::Jp,
            Country::Au => CoreCountry::Au,
            Country::Ca => CoreCountry::Ca,
        }
    }
}

impl From<CoreCountry> for Country {
    fn from(c: CoreCountry) -> Self {
        match c {
            CoreCountry::Be => Country::Be,
            CoreCountry::Us => Country::Us,
            CoreCountry::Uk => Country::Uk,
            CoreCountry::Jp => Country::Jp,
            CoreCountry::Au => Country::Au,
            CoreCountry::Ca => Country::Ca,
        }
    }
}

#[derive(serde::Serialize, Debug, Clone, Copy)]
#[serde(rename_all = "UPPERCASE")]
pub enum Currency {
    Eur,
    Usd,
    Gbp,
    Jpy,
    Aud,
    Cad,
}

impl From<CoreCurrency> for Currency {
    fn from(c: CoreCurrency) -> Self {
        match c {
            CoreCurrency::Eur => Currency::Eur,
            CoreCurrency::Usd => Currency::Usd,
            CoreCurrency::Gbp => Currency::Gbp,
            CoreCurrency::Jpy => Currency::Jpy,
            CoreCurrency::Aud => Currency::Aud,
            CoreCurrency::Cad => Currency::Cad,
        }
    }
}

impl From<Currency> for CoreCurrency {
    fn from(c: Currency) -> Self {
        match c {
            Currency::Eur => CoreCurrency::Eur,
            Currency::Usd => CoreCurrency::Usd,
            Currency::Gbp => CoreCurrency::Gbp,
            Currency::Jpy => CoreCurrency::Jpy,
            Currency::Aud => CoreCurrency::Aud,
            Currency::Cad => CoreCurrency::Cad,
        }
    }
}

#[derive(serde::Deserialize, serde::Serialize)]
#[serde(rename_all = "camelCase")]
pub struct ItemRequest {
    sku: String,
    quantity: u32,
    unit_price: f64,
}

impl From<ItemRequest> for Item {
    fn from(item: ItemRequest) -> Self {
        Item {
            sku: item.sku,
            quantity: item.quantity,
            unit_price: item.unit_price,
        }
    }
}

#[derive(serde::Deserialize, serde::Serialize)]
#[serde(rename_all = "camelCase")]
pub struct OrderRequest {
    pub order_id: String,
    pub items: Vec<ItemRequest>,
    pub destination: Country,
}

impl From<OrderRequest> for Order {
    fn from(order: OrderRequest) -> Self {
        Order {
            order_id: order.order_id,
            items: order.items.into_iter().map(Into::into).collect(),
            destination: order.destination.into(),
        }
    }
}

#[derive(serde::Serialize)]
#[serde(rename_all = "camelCase")]
pub struct QuoteResponse {
    order_id: String,
    subtotal: f64,
    tax: f64,
    total: f64,
    currency: Currency,
}

impl From<Quote> for QuoteResponse {
    fn from(quote: Quote) -> Self {
        QuoteResponse {
            order_id: quote.order_id,
            subtotal: quote.subtotal,
            tax: quote.tax,
            total: quote.total,
            currency: quote.currency.into(),
        }
    }
}
