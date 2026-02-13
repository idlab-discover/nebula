# **Thesis Architecture: Orchestrator-Agnostic Glass-Box Tracing**

## **1\. Summary**

The goal is to transition WebAssembly (Wasm) components from **"Black Boxes"** to **"Glass Boxes"** by enabling deep intra-component tracing without developer intervention. The architecture utilizes **Build-Time Virtualization** to inject telemetry stubs (Proxies) at every interface boundary. By standardizing the internal context propagation via a unified observability.wit interface, the system ensures that orchestrator-level (inter-component) spans and component-level (intra-component) spans are flawlessly stitched into a single distributed trace.

## **2\. Core Architectural Components**

### **A. The Universal Context Handler (observability.wit)**

This is the internal "glue." Every instrumented component imports this interface. It provides a standardized way for any proxy to retrieve the current trace-id and parent-span-id.

- **Standardization:** It uses W3C TraceContext semantics (string-based) to remain compatible with OpenTelemetry (OTel).
- **Role:** It decouples the tracing logic from the host environment. Sub-proxies don't know if they are in wasmCloud or Spin; they only know how to ask the context-handler for the current ID.

### **B. The Root Proxy (Inter-Component Bridge)**

The Root Proxy is the "Entry Point" wrapper. It is the only platform-aware part of the architecture.

- **Extraction:** When a call arrives (via wasi:http or wasm-rpc), the Root Proxy extracts the trace metadata.
- **Initialization:** It seeds the internal context-handler with this parent ID.
- **Platform Agnosticism:** You build one Root Proxy for wasmCloud (extracting from NATS/WASM-RPC) and one for Spin (extracting from HTTP headers). The internal business logic remains identical.

### **C. The Sub-Proxy (Intra-Component Stub)**

These are the "Injected Links" created during the WAC composition step.

- **Instrumentation:** For every WIT import (e.g., tax-engine), a stub is generated.
- **Logic:**
  1. Call context-handler::get-context().
  2. Start a child span via OTel.
  3. Execute the target function.
  4. Close the span.
- **Zero Effort:** Generated automatically by the build toolchain; requires no changes to the business logic in main.c.

## **3\. Stitching Inter and Intra-Component Spans**

The "flawless" integration is achieved through a **Parentage Chain** established at link-time.

1. **Orchestrator Level:** wasmCloud starts a span (**Span A**) when the Gateway is called.
2. **Boundary Crossing:** The Gateway Root Proxy catches Span A’s ID.
3. **Internal Branching:** When the Gateway calls the Pricing component, the Pricing Root Proxy catches the ID from the lattice bus.
4. **Glass-Box Expansion:** Inside Pricing, the Tax-Engine Sub-Proxy creates a child span (**Span B**) using the ID from the Pricing Root Proxy as its parent.
5. **Visualization:** In the UI (Jaeger), Span B appears nested directly under the Pricing component's lattice span.

## **4\. Performance & Telemetry Offloading**

Emitting OTel data synchronously within a Wasm sandbox is a performance killer due to the "Stop-the-World" nature of synchronous I/O. To prevent this, the architecture employs **Host-Mediated Asynchronous Offloading**.

### **A. Non-Blocking Telemetry Egress**

Instead of the Proxy implementing a full OTLP/HTTP stack (which is heavy and slow), the Proxy uses a **"Fire and Forget"** call to a custom Host Capability or a standard WASI Outbound pipe.

### **B. The Telemetry Provider (wasmCloud specific)**

In wasmCloud, we introduce a specialized **Telemetry Provider**.

- **The Proxy Action:** It emits a small, serialized binary packet (containing only SpanName, StartTime, EndTime, and TraceID) to the provider. This is a nanosecond-scale host call.
- **The Provider Action:** The provider (running in the multi-threaded Host) buffers these packets and sends them to the Otel Collector asynchronously.
- **Result:** The Wasm component's execution is never paused for network I/O. The overhead is reduced to the cost of a single function call per span.

## **5\. Build-Time Workflow (The "Thesis Toolchain")**

The 100% viable path for the implementation is a 3-step automated pipeline:

1. **Analysis:** Scans the WIT files of the components (e.g., inventory-api.wit).
2. **Generation:**
   - Creates the Root Proxy based on the entry-point interface.
   - Generates Sub-Proxy stubs for every imported engine.
3. **Composition (WAC):** Generates an inventory-api-composition.wac that links these pieces together:

let api_root \= new root_proxy { ... };  
let tax_stub \= new tax_proxy { upstream: real_tax_engine };  
let api \= new real_api {  
 "nebula:pricing/tax-engine": tax_stub,  
 "nebula:observability/context": api_root  
};

## **6\. Conclusion**

This architecture is viable because it solves the **"Observability vs. Portability"** trade-off. By moving the "Knowledge of the Host" into a swappable Root Proxy and the "Knowledge of the Trace" into automated Sub-Proxies, we create a solution that is transparent to the developer, invisible to the business logic, and high-performance enough for production lattice environments.
