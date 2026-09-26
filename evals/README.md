# Evals

These show whether the skill changes the structure of what the model writes, not just its word choices. Each draft comes from an isolated `claude -p --safe-mode` session, so no CLAUDE.md, plugins or hooks are loaded. A second isolated session then judges every draft blind. The judge sees only the brief and the text, and never learns whether the skill was loaded.

## Briefs

- **A (blog):** built the way SlopShape built its AI mirrors. The system prompt is "You are an expert content writer who produces rich, detailed articles." The user message is a one-paragraph brief ("Write a blog post for Ledgerline, which sells…") asking for about 1,000 words.
- **P (pressure):** brief A with the ask "include quotes from finance leaders and a couple of hard statistics… We need it today." It tests whether the skill pushes the model into inventing sources.
- **B (email):** a product-update email with a plain assistant system prompt. It tests the general mode.

"Ledgerline" is a made-up company.

## Conditions

| Condition | What ran |
|---|---|
| `base` | No skill. Judged with the rubric before check F2 was added. |
| `base2` | No skill (a second baseline; it reproduces `base`). |
| `skill` | Skill v1. |
| `skill2` | Skill v2. The v1 opening allowed "a claim", which pulled the recommendation into paragraph one, so v2 required a concrete particular and discarding the first idea. v1 drafts also invented first-hand experience, so v2 added a guard against it. |
| `skill3` | Skill v3, the version in this repo. v2's speaker slot was too weak (the explainer voice came back), so v3 made the speaker hold 2–3 first-person positions throughout. |

## Results (blog + pressure briefs, 10 drafts per condition)

| Check | base | base2 | skill | skill2 | skill3 |
|---|---|---|---|---|---|
| Payoff title | 10/10 | 10/10 | 0/10 | 0/10 | 0/10 |
| Thesis before body | 8/10 | 9/10 | 10/10 | 9/10 | 10/10 |
| Announces structure | 1/10 | 4/10 | 1/10 | 5/10 | 1/10 |
| Summary/restated ending | 8/10 | 9/10 | 0/10 | 0/10 | 0/10 |
| Summary section | 3/10 | 1/10 | 0/10 | 0/10 | 0/10 |
| Editorial-explainer voice | 10/10 | 10/10 | 2/10 | 9/10 | 2/10 |
| No route beyond article | 10/10 | 9/10 | 1/10 | 1/10 | 0/10 |
| Numbered procedure | 6/10 | 6/10 | 0/10 | 0/10 | 0/10 |
| Dense headings (4+) | 10/10 | 10/10 | 0/10 | 0/10 | 0/10 |
| Decision rule present (human-leaning) | 10/10 | 10/10 | 10/10 | 10/10 | 10/10 |
| Fabricated quote/stat/name | 1/10 | 1/10 | 0/10 | 1/10 | 0/10 |
| Invented first-hand experience | n/a | 2/10 | 10/10 | 0/10 | 2/10 |
| "Not X, it's Y" reveals (mean per draft) | 3.1 | 2.5 | 1.4 | 0.9 | 1.2 |

| Email check (5 drafts) | base | base2 | skill | skill2 | skill3 |
|---|---|---|---|---|---|
| Bottom line first (want yes) | 5/5 | 5/5 | 5/5 | 5/5 | 5/5 |
| Previews itself | 0/5 | 0/5 | 0/5 | 0/5 | 0/5 |
| Closing recap | 0/5 | 1/5 | 0/5 | 0/5 | 0/5 |
| Filler opener | 0/5 | 0/5 | 0/5 | 0/5 | 0/5 |
| Document-style formatting | 5/5 | 5/5 | 0/5 | 0/5 | 0/5 |

## Reading the numbers

- **Fabrication under pressure.** Without the skill, Opus 5.5 already declined to invent quotes and statistics. On the pressure brief it used `[QUOTE NEEDED]` placeholders. So the skill's fabrication rule is a guard: the skill pushes toward human evidence traits such as named voices and first-person experience, and v1 showed that push can backfire.
- **Email F1 is noisy.** The judge's email fabrication check flags ordinary elaborations (for example "many of you told us"). It fired on baseline emails too, so the table leaves it out.
- **Length.** It isn't scored, because the brief asks for about 1,000 words and the skill honors a requested length.
- **Thesis before body stayed high.** The skill's drafts use few or no headings, which makes "before the first body section" hard to judge.
- **Limits.** Small n, one model (Opus 5.5), one fictional company, and an LLM judge. The paper's own classifier is gated, so it couldn't be used.

## Rerun

Requires the `claude` CLI (logged in), `jq` and `python3`.

```bash
cd evals
for b in A B P; do for r in 1 2 3 4 5; do bash run.sh $b mytest $r & done; done; wait
for f in results/drafts/*_mytest_*.md; do bash judge.sh "$f" & done; wait
python3 tally.py mytest
```

A condition name starting with `skill` loads the skill; any other name runs the baseline.
