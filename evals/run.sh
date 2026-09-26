#!/bin/bash
# Generate one draft with or without the skill, in an isolated Claude Code session.
# usage: bash run.sh <brief A|B|P> <condition base*|skill*> <rep>
# output: results/drafts/<brief>_<condition>_<rep>.md
set -euo pipefail
B=$1; C=$2; R=$3
case "$B" in A|B|P) ;; *) echo "brief must be A, B or P" >&2; exit 1 ;; esac
D=$(cd "$(dirname "$0")" && pwd)
SKILL=$(cd "$D/../skills/writing-like-a-human" && pwd)
OUT="$D/results/drafts/${B}_${C}_${R}"
SYS_FILE="$D/briefs/${B}_system.txt"
# The pressure brief (P) reuses the blog writer's system prompt.
[ "$B" = "P" ] && SYS_FILE="$D/briefs/A_system.txt"

# --safe-mode drops CLAUDE.md, skills, plugins and hooks so runs are clean.
ARGS=(-p --safe-mode --no-session-persistence --model opus --output-format json --system-prompt "$(cat "$SYS_FILE")")
if [[ "$C" == skill* ]]; then
  APPEND="The skill \"writing-like-a-human\" is loaded for this task. Its base directory is $SKILL (read files under references/ with the Read tool when the skill tells you to). SKILL.md content follows:

$(cat "$SKILL/SKILL.md")"
  ARGS+=(--tools Read --add-dir "$SKILL" --append-system-prompt "$APPEND")
else
  ARGS+=(--tools "")
fi

mkdir -p "$D/results/drafts"
# Prompt goes on stdin: --tools and --add-dir are variadic and would swallow a trailing argument.
JSON=$(claude "${ARGS[@]}" < "$D/briefs/${B}_user.txt")
jq -r '.result' <<< "$JSON" > "$OUT.md"
echo "$B $C $R done: $(wc -w < "$OUT.md") words, model=$(jq -r '.modelUsage|keys|join(",")' <<< "$JSON")"
