# Example: a post on the Claude Opus 5.5 release, with and without the skill

- [`without-skill.md`](without-skill.md), 1,101 words
- [`with-skill.md`](with-skill.md), 955 words

Both come from the same brief ([`brief.txt`](brief.txt)): a post for an independent developer blog, written only from a fact sheet I checked against [Anthropic's announcement](https://www.anthropic.com/claude-opus-5-5) (September 22, 2026; retrieved September 26). The model was Opus 5.5 in an isolated `claude -p --safe-mode` session, with no CLAUDE.md, plugins or hooks, and a plain "You are a helpful assistant." system prompt. The only difference between the two runs is whether the skill was loaded. Each run is the first and only sample. Nothing was regenerated or edited. To reproduce, run `bash generate.sh`.

## What's different

**How they open.** The version without the skill opens on the release date and the question every launch post asks ("does this release change anything for you?"). It answers that question in the second paragraph: "In short, it probably does." The skill version opens on one detail buried near the bottom of the announcement: the "preserved thinking" safeguard, which only applies to API accounts created on or after August 31. It builds the post outward from there.

**Structure.** Without the skill there are 14 heading lines, including a third level, a numbered list and five bulleted lists. The post walks through the announcement in its own order: headline, pricing, speed, benchmarks, examples, writing, changes, safety, plans. With the skill there are 3 body headings, and the post is organized by what a reader would actually have to act on.

**Voice.** Without the skill the post reads as a neutral explainer. With the skill, a first-person author takes positions: they'd look at the cache-read row first, give the benchmarks less weight, and use fast mode only when waiting on an answer.

**Ending.** Without the skill it closes with a switch/test/wait plan and a final line telling you to test it yourself. With the skill it gives decision rules, then a copyable pre-switch checklist, then ends on the one group the rules don't cover: security practitioners.

**Missing material.** The skill version leaves a visible `[NEED: author's own Opus 5 vs Opus 5.5 cost and wall time on one real task, same prompt]` where first-hand data would go, instead of implying the author had measured something.

## Blind judge scores

The rubric is [`evals/rubrics/rubric_web.txt`](../../evals/rubrics/rubric_web.txt). The judge sees only the brief and the post. Raw output: `judgment-*.json`.

| Check (true = AI-leaning, except T13) | Without | With |
|---|---|---|
| T1 Title promises payoff | false | false |
| T2 Recommendation before the body | true | true |
| T3 Announces its structure | false | false |
| T4 Ending summarizes or restates | **true** | **false** |
| T5 Has a summary/synthesis stage | true | true |
| T8 Impersonal explainer voice | **true** | **false** |
| T9 Nothing beyond the article | false | false |
| T12 Dense headings (4+) | **true** | **false** |
| T13 Explicit decision rule (human-leaning) | true | true |
| T15 Ending type | action plan | new point |
| F1 Fabricated quotes/stats/names | none | none |
| F2 Invented first-hand experience | none | 1 |

## Honest notes

- **Opus 5.5 without the skill is already a decent writer.** Anthropic's announcement says Opus 5.5 "puts the most important information up front" and follows writing rules, and that shows. The baseline is clear and accurate, and it doesn't promise a payoff in its title. The gap here is smaller than in the evals, where the brief copied the paper's bare "expert content writer" setup.
- **The skill didn't fix everything.** Both posts still state their recommendation early, and both have a summary-like stage. That matches the evals, where "recommendation before the body" wasn't fixed either.
- **The skill version overreaches three times.**
  - The judge flagged "For my setup it matters more than any benchmark in the post," which implies an author setup the brief never gave.
  - Its line "the announcement says the program is growing but not what verification lets you do" is true of the fact sheet but not of the full announcement, which describes three tiers of access.
  - "Fable-level work at a lower price" compares against a Fable price that appears nowhere in the brief.
- **The version without the skill** has no factual errors that I found against the source.

This is n = 1 per condition. Read it as an illustration; the measured results are in [`evals/`](../../evals/).
