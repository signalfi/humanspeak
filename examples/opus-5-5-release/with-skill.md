# Opus 5.5 and the August 31 cutoff

Near the bottom of Anthropic's Opus 5.5 announcement (anthropic.com/claude-opus-5-5, September 22) there's a date. For my setup it matters more than any benchmark in the post. A new "preserved thinking" safeguard, which Anthropic calls anti-distillation, stops API users from editing Claude's prior context. It only applies to API accounts created on or after August 31, 2026.

If your account is older than that, none of this affects you. If you opened a new account for a project this month, check your agent loop before you point it at `claude-opus-5-5`. That matters most if the loop trims earlier turns or patches a bad tool call before retrying. The announcement doesn't say exactly which edits count, so I'd test it instead of guessing.

The same section says thinking can no longer be switched off. If you turned it off for quick, cheap calls, you can't do that anymore.

I don't work for Anthropic. Every number here comes from their announcement, and I haven't measured any of them myself.

## The price list

Per million tokens, Opus 5 → Opus 5.5:

| | Opus 5 | Opus 5.5 |
|---|---|---|
| Input | $5 | $4 |
| Output | $25 | $20 |
| Cache reads | $0.50 | $0.20 |
| Cache writes | $6.25 | $5 |

Input, output and cache writes each drop 20%. Cache reads drop 60%, and that's the row I'd look at first. A long agent session sends the same repo context back every turn, so cache reads can make up a large part of the bill.

Anthropic's headline figure is that typical workloads cost 40% less than on Opus 5. The price list explains part of that. The rest depends on Opus 5.5 using fewer tokens per task. That's a claim about how the model behaves, and your tasks may not look like their typical ones. Output is also more than 30% faster.

Fast mode goes up to 2.5x speed at $8 input and $40 output. That's twice the normal Opus 5.5 rate, and more than Opus 5 cost at normal speed. I'd only use it when I'm sitting there waiting on the answer.

## Benchmarks, with Anthropic's own caveat

Terminal-Bench 4.0: 66.4%, against 52.3% for Opus 5 and 55.8% for Fable 5.1. CursorBench 4.0: 57.8%, against 46.6%. Those are big jumps. In the same announcement, though, Anthropic writes that "benchmark margins have become a less reliable guide to real-world differences." I agree with them, and I'm giving these numbers less weight than they'd usually get.

The two worked examples say more to me. In the first, an early tester audited and fixed a 200,000-line codebase in under three hours. Opus 5 took over 20 hours and 2.5x the tokens. In the second, an internal port of HAProxy from C to Rust took 9.5 hours, against 12 for Fable 5.1, at 51% lower cost. Anthropic chose both examples: one outside tester and one internal test. They do back up the fewer-tokens claim, though, and that's the claim the 40% figure depends on. [NEED: author's own Opus 5 vs Opus 5.5 cost and wall time on one real task, same prompt]

Anthropic says Opus 5.5 works at the level of Fable 5.1 "on most work." It also calls it "our first release since we called for pacing the frontier." My reading is Fable-level work at a lower price. I wouldn't expect it to go beyond Fable.

On writing, Anthropic says the model puts the most important information first, uses less jargon, and follows the writing rules you give it. I'd test the last claim. If your current model ignores your commit-message or PR style file, give Opus 5.5 the same file and compare.

On safety, Anthropic reports it tried to get around containment boundaries about 85% less often than Opus 5. It also says the model "often suspects it is being evaluated." I'd like to know whether the second fact affects the first. The announcement doesn't say.

## Should you switch?

- **You're on Opus 5 through the API, your account predates August 31, and you don't do security work:** switch. Change the model string, then watch a week of spend.
- **Your account was created on or after August 31 and your harness edits earlier turns:** run the harness against the new model before you move anything real.
- **You use Sonnet or Haiku for cost reasons:** Anthropic says Sonnet 5.5 and Haiku 5.5 "will follow in the coming weeks." I'd wait for those and compare them before moving up to Opus.
- **You use Claude through Pro, Max, Team or seat-based Enterprise:** Anthropic raised the five-hour usage limits. You don't need to do anything.
- **You go through AWS, Google Cloud or Azure:** it's available on all three.

My pre-switch checklist:

```
Opus 5.5 switch check
[ ] API account created before 2026-08-31? If not, preserved thinking applies.
[ ] Does the harness edit, trim or summarize earlier turns? Test with the new-account key.
[ ] Any code path that disables thinking? Remove it; the option is gone.
[ ] Security work beyond fixing bugs in your own code? Expect routing to Opus 4.8.
[ ] Baseline one real task on Opus 5 (cost + wall time) before changing anything.
[ ] Model string: claude-opus-5-5
```

The one group none of those rules fits is security practitioners. Most cybersecurity tasks now get routed to Opus 4.8. Finding and fixing routine bugs in your own code is still allowed. For anything beyond that, Anthropic is expanding its Cyber Verification Program. The announcement says the program is growing but not what verification lets you do, so ask before you plan work around it.
