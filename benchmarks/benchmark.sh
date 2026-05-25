#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <bearer_token>"
  exit 1
fi

BEARER_TOKEN="$1" wrk -t4 -c100 -d10s --latency -s benchmark.lua http://localhost:8000