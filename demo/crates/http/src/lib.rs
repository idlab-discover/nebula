mod bindings {
    wit_bindgen::generate!({
        path: "wit",
        world: "framework",
        generate_all
    });
}

pub use bindings::wasi;

pub mod request;
pub mod response;
pub mod router;

pub use request::Request;
pub use response::Response;
pub use router::Router;
