use crate::exports::docs::adder::add::Guest;

wit_bindgen::generate!({
	path: "wit",
	world: "adder",
	generate_all
});

pub struct Adder;

impl Guest for Adder {
	fn add(x: u32, y: u32) -> u32 { x + y }
}

export!(Adder);
