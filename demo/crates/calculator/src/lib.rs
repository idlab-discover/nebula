use crate::docs::adder::add;
use crate::exports::docs::calculator::calculate::{Guest, Op};

wit_bindgen::generate!({
	path: "wit",
	world: "calculator",
	generate_all
});

pub struct Calculator;

impl Guest for Calculator {
	fn eval_expression(op: Op, x: u32, y: u32) -> u32 {
		match op {
			Op::Add => add::add(x, y),
		}
	}
}

export!(Calculator);
