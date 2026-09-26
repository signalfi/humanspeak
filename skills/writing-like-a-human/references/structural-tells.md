# Structural tells: the evidence

Source: Madler, *SlopShape: Identifying AI-Generated Commercial Web Content*, arXiv:2609.15369 (v2, 17 Sep 2026). Code and artifacts: github.com/pulse-energy-eu/slopshape. Everything here is paraphrased. The paper's feature instrument and prompts are "all rights reserved", so only feature IDs and reported numbers are cited.

## Study in one paragraph
The corpus is 2,250 human B2B blog posts written before ChatGPT (268 company domains, 2008–22) and 11,250 AI "mirrors". Each mirror was written from a brief reverse-engineered from a human post, by gpt-5.4, claude-sonnet-4.6, gemini-3-flash, deepseek-v3.2 or kimi-k2.5, with the bare prompt "You are an expert content writer…". Each post was annotated with 214 features: 187 structural and 27 style. Results:
- **Structural features alone:** 98.0 macro-F1 on held-out companies.
- **After each model reworded its own posts** (73% of 13-grams replaced): 98.1.
- **Style-only features:** 88.1, then 87.1 after rewording.
- **Six-way attribution** (human plus five models): 79.3% correct, against 16.7% chance.

## The 10 core features (Table 6; "gap" is the human–AI difference in value share)
| Feature (ID) | Value | Leans | Gap |
|---|---|---|---|
| Conclusion behavior (STR_STG_008) | restated thesis or reframe | AI | 0.650 |
| Where the payoff is first promised (PUR_OUT_003) | title | AI | 0.624 |
| Stage inventory (STR_STG_001) | includes a summary/synthesis stage | AI | 0.609 |
| Route beyond the article (VOC_PRT_005) | absent | AI | 0.592 |
| Legacy-vs-modern framing (STR_FLW_005) | no | human | 0.497 |
| Thesis before first unit (STR_FLW_006) | no | human | 0.419 |
| Stakes escalation (AUD_STK_005) | absent | human | 0.362 |
| Primary voice (VOC_VOX_001) | editorial explainer | AI | 0.308 |
| Length class (PAG_FUR_011) | under 800 words | human | 0.274 |
| Problem placement (AUD_PRB_002) | ordinal (direction not stated; human appears to place it later or leave it implied) | human | 0.222 |

These 10 features alone reach 93.5 F1 and carry 27.6% of the model's attribution. The paper's summary of the pattern: the AI post "promises the payoff already in the title, states its thesis and announces its structure before the first section, speaks in an editorial-explainer voice, and closes with a stage that summarizes or restates the thesis."

## Other top-ranked features (mean |SHAP|, importance only; direction not published)
Second-person address density; heading hierarchy depth; heading density; reader-naming explicitness; effort framing; reader address mode; execution-support resources; temporal reference types; who is expected to act; external voice integration; credibility basis; reader role framing; ownership assignment. Read these as dimensions worth varying deliberately, not as rules.

## Human-specific features (six-way attribution)
Execution-support resources (templates, checklists, calculators, code, downloads); **explicit decision rules**; challenging a false default practice; named-quote and multi-voice construction; disclosed scope for first-party proof; author-identity treatment. Human-only formats include interviews, transcripts, Q&As and roundups: each 0.3–4.6% of human posts, and about 0% of AI posts.

## Structural rarity
Human posts sit in rare configurations: mean rarity percentile 0.84 vs 0.44 for AI (d = 1.83). Human posts make up 47.7% of the rarest decile; AI posts, 2.8%. All five models "crowd into the same common structural configurations". Practical reading: a piece built on the most obvious template for its topic is AI-shaped, whoever wrote it.

## Per-model fingerprints
- **Claude:** numbered procedures (ACT_STP_004).
- **GPT:** numeric density, caveats, stated baselines, sourced figures, required artifacts.
- **Gemini:** self-reference frequency, evidence-limitation disclosure.
- **DeepSeek:** operational thresholds, explicit change requested of the reader.
- **Kimi:** proprietary-authority claims, commercial call-to-action intensity.

Mean words per post: gpt 1,541; deepseek 1,447; gemini 1,283; claude 1,279; kimi 1,064; human 1,186.

## Caveats (the author's own, plus ours)
- **Brief lossiness:** human authors wrote with full business context; the models got a 120-word brief. Some of the gap is "what the brief fails to carry". That is why this skill starts with gathering real material.
- **Time confound:** human posts are from 2008–22, mirrors from 2026. A structure-based year predictor was at chance.
- **Scope:** single-pass generation only (not humanized or co-written text). The corpus is B2B, software-heavy and US-heavy. Scoring was done by an LLM, validated against human annotators (κ 0.93–0.95).
- **Conflict of interest:** the author runs Sitefire, a commercial GEO product, and plans a content-scoring product.
- **Validity:** the findings are correlational and cover commercial web content. They are not proof that any single feature "sounds AI" in other genres. Hence the separate general mode.
