---
name: writing-like-a-human
description: Use when writing or rewriting a blog post, article, newsletter, landing page, marketing or web copy, email, announcement, or doc that should read as human-written, or when the user says a draft "sounds like AI", "reads like ChatGPT", is "AI slop", or asks to humanize, de-slop, or make it sound human. Not for code, commit messages, or strict templates.
---

# Writing like a human

**Core principle:** AI prose is caught by its *shape*, not its words. SlopShape (arXiv:2609.15369) detects AI blog posts at 98 F1 from structure alone, and rewording them doesn't lower that. The AI shape is "tidy and self-announcing": a payoff title, a thesis and roadmap up front, an impersonal explainer, a heading every few paragraphs, and a closing restatement. Every model crowds into that one configuration. Human pieces are structurally rarer and differ from one another.

## Pick the mode

- **Web mode:** blog posts, articles, newsletters, landing, marketing and web copy. Use the full recipe below.
- **General mode:** email, docs, reports, memos, messages. Put the bottom line first, then use the general-mode contract in `references/human-shapes.md` and do steps 5–6.

## Recipe (web mode)

1. **Material.** Collect the specifics you actually have: the user's first-hand facts, data, names, quotes, examples. Ask for them if the user is reachable. Never invent quotes, statistics, named people, customers, studies, or first-hand experience ("we see this constantly", "we always ask for…"). Where the piece needs one you don't have, write `[NEED: …]` saying what would go there. Opinions are fine without a source; events and habits are not.
2. **Shape card.** Before drafting, fill in all six slots and write them down: in your reasoning, or above the draft if you're working with the user.
   - **Shape:** one of the contracts in `references/human-shapes.md`, chosen to fit the material.
   - **Speaker:** a specific someone (a named author, byline placeholder, "we" as the team that builds X, host, curator), plus the 2–3 positions they'll take in first person ("we'd skip…", "I disagree with the usual advice to…"). The speaker shows up in most sections. A piece where "we" or "I" appears once reads as an explainer.
   - **Title:** a topic, a question, or a concrete object. Never "How to…", "N ways…", or "…and the fix".
   - **Opening move:** write down the first opening that comes to mind, then use a different one. The first paragraph is a concrete particular (an object, a moment, a case, a disagreement) and holds back the piece's recommendation. No roadmap.
   - **Ending move:** the last substantive point, a new consideration, a concrete next action, or simply stop. The ending adds something; it never summarizes.
   - **Take-away:** something usable beyond the prose: a copyable template, checklist, script or query, or a link or placeholder to one.
3. **Draft to the card.** Let the recommendation arrive in the body, after the material that earns it. Use headings only where a reader would jump to them (0–3, one level). Number steps only for a real sequence; numbered procedures are Claude's own fingerprint. Honor any length the user sets. If none is set, aim under 800 words.
4. **Structural audit.** Run `references/audit-rubric.md` on the draft and rebuild anything that fails. Moving a sentence doesn't count.
5. **Word pass.** Apply `references/word-level-tells.md`. The most common failure here is the "It isn't X. It's Y." reveal.
6. **Deliver** only what the user asked for. The shape card stays out of the deliverable unless the user wants it.

## Quick reference

| AI shape | Human alternative |
|---|---|
| Title promises the payoff | Title names the topic, a claim or an object |
| Thesis and roadmap before the body | Start in the material; let the argument arrive |
| Impersonal explainer | A specific speaker with opinions |
| Heading every few paragraphs | Few headings, one level |
| Summary or restated-thesis ending | End on a new point or an action, or stop |
| Nothing beyond the article | A usable artifact or route |
| Every piece looks alike | Pick a shape to fit this material |

Evidence and numbers: `references/structural-tells.md`.

## Common mistakes

- **Rewording instead of restructuring.** A reworded post is still 98% detectable.
- **Faking human traits.** Inventing quotes, customers or "we always…" experience to seem human. Use `[NEED: …]` instead.
- **Over-applying web mode.** Burying the bottom line of an email or memo. In general mode, the conclusion goes first.
- **Trading one template for another.** Without this skill, 5 of 5 test drafts opened "It's the 27th. You…". With a first draft of it, 4 of 5 opened "Pull the list and sort it by approver." If an opener could open any post on the topic, it's the default. Pick again.
