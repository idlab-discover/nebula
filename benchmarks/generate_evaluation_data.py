#!/usr/bin/env python3
"""Generate CSV tables for the evaluation chapter from benchmark outputs.

The thesis plots use the raw `wrk` summaries stored in `results/*.txt` as the
source of truth. This script converts those summaries into smaller CSV files
that are easier to consume from pgfplots.

It regenerates:
- results/evaluation-baseline.csv
- results/evaluation-hop.csv
- results/evaluation-concurrent.csv
- results/evaluation-bloat.csv

Usage:
    python scripts/generate_evaluation_data.py
    python scripts/generate_evaluation_data.py --results-dir results
    python scripts/generate_evaluation_data.py --concurrent-p 1_2
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path
from typing import Iterable

FILE_RE = re.compile(
    r"^nebulift-(?P<variant>auto-instrumented|manual-instrument|uninstrumented)"
    r"-rnd-(?P<p>[0-9_]+)-c(?P<c>[0-9]+)\.txt$"
)

LATENCY_RE = re.compile(
    r"^\s*Latency\s+"
    r"(?P<avg>[0-9.]+)(?P<avg_unit>us|ms|s)\s+"
    r"(?P<stdev>[0-9.]+)(?P<stdev_unit>us|ms|s)\s+"
    r"(?P<max>[0-9.]+)(?P<max_unit>us|ms|s)\s+"
    r"(?P<pct>[0-9.]+)%\s*$",
    re.MULTILINE,
)

THREAD_RE = re.compile(
    r"^\s*Req/Sec\s+"
    r"(?P<avg>[0-9.]+)(?P<avg_unit>[kM]?)\s+"
    r"(?P<stdev>[0-9.]+)\s+"
    r"(?P<max>[0-9.]+)(?P<max_unit>[kM]?)\s+"
    r"(?P<pct>[0-9.]+)%\s*$",
    re.MULTILINE,
)

REQUESTS_PER_SEC_RE = re.compile(
    r"^Requests/sec:\s+(?P<value>[0-9.]+)\s*$",
    re.MULTILINE,
)
PERCENTILE_RE = re.compile(
    r"^\s*(?P<label>50|75|90|99)%\s+" r"(?P<value>[0-9.]+)(?P<unit>us|ms|s)\s*$",
    re.MULTILINE,
)

VARIANTS = ["uninstrumented", "manual-instrument", "auto-instrumented"]

DEFAULT_BLOAT_SIZES_KB = {
    "uninstrumented": 2372,
    "manual-instrument": 2420,
    "auto-instrumented": 2400,
}


def to_microseconds(value: float, unit: str) -> float:
    factors = {"us": 1.0, "ms": 1000.0, "s": 1_000_000.0}
    try:
        return value * factors[unit]
    except KeyError as exc:
        raise ValueError(f"unsupported latency unit: {unit}") from exc


def to_requests_per_sec(value: float, unit: str) -> float:
    factors = {"": 1.0, "k": 1000.0, "M": 1_000_000.0}
    try:
        return value * factors[unit]
    except KeyError as exc:
        raise ValueError(f"unsupported throughput unit: {unit}") from exc


def parse_wrk_summary(path: Path) -> dict[str, float | int | str]:
    match = FILE_RE.match(path.name)
    if not match:
        raise ValueError(f"unexpected benchmark filename: {path.name}")

    text = path.read_text()

    latency_match = LATENCY_RE.search(text)
    if not latency_match:
        raise ValueError(f"missing latency summary in {path}")

    thread_match = THREAD_RE.search(text)
    if not thread_match:
        raise ValueError(f"missing thread stats summary in {path}")

    requests_match = REQUESTS_PER_SEC_RE.search(text)
    if not requests_match:
        raise ValueError(f"missing Requests/sec line in {path}")

    percentiles: dict[str, float] = {}
    for percentile_match in PERCENTILE_RE.finditer(text):
        percentiles[percentile_match.group("label")] = to_microseconds(
            float(percentile_match.group("value")),
            percentile_match.group("unit"),
        )

    required_percentiles = {"50", "75", "90", "99"}
    missing = required_percentiles.difference(percentiles)
    if missing:
        raise ValueError(f"missing percentiles {sorted(missing)} in {path}")

    return {
        "variant": match.group("variant"),
        "p": match.group("p"),
        "c": int(match.group("c")),
        "latency_avg_us": to_microseconds(
            float(latency_match.group("avg")), latency_match.group("avg_unit")
        ),
        "latency_stdev_us": to_microseconds(
            float(latency_match.group("stdev")), latency_match.group("stdev_unit")
        ),
        "req_per_sec": float(requests_match.group("value")),
        "thread_reqsec_avg": to_requests_per_sec(
            float(thread_match.group("avg")), thread_match.group("avg_unit")
        ),
        "thread_reqsec_stdev": float(thread_match.group("stdev")),
        "p50_us": percentiles["50"],
        "p75_us": percentiles["75"],
        "p90_us": percentiles["90"],
        "p99_us": percentiles["99"],
    }


def sorted_hop_values(rows: Iterable[dict[str, float | int | str]]) -> list[str]:
    hop_values = sorted(
        {row["p"] for row in rows if row["c"] == 1},
        key=lambda value: 1 if value == "1_0" else int(str(value).split("_")[1]),
    )
    return [str(value) for value in hop_values]


def write_baseline(rows: list[dict[str, float | int | str]], output_dir: Path) -> None:
    by_key = {(row["variant"], row["p"], row["c"]): row for row in rows}
    baseline_path = output_dir / "evaluation-baseline.csv"

    with baseline_path.open("w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(
            [
                "variant",
                "latency_avg_us",
                "latency_stdev_us",
                "p50_us",
                "p75_us",
                "p90_us",
                "p99_us",
                "req_per_sec",
            ]
        )
        for variant in VARIANTS:
            row = by_key[(variant, "1_0", 1)]
            writer.writerow(
                [
                    variant,
                    f"{row['latency_avg_us']:.2f}",
                    f"{row['latency_stdev_us']:.2f}",
                    f"{row['p50_us']:.2f}",
                    f"{row['p75_us']:.2f}",
                    f"{row['p90_us']:.2f}",
                    f"{row['p99_us']:.2f}",
                    f"{row['req_per_sec']:.2f}",
                ]
            )


def write_hop(rows: list[dict[str, float | int | str]], output_dir: Path) -> None:
    by_key = {(row["variant"], row["p"], row["c"]): row for row in rows}
    hop_values = sorted_hop_values(rows)
    hop_path = output_dir / "evaluation-hop.csv"
    with hop_path.open("w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(
            [
                "variant",
                "denominator",
                "latency_avg_us",
                "latency_stdev_us",
                "req_per_sec",
            ]
        )
        for variant in VARIANTS:
            for p_value in hop_values:
                row = by_key[(variant, p_value, 1)]
                denominator = 1 if p_value == "1_0" else int(p_value.split("_")[1])
                writer.writerow(
                    [
                        variant,
                        denominator,
                        f"{row['latency_avg_us']:.2f}",
                        f"{row['latency_stdev_us']:.2f}",
                        f"{row['req_per_sec']:.2f}",
                    ]
                )

    for variant in VARIANTS:
        variant_path = output_dir / f"evaluation-hop-{variant}.csv"
        with variant_path.open("w", newline="") as handle:
            writer = csv.writer(handle)
            writer.writerow(
                ["denominator", "latency_avg_us", "latency_stdev_us", "req_per_sec"]
            )
            for p_value in hop_values:
                row = by_key[(variant, p_value, 1)]
                denominator = 1 if p_value == "1_0" else int(p_value.split("_")[1])
                writer.writerow(
                    [
                        denominator,
                        f"{row['latency_avg_us']:.2f}",
                        f"{row['latency_stdev_us']:.2f}",
                        f"{row['req_per_sec']:.2f}",
                    ]
                )


def write_concurrent(
    rows: list[dict[str, float | int | str]], output_dir: Path, concurrent_p: str
) -> None:
    by_key = {(row["variant"], row["p"], row["c"]): row for row in rows}
    concurrency_values = sorted(
        {int(row["c"]) for row in rows if row["p"] == concurrent_p}
    )
    concurrent_path = output_dir / "evaluation-concurrent.csv"
    with concurrent_path.open("w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(
            [
                "variant",
                "concurrency",
                "latency_avg_us",
                "latency_stdev_us",
                "thread_reqsec_avg",
                "thread_reqsec_stdev",
                "req_per_sec",
                "p90_us",
                "p99_us",
            ]
        )
        for variant in VARIANTS:
            for concurrency in concurrency_values:
                row = by_key[(variant, concurrent_p, concurrency)]
                writer.writerow(
                    [
                        variant,
                        concurrency,
                        f"{row['latency_avg_us']:.2f}",
                        f"{row['latency_stdev_us']:.2f}",
                        f"{row['thread_reqsec_avg']:.2f}",
                        f"{row['thread_reqsec_stdev']:.2f}",
                        f"{row['req_per_sec']:.2f}",
                        f"{row['p90_us']:.2f}",
                        f"{row['p99_us']:.2f}",
                    ]
                )

    for variant in VARIANTS:
        variant_path = output_dir / f"evaluation-concurrent-{variant}.csv"
        with variant_path.open("w", newline="") as handle:
            writer = csv.writer(handle)
            writer.writerow(
                [
                    "concurrency",
                    "latency_avg_us",
                    "latency_stdev_us",
                    "thread_reqsec_avg",
                    "thread_reqsec_stdev",
                    "req_per_sec",
                    "p90_us",
                    "p99_us",
                ]
            )
            for concurrency in concurrency_values:
                row = by_key[(variant, concurrent_p, concurrency)]
                writer.writerow(
                    [
                        concurrency,
                        f"{row['latency_avg_us']:.2f}",
                        f"{row['latency_stdev_us']:.2f}",
                        f"{row['thread_reqsec_avg']:.2f}",
                        f"{row['thread_reqsec_stdev']:.2f}",
                        f"{row['req_per_sec']:.2f}",
                        f"{row['p90_us']:.2f}",
                        f"{row['p99_us']:.2f}",
                    ]
                )


def write_bloat(output_dir: Path, sizes_kb: dict[str, int]) -> None:
    bloat_path = output_dir / "evaluation-bloat.csv"
    with bloat_path.open("w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["variant", "size_kb"])
        for variant in VARIANTS:
            writer.writerow([variant, sizes_kb[variant]])


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--results-dir",
        type=Path,
        default=None,
        help="directory containing the benchmark .txt files (defaults to ./results)",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=None,
        help="directory for the generated CSV files (defaults to ./results)",
    )
    parser.add_argument(
        "--concurrent-p",
        default="1_0",
        help="benchmark probability to use for the concurrency plots",
    )
    parser.add_argument(
        "--bloat-size",
        action="append",
        default=[],
        metavar="VARIANT=SIZE_KB",
        help=(
            "override the component size table, for example "
            "--bloat-size uninstrumented=2372"
        ),
    )
    args = parser.parse_args()

    results_dir = (args.results_dir or Path("./results")).resolve()
    output_dir = (args.output_dir or Path("./results")).resolve()

    if not results_dir.is_dir():
        raise SystemExit(f"results directory not found: {results_dir}")
    output_dir.mkdir(parents=True, exist_ok=True)

    rows = [
        parse_wrk_summary(path)
        for path in sorted(results_dir.glob("*.txt"))
        if FILE_RE.match(path.name)
    ]
    if not rows:
        raise SystemExit(f"no benchmark summaries found in {results_dir}")

    available_concurrent_ps = {row["p"] for row in rows}
    if args.concurrent_p not in available_concurrent_ps:
        raise SystemExit(
            f"concurrent probability {args.concurrent_p!r} is not present in the results set"
        )

    sizes = dict(DEFAULT_BLOAT_SIZES_KB)
    for item in args.bloat_size:
        if "=" not in item:
            raise SystemExit(f"invalid --bloat-size value: {item!r}")
        variant, size_text = item.split("=", 1)
        if variant not in sizes:
            raise SystemExit(f"unknown variant for --bloat-size: {variant!r}")
        sizes[variant] = int(size_text)

    write_baseline(rows, output_dir)
    write_hop(rows, output_dir)
    write_concurrent(rows, output_dir, args.concurrent_p)
    write_bloat(output_dir, sizes)

    print(f"wrote CSV tables to {output_dir}")


if __name__ == "__main__":
    main()
