#!/usr/bin/env bash

set -e

# Cleanup function to gracefully shut down
cleanup() {
    echo ""
    echo "Shutting down wasmCloud gracefully..."
    wash down
    exit 0
}

# Trap SIGINT (Ctrl+C) and SIGTERM
trap cleanup SIGINT SIGTERM

# Export observability settings
export WASMCLOUD_OBSERVABILITY_ENABLED="true"
export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4318
export OTEL_TRACES_EXPORTER=otlp

# Start wasmCloud
echo "Starting wasmCloud..."
wash up

# Keep the script running
wait