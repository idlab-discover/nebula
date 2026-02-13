#!/usr/bin/env bash

set -e

# Cleanup function to gracefully shut down
cleanup() {
    echo "Shutting down..."
    docker compose -f observability/docker-compose-otel.yml down
    exit 0
}

# Trap SIGINT (Ctrl+C) and SIGTERM
trap cleanup SIGINT SIGTERM

# Start wasmCloud
echo "Starting..."
docker compose -f observability/docker-compose-otel.yml up -d --wait
WASMCLOUD_OBSERVABILITY_ENABLED="true" \
OTEL_EXPORTER_OTLP_ENDPOINT="http://127.0.0.1:4318" \
OTEL_TRACES_EXPORTER="otlp" \
OTEL_METRICS_EXPORTER="otlp" \
OTEL_LOGS_EXPORTER="otlp" \
wash up
