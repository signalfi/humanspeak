"""Tally blind-judge results for one test condition.

usage: python3 tally.py <condition>   e.g. base, skill3
"""
import json
import sys
from collections import Counter
from pathlib import Path

JUDGMENTS = Path(__file__).resolve().parent / "results" / "judgments"
BRIEFS = ("A", "P", "B")
LIST_KEYS = ("F1", "F2")
CATEGORY_KEYS = ("T14", "T15")


def load(brief: str, condition: str) -> list[dict[str, object]]:
    rows = []
    for path in sorted(JUDGMENTS.glob(f"{brief}_{condition}_*.json")):
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except json.JSONDecodeError as err:
            print(f"BAD {path.name}: {err}", file=sys.stderr)
            continue
        if not isinstance(data, dict):
            print(f"BAD {path.name}: expected a JSON object, got {type(data).__name__}", file=sys.stderr)
            continue
        rows.append(data)
    return rows


def summarize(key: str, vals: list, n: int) -> str:
    if all(isinstance(v, bool) for v in vals):
        return f"{key}: {sum(vals)}/{n}"
    if key in LIST_KEYS:
        items = [x for v in vals for x in (v or [])]
        return f"{key} docs: {sum(1 for v in vals if v)}/{n}; items: {len(items)}; e.g. {items[:4]}"
    if key in CATEGORY_KEYS:
        return f"{key}: {dict(Counter(vals))}"
    if key == "W2":
        return f"W2 stock vocab docs: {sum(1 for v in vals if v)}/{n} {[x for v in vals for x in (v or [])]}"
    return f"{key}: {vals}"


def main(condition: str) -> None:
    for brief in BRIEFS:
        rows = load(brief, condition)
        if not rows:
            continue
        n = len(rows)
        print(f"\n== {brief} {condition} (n={n})")
        # Union of keys across reps, so a key missing from the first file isn't dropped.
        for key in dict.fromkeys(k for r in rows for k in r):
            print("  " + summarize(key, [r.get(key) for r in rows], n))


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    main(sys.argv[1])
