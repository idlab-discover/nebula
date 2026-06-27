mod bindings;

use std::cell::RefCell;

use bindings::exports::splicer::tier1::after::Guest as AfterGuest;
use bindings::exports::splicer::tier1::before::Guest as BeforeGuest;
use bindings::wasi::otel::tracing;
use bindings::wasi::random::random;

use crate::bindings::export;
use crate::bindings::exports::splicer::tier1::before::CallId;
use crate::bindings::wasi::clocks0_2_0::wall_clock;

const PACKAGE_NAME: &str = "nebula:tracing";

struct InflightSpan {
    context: tracing::SpanContext,
    start_time: wall_clock::Datetime,
    parent_span_id: String,
    name: String,
}

thread_local! {
    static INFLIGHT_SPANS: RefCell<Vec<InflightSpan>> =
        const { RefCell::new(Vec::new()) };

    static PRNG: fastrand::Rng =
        fastrand::Rng::with_seed(random::get_random_u64());
}

struct TracingProxy;

impl BeforeGuest for TracingProxy {
    #[allow(async_fn_in_trait)]
    async fn on_call(call: CallId) {
        let parent_context = tracing::current_span_context();
        let start_time = wall_clock::now();

        // Generate random u64 strictly in guest memory
        let raw_span_id = PRNG.with(|rng| rng.to_owned().u64(..));
        let span_id = format!("{:016x}", raw_span_id);

        let name = format!("{}.{}", call.interface_name, call.function_name);

        // We need a copy of this for the InflightSpan tracking
        let parent_span_id = parent_context.span_id.clone();

        // Construct the context using moves, no string cloning required!
        let context = tracing::SpanContext {
            trace_id: parent_context.trace_id,
            span_id,
            trace_flags: tracing::TraceFlags::SAMPLED,
            is_remote: true,
            trace_state: parent_context.trace_state,
        };

        // Pass by reference to the host
        tracing::on_start(&context);

        INFLIGHT_SPANS.with(|spans| {
            spans.borrow_mut().push(InflightSpan {
                context,
                parent_span_id,
                start_time,
                name,
            });
        });
    }
}

impl AfterGuest for TracingProxy {
    #[allow(async_fn_in_trait)]
    async fn on_return(_call: CallId) {
        let end_time = wall_clock::now();

        let Some(inflight) = INFLIGHT_SPANS.with(|spans| spans.borrow_mut().pop()) else {
            return;
        };

        let data = tracing::SpanData {
            span_context: inflight.context,
            parent_span_id: inflight.parent_span_id,
            name: inflight.name,
            start_time: inflight.start_time,
            span_kind: tracing::SpanKind::Internal,
            end_time,
            attributes: vec![],
            events: vec![],
            links: vec![],
            status: tracing::Status::Unset,
            instrumentation_scope: tracing::InstrumentationScope {
                name: PACKAGE_NAME.to_owned(),
                version: None,
                schema_url: None,
                attributes: vec![],
            },
            dropped_attributes: 0,
            dropped_events: 0,
            dropped_links: 0,
        };

        tracing::on_end(&data);
    }
}

export!(TracingProxy with_types_in bindings);
