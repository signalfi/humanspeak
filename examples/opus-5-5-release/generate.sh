#!/bin/bash
# Generate the two example posts from brief.txt in isolated sessions; only the skill differs.
# usage: bash generate.sh
set -euo pipefail
D=$(cd "$(dirname "$0")" && pwd)
SKILL=$(cd "$D/../../skills/writing-like-a-human" && pwd)
BASE=(-p --safe-mode --no-session-persistence --model opus --output-format json --system-prompt "You are a helpful assistant.")
APPEND="The skill \"writing-like-a-human\" is loaded for this task. Its base directory is $SKILL (read files under references/ with the Read tool when the skill tells you to). SKILL.md content follows:

$(cat "$SKILL/SKILL.md")"
without() { claude "${BASE[@]}" --tools "" < "$D/brief.txt" | jq -er '.result' > "$D/without-skill.md"; }
with() { claude "${BASE[@]}" --tools Read --add-dir "$SKILL" --append-system-prompt "$APPEND" < "$D/brief.txt" | jq -er '.result' > "$D/with-skill.md"; }
# Run both in parallel; plain `wait` drops exit codes, so wait on each PID.
without & p1=$!
with & p2=$!
wait "$p1" || { echo "without-skill run failed" >&2; exit 1; }
wait "$p2" || { echo "with-skill run failed" >&2; exit 1; }
wc -w "$D/without-skill.md" "$D/with-skill.md"
