use crate::exports::nebula::playground::logging::Guest;
use crate::wasi::logging::logging;

wit_bindgen::generate!({
	path: "wit",
	world: "child",
	generate_all
});

struct Child;

impl Guest for Child {
	fn log(msg: String) -> () { logging::log(logging::Level::Info, "", &msg); }
}

export!(Child);
