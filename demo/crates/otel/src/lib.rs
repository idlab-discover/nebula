pub mod bindings {
    wit_bindgen::generate!({
        path: "wit",
        world: "otel",
        generate_all,
    });
}

pub mod logging;
pub mod metrics;
pub mod tracing;
