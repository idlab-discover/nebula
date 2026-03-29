use crate::exports::nebula::playground::logging::Guest;
use crate::nebula::playground;
use crate::wasi::clocks::wall_clock;
use crate::wasi::otel;
use crate::wasi::otel::tracing;
use crate::wasi::random::random;

wit_bindgen::generate!({
	path: "wit",
	world: "parent",
	generate_all,
});

pub struct Parent;

impl Guest for Parent {
	fn log(msg: String) -> () {
		let parent = otel::tracing::outer_span_context();

		let child = otel::tracing::SpanContext {
			trace_id:    parent.trace_id,
			span_id:     format!("{:016x}", random::get_random_u64()),
			trace_flags: parent.trace_flags,
			trace_state: parent.trace_state,
			is_remote:   false,
		};

		otel::tracing::on_start(&child);

		playground::logging::log(&msg);

		otel::tracing::on_end(&tracing::SpanData {
			name:                  "parent".to_string(),
			parent_span_id:        parent.span_id,
			span_context:          child,
			span_kind:             tracing::SpanKind::Internal,
			start_time:            wall_clock::now(),
			end_time:              wall_clock::now(),
			attributes:            vec![],
			events:                vec![],
			links:                 vec![],
			status:                tracing::Status::Ok,
			instrumentation_scope: otel::types::InstrumentationScope {
				name:       "parent".to_string(),
				version:    None,
				schema_url: None,
				attributes: vec![],
			},
			dropped_attributes:    0,
			dropped_events:        0,
			dropped_links:         0,
		});
	}
}

export!(Parent);
