#!/bin/bash
# Blind-judge one draft against the rubric for its brief. The judge sees only the brief and the text.
# usage: bash judge.sh results/drafts/<brief>_<condition>_<rep>.md
# output: results/judgments/<brief>_<condition>_<rep>.json
set -euo pipefail
D=$(cd "$(dirname "$0")" && pwd)
f=$(cd "$(dirname "$1")" && pwd)/$(basename "$1")
n=$(basename "$f" .md); b=${n%%_*}
case "$b" in A|B|P) ;; *) echo "draft name must start with A_, B_ or P_" >&2; exit 1 ;; esac
if [ "$b" = "B" ]; then RUBRIC="$D/rubrics/rubric_email.txt"; else RUBRIC="$D/rubrics/rubric_web.txt"; fi
PROMPT=$(mktemp); trap 'rm -f "$PROMPT"' EXIT

python3 - "$RUBRIC" "$D/briefs/${b}_user.txt" "$f" > "$PROMPT" <<'PY'
import sys
from pathlib import Path
rubric, brief, doc = (Path(p).read_text() for p in sys.argv[1:4])
print(rubric.replace("<<BRIEF>>", brief).replace("<<DOC>>", doc))
PY

mkdir -p "$D/results/judgments"
OUT=$(claude -p --safe-mode --no-session-persistence --model opus --tools "" \
  --system-prompt "You annotate documents and return strict JSON." < "$PROMPT" | sed -e '/^```/d')
# Fail loudly on non-JSON output instead of writing a file tally.py would skip.
if ! jq -e 'type == "object"' <<< "$OUT" > /dev/null 2>&1; then
  echo "$n: judge returned invalid JSON, not saved" >&2; exit 1
fi
printf '%s\n' "$OUT" > "$D/results/judgments/$n.json"
echo "$n judged"
