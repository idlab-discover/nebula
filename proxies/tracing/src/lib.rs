mod bindings;

use std::cell::RefCell;
use std::collections::HashMap;

use bindings::exports::splicer::tier1::after::Guest as AfterGuest;
use bindings::exports::splicer::tier1::before::Guest as BeforeGuest;
use bindings::wasi::clocks::wall_clock;
use bindings::wasi::otel::tracing;
use bindings::wasi::random::random;

use crate::bindings::export;

const PACKAGE_NAME: &str = "nebula:tracing";

struct InflightSpan {
	context: tracing::SpanContext,
	start_time: wall_clock::Datetime,
	parent_span_id: String,
	name: String,
}



thread_local! {
	static INFLIGHT_SPANS: RefCell<HashMap<String, InflightSpan>> = RefCell::new(HashMap::new());
}

struct TracingProxy;

impl BeforeGuest for TracingProxy {
	/// Called before every invocation of a target-interface function.
	#[allow(async_fn_in_trait)]
	async fn before_call(name: String) {
		// Create a new span context for the call, using the current outer span context as the parent.
		let parent_context = tracing::inner_span_context();
		let span_id = format!("{:016x}", random::get_random_u64());

		let context = tracing::SpanContext {
			trace_id: parent_context.trace_id.clone(),
			span_id: span_id.clone(),
			trace_flags: tracing::TraceFlags::SAMPLED,
			is_remote: true,
			trace_state: parent_context.trace_state.clone(),
		};

		let start_time =  wall_clock::now();
		let parent_span_id = parent_context.span_id;

		INFLIGHT_SPANS.with(|spans| {
			let mut spans = spans.borrow_mut();

			let inflight_span = InflightSpan {
				context: context.clone(),
				parent_span_id: parent_span_id.clone(),
				start_time,
				name: name.clone(),
			};

			spans.insert(
				span_id,
				inflight_span,
			);
		});

		tracing::on_start(&context);
	}
}

impl AfterGuest for TracingProxy {
	/// Called after every invocation of a target-interface function.
	#[allow(async_fn_in_trait)]
	async fn after_call(_name: String) {
		let current_context = tracing::inner_span_context();
		let end_time = wall_clock::now();

		let inflight = INFLIGHT_SPANS.with(|spans| spans.borrow_mut().remove(
			&current_context.span_id));

		let Some(inflight) = inflight else {
			// This can happen if the guest calls `tracing::on_end` itself, in which case we won't have an inflight span for it.
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
