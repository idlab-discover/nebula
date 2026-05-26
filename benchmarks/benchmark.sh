#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <bearer_token>"
  exit 1
fi

BEARER_TOKEN="$1"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DEMO_BIN_DIR="$REPO_ROOT/demo/bin"
ASPIRE_COMPOSE_FILE="$REPO_ROOT/demo/otel/docker-compose-aspire.yml"

CONCURRENCY_LEVELS=(1 2 4 8 16 32)
REQUEST_BODY='{"vehicle":"Suv","pickup":{"latitude":51.0416,"longitude":3.6697},"dropoff":{"latitude":51.0543,"longitude":3.7174}}'

if [ ! -d "$DEMO_BIN_DIR" ]; then
  echo "Missing demo bin directory: $DEMO_BIN_DIR" >&2
  exit 1
fi

shopt -s nullglob
COMPONENTS=("$DEMO_BIN_DIR"/nebulift-auto*.wasm)

if [ "${#COMPONENTS[@]}" -eq 0 ]; then
  echo "No wasm components found in $DEMO_BIN_DIR" >&2
  exit 1
fi

cleanup() {
  if [ -n "${WASH_PID:-}" ] && kill -0 "$WASH_PID" 2>/dev/null; then
    kill "$WASH_PID" 2>/dev/null || true
    wait "$WASH_PID" 2>/dev/null || true
  fi

  if [ -n "${TMP_PROJECT_DIR:-}" ] && [ -d "$TMP_PROJECT_DIR" ]; then
    rm -rf "$TMP_PROJECT_DIR"
  fi
}

trap cleanup EXIT INT TERM

for component_path in "${COMPONENTS[@]}"; do
  component_name="$(basename "${component_path%.wasm}")"
  TMP_PROJECT_DIR="$(mktemp -d)"
  mkdir -p "$TMP_PROJECT_DIR/.wash"

  cat > "$TMP_PROJECT_DIR/.wash/config.yaml" <<EOF
build:
  command: "true"
  component_path: "$component_path"

dev:
  wasi_otel: true
EOF

  OTEL_ENABLED=true taskset -c 0-15 \
    wash -C "$TMP_PROJECT_DIR" dev \
    >"$SCRIPT_DIR/results/${component_name}.wash.log" 2>&1 &

  WASH_PID=$!

  until curl -sS --max-time 1 -o /dev/null 2> /dev/null \
    -X POST \
    -H "Authorization: $BEARER_TOKEN" \
    -H "Content-Type: application/json" \
    -d "$REQUEST_BODY" \
    http://localhost:8000/ride; do
    if ! kill -0 "$WASH_PID" 2>/dev/null; then
      exit 1
    fi
    sleep 1
  done

  echo "Wash devserver online"

  for connections in "${CONCURRENCY_LEVELS[@]}"; do
    output_file="$SCRIPT_DIR/results/${component_name}-c${connections}.txt"
    threads=$(( connections > 8 ? 8 : connections ))
    echo "Benchmarking $component_name with c=${connections}"

    BEARER_TOKEN="$BEARER_TOKEN" taskset -c 16-23 \
      wrk \
      -t"$threads" \
      -c"$connections" \
      -d10s \
      --latency \
      -s "$SCRIPT_DIR/benchmark.lua" \
      http://localhost:8000 \
      >"$output_file" 2>&1
  done

#  docker compose -f "$ASPIRE_COMPOSE_FILE" restart aspire-dashboard >/dev/null 2>&1 \
#    || docker compose -f "$ASPIRE_COMPOSE_FILE" up -d aspire-dashboard >/dev/null 2>&1

  kill "$WASH_PID" 2>/dev/null || true
  wait "$WASH_PID" 2>/dev/null || true
  unset WASH_PID

  # rm -rf "$TMP_PROJECT_DIR"
  unset TMP_PROJECT_DIR
done
