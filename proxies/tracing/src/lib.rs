mod bindings;

use std::collections::HashMap;
use std::sync::{LazyLock, Mutex};

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

/// A global map of in-flight spans, keyed by their span ID.
/// todo(ewout): This assumes functions behave correctly and close their own
/// spans, since we use `current_span_context` to find the span to close.
/// We'd need a `id` on `CallId` and store that in the `InflightSpan` to be more
/// robust.
static INFLIGHT_SPANS: LazyLock<Mutex<HashMap<u64, InflightSpan>>> =
    LazyLock::new(|| Mutex::new(HashMap::new()));

struct TracingProxy;

impl BeforeGuest for TracingProxy {
    /// Called before every invocation of a target-interface function.
    #[allow(async_fn_in_trait)]
    async fn on_call(call: CallId) {
        // Create a new span context for the call, using the current outer span
        // context as the parent.
        let parent_context = tracing::current_span_context();
        let span_id = format!("{:016x}", random::get_random_u64());

        let context = tracing::SpanContext {
            trace_id: parent_context.trace_id.clone(),
            span_id: span_id.clone(),
            trace_flags: tracing::TraceFlags::SAMPLED,
            is_remote: true,
            trace_state: parent_context.trace_state.clone(),
        };

        let start_time = wall_clock::now();
        let parent_span_id = parent_context.span_id;
        let name = format!("{}.{}", call.interface_name, call.function_name);

        let inflight_span = InflightSpan {
            context: context.clone(),
            parent_span_id: parent_span_id.clone(),
            start_time,
            name,
        };

        if let Ok(mut spans) = INFLIGHT_SPANS.lock() {
            spans.insert(call.id, inflight_span);
        }

        tracing::on_start(&context);
    }
}

impl AfterGuest for TracingProxy {
    /// Called after every invocation of a target-interface function.
    #[allow(async_fn_in_trait)]
    async fn on_return(call: CallId) {
        let end_time = wall_clock::now();

        let inflight: Option<InflightSpan> = INFLIGHT_SPANS
            .lock()
            .ok()
            .and_then(|mut spans| spans.remove(&call.id));

        let Some(inflight) = inflight else {
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
                name: PACKAGE_NAME.to_string(),
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
