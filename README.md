# humanspeak

A Claude Code skill that changes the *shape* of what Claude writes, so blog posts, articles, marketing copy and emails stop reading like AI output.

Most "humanizer" advice swaps words: drop "delve", cut the em dashes. That doesn't work, and there's now evidence for why. [SlopShape](https://arxiv.org/abs/2609.15369) (Madler, 2026) detects AI-written commercial blog posts at 98 macro-F1 from structure alone. When each model rewrote its own posts, detection held at 98.1. The giveaway is how the piece is built:

- a title that promises the payoff;
- a thesis and roadmap before the body;
- an impersonal explainer voice;
- a heading every few paragraphs;
- a closing paragraph that restates the thesis.

All five frontier models tested crowd into that same configuration. Human posts are structurally rarer.

The skill, `writing-like-a-human`, has the writer do four things:
- **Gather real material first**, and mark gaps with `[NEED: …]` rather than inventing quotes, stats or experience.
- **Fill in a short shape card** before drafting: shape, speaker, title, opening, ending, and something the reader can take away.
- **Run a 14-question structural audit** on the draft.
- **Finish with a word-level pass.**

Emails, docs and memos get a lighter mode that keeps the bottom line first.

## Install

As a plugin:

```
/plugin marketplace add signalfi/humanspeak
/plugin install humanspeak@humanspeak
```

Or copy the skill in directly:

```bash
git clone https://github.com/signalfi/humanspeak.git
cp -R humanspeak/skills/writing-like-a-human ~/.claude/skills/
```

The skill triggers on requests to write or rewrite blog posts, articles, newsletters, landing or marketing copy, emails and docs, and on complaints like "this sounds like AI" or "de-slop this". You can also call it by name.

## What changed in testing

Opus 5.5 ran in isolated sessions (no CLAUDE.md, plugins or hooks), 5 drafts per condition. A separate model judged each draft blind against a fixed rubric. Blog and pressure briefs combined (10 drafts):

| Tell | Without skill | With skill |
|---|---|---|
| Title promises the payoff | 10/10 | 0/10 |
| Ending summarizes or restates the thesis | 8/10 | 0/10 |
| Impersonal explainer voice | 10/10 | 2/10 |
| Nothing usable beyond the article | 10/10 | 0/10 |
| Four or more headings | 10/10 | 0/10 |
| Numbered step-by-step procedure (Claude's fingerprint in the paper) | 6/10 | 0/10 |

The emails kept the bottom line first and stopped using document-style headings and bullets (5/5 → 0/5).

The skill does not yet stop the drafts from stating their recommendation early (10/10 either way). The tests are small: one model, one fictional company, and an LLM judge rather than the paper's own detector, which isn't public. Full numbers, every draft and the harness to rerun them are in [`evals/`](evals/).

## Example

[`examples/opus-5-5-release/`](examples/opus-5-5-release/) has two posts on the Claude Opus 5.5 release, written from the same verified fact sheet in isolated sessions, one with the skill and one without. Each is the first sample, unedited, with blind-judge scores and a fact-check.

## Layout

```
skills/writing-like-a-human/
  SKILL.md                       the recipe the model follows
  references/structural-tells.md SlopShape findings, numbers and caveats
  references/human-shapes.md     seven web shapes + the email/doc contract
  references/audit-rubric.md     14 yes/no structural checks with fixes
  references/word-level-tells.md secondary vocabulary and sentence pass
evals/                           briefs, rubrics, harness, 75 drafts + judgments
examples/opus-5-5-release/       side-by-side example post, with and without the skill
```

## Credit and licensing

The findings come from Jochen Madler, *SlopShape: Identifying AI-Generated Commercial Web Content*, arXiv:2609.15369 (2026), which replicates StoryScope (Russell et al., 2026) on commercial content. This repo paraphrases the paper's reported results and cites feature IDs. It copies none of the paper's annotation instrument or prompts; those are published under the author's own restrictive terms at [pulse-energy-eu/slopshape](https://github.com/pulse-energy-eu/slopshape). The author has a commercial interest in content scoring (Sitefire). This project is unaffiliated.

Everything in this repo is MIT licensed. "Ledgerline" in the test briefs is a made-up company.
