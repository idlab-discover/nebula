use crate::bindings::wasi::clocks::wall_clock::{Datetime, now};
use crate::bindings::wasi::otel::tracing;
use crate::bindings::wasi::otel::tracing::{Event, Link, SpanData, SpanKind, TraceFlags};
use crate::bindings::wasi::otel::{
    tracing::{SpanContext, Status},
    types::{InstrumentationScope, Key, KeyValue, Value},
};
use crate::bindings::wasi::random::random;

/// A span represents a single operation within a trace.
pub struct Span {
    pub name: String,
    pub parent_span_id: String,
    pub start_time: Datetime,
    pub context: SpanContext,
    pub status: Status,
    pub kind: SpanKind,
    pub attributes: Vec<KeyValue>,
    pub events: Vec<Event>,
    pub links: Vec<Link>,
    pub instrumentation_scope: InstrumentationScope,
}

impl Span {
    /// Create a new span with the given name and parent context
    #[must_use]
    pub fn new(name: &str, scope_name: &str) -> Self {
        let parent_context = tracing::inner_span_context();
        let span_id = random::get_random_u64();

        let context = SpanContext {
            trace_id: parent_context.trace_id,
            trace_state: parent_context.trace_state,
            span_id: format!("{:016x}", span_id),
            trace_flags: TraceFlags::SAMPLED,
            is_remote: true,
        };

        Self {
            name: name.to_string(),
            attributes: Vec::new(),
            events: Vec::new(),
            links: Vec::new(),
            context,
            start_time: now(),
            parent_span_id: parent_context.span_id,
            status: Status::Unset,
            kind: SpanKind::Internal,
            instrumentation_scope: InstrumentationScope {
                name: scope_name.to_string(),
                attributes: vec![],
                version: None,
                schema_url: None,
            },
        }
    }

    pub fn start(&self) {
        tracing::on_start(&self.context);
    }

    pub fn stop(self) {
        let data = SpanData {
            span_context: self.context,
            parent_span_id: self.parent_span_id,
            span_kind: self.kind,
            name: self.name,
            start_time: self.start_time,
            end_time: now(),
            attributes: self.attributes,
            events: self.events,
            links: self.links,
            status: self.status,
            instrumentation_scope: self.instrumentation_scope,
            dropped_attributes: 0,
            dropped_events: 0,
            dropped_links: 0,
        };

        tracing::on_end(&data);
    }

    /// Set the kind of the current span (e.g., internal, server, client)
    pub fn set_kind(&mut self, kind: SpanKind) {
        self.kind = kind;
    }

    /// Add a key-value attribute to the current span
    pub fn set_attribute(&mut self, key: Key, value: Value) {
        self.attributes.push(KeyValue { key, value });
    }

    /// Set the status of the current span
    pub fn set_status(&mut self, status: Status) {
        self.status = status;
    }

    /// Record an event on the current span
    pub fn add_event(&mut self, name: &str, attributes: Vec<KeyValue>) {
        self.events.push(Event {
            name: name.to_string(),
            time: now(),
            attributes,
        });
    }

    /// Add a causal link to another span
    pub fn add_link(&mut self, context: SpanContext, attributes: Vec<KeyValue>) {
        self.links.push(Link {
            span_context: context,
            attributes,
        });
    }
}

/// A tracer is responsible for creating spans and managing the lifecycle of a trace.
/// It provides methods to start and end spans, as well as to set attributes and status on spans.
pub struct Tracer {
    pub service_name: String,
}

impl Tracer {
    /// Create a new tracer with the given service name
    pub fn new(service_name: &str) -> Self {
        Self {
            service_name: service_name.to_string(),
        }
    }

    /// Execute `f` inside a new span, automatically starting and stopping it
    pub fn start_span<F, T>(&self, name: &str, f: F) -> T
    where
        F: FnOnce(&mut Span) -> T,
    {
        let mut span = Span::new(name, &self.service_name);

        span.start();
        let result = f(&mut span);
        span.stop();

        result
    }
}
