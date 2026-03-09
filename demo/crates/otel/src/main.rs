use wasi_otel_framework::bindings::wasi::otel::tracing::Status;
use wasi_otel_framework::tracing::Tracer;

fn main() {
    let tracer = Tracer::new("my-service");

    // If the tracer lives in the same execution context as the application code,
    // context propagation can be implemented in the tracer itself, no problem here.
    tracer.start_span("handle-request", |_span| {
        // Simulate some work
        for i in 0..5 {
            tracer.start_span(&format!("step-{}", i), |span| {
                span.set_attribute("step.number".to_string(), i.to_string());
            });
        }

        // Simulate an error
        tracer.start_span("finalize", |span| {
            span.set_status(Status::Error("Something went wrong".to_string()));
        });
    });

    // If the tracing crosses a logical boundary (in the case of statically composed components),
    // we have a problem. The current span context should be shared across the boundary, which is a
    // responsibility of the WASM runtime.

    // Start gateway.wasm
    tracer.start_span("handle-request", |span| {
        span.set_attribute("request.id".to_string(), "12345".to_string());

        // Start service.wasm
        // At this point, service.wasm has no idea that it is a child span of "handle-request" in gateway.wasm,
        // because the span context was not propagated across the boundary.
        let tracer = Tracer::new("my-service");

        tracer.start_span("create-order", |span| {
            span.set_attribute("order.id".to_string(), "abcde".to_string());
        });
        // End service.wasm
    });
    // End gateway.wasm

    // Solution: the `wasi:otel` implementation/proposal should be changed.
    // Proposal: `outer-span-context` should always return the latest span context created by `on-start`.
    // This could essentially be a stack of span contexts, where `on-start` pushes a new context and `on-end` pops it.
    // This way, the current span context is always available, even across logical boundaries.
}
