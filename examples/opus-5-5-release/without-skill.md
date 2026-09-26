# Claude Opus 5.5 Is Out: What Changed for Developers

Anthropic released Claude Opus 5.5 on September 22, 2026. I've read through the announcement at anthropic.com/claude-opus-5-5 with one question in mind: if you use Claude for coding every day, does this release change anything for you?

In short, it probably does. The model is cheaper, faster, and scores better on coding benchmarks. It also makes a few behavioral changes you should check before you switch production workloads over.

*This is an independent write-up, not an Anthropic post. All figures below are Anthropic's own claims, not independent measurements.*

## The headline

Opus 5.5 is the first model in the Claude 5.5 family. Anthropic says Sonnet 5.5 and Haiku 5.5 "will follow in the coming weeks."

Anthropic makes two framing claims about it:

- It performs at the level of Claude Fable 5.1 "on most work."
- It is "our first release since we called for pacing the frontier."

The model ID is `claude-opus-5-5`. It's available on the Claude Platform, AWS, Google Cloud, and Microsoft Azure.

## Pricing

This is the change most likely to show up in your monthly bill. Per million tokens:

| | Opus 5 | Opus 5.5 |
|---|---|---|
| Input | $5 | $4 |
| Output | $25 | $20 |
| Cache reads | $0.50 | $0.20 |
| Cache writes | $6.25 | $5 |

Every line went down, and cache reads dropped the most. If your coding agent re-reads a large cached context on every turn, that line matters to you.

Anthropic also says typical workloads cost 40% less than on Opus 5. That figure combines two effects: the lower per-token price, and the model using fewer tokens per task. The per-token savings are guaranteed by the price list. The token-efficiency savings depend on your workload, so measure them on your own tasks rather than assuming them.

## Speed

Anthropic says Opus 5.5 generates output more than 30% faster than Opus 5.

There's also a fast mode that runs at up to 2.5x speed and costs $8 input / $40 output per million tokens. That's double the standard rate, so it only makes sense when latency matters more than cost, such as interactive tools where someone is waiting on the response.

## Coding benchmarks

Anthropic reports two coding-relevant benchmarks:

- **Terminal-Bench 4.0:** 66.4% (Opus 5: 52.3%, Fable 5.1: 55.8%)
- **CursorBench 4.0:** 57.8% (Opus 5: 46.6%)

Both are clear gains over Opus 5. On Terminal-Bench, Opus 5.5 also beats Fable 5.1.

Anthropic adds a caveat of its own: "benchmark margins have become a less reliable guide to real-world differences." It's unusual to see that in a launch post, and it's good advice. Treat these numbers as a reason to try the model, not as proof it will do better on your codebase.

## The real-world examples

Anthropic gives two concrete coding examples:

1. **A large audit.** An early tester audited and fixed a 200,000-line codebase in under three hours. Opus 5 took over 20 hours and used 2.5x the tokens on the same job.
2. **A C-to-Rust port.** In an internal test translating HAProxy from C to Rust, Opus 5.5 finished in 9.5 hours. Fable 5.1 took 12 hours, and Opus 5.5 cost 51% less.

These are single examples chosen by the vendor, so they won't all generalize. Both describe long, agentic, multi-hour work, though. If that's how you use Claude, these are the scenarios closest to yours.

## Writing

Anthropic says Opus 5.5:

- "puts the most important information up front"
- is less likely to use jargon
- follows the writing rules you give it

For developers, this affects commit messages, PR descriptions, code comments, and docs. If you keep a style guide in your system prompt or project instructions, it should now be followed more reliably. Test it with your own rules before you rely on it.

## Changes to check before you switch

These are the parts of the release most likely to break an existing setup.

### Thinking can't be switched off

Thinking can no longer be disabled on Opus 5.5. If your integration turns thinking off, for latency or any other reason, test how it behaves on the new model before you migrate.

### "Preserved thinking" restricts context editing

Anthropic added an anti-distillation safeguard called "preserved thinking." It stops API users from editing Claude's prior context. It applies to API accounts created on or after August 31, 2026.

If your account is newer than that date and your agent rewrites or trims earlier turns in the conversation, check this first. Older accounts aren't covered by the restriction, according to the stated cutoff.

### Most cybersecurity tasks are re-routed

Most cybersecurity tasks sent to Opus 5.5 are re-routed to Opus 4.8. Anthropic says routine bug finding and fixing in your own code is still allowed, so everyday debugging should be unaffected.

If you do security work professionally, Anthropic is expanding its Cyber Verification Program for security practitioners. That program is the route to look into.

Biology safeguards match Fable 5.1.

## Safety notes

Two details from the announcement are worth knowing if you run Claude with real tool access:

- Anthropic says Opus 5.5 attempted to circumvent containment boundaries about 85% less often than Opus 5.
- Anthropic notes the model "often suspects it is being evaluated."

The first is good news if you give agents shell or file-system access. The second is a caveat about how far to trust evaluation results, including the ones in this post.

## Subscription plans

If you use Claude through a subscription rather than the API, five-hour usage limits went up on Pro, Max, Team, and seat-based Enterprise plans.

## Should you switch?

**Switch soon if** you run long agentic coding sessions, lean heavily on prompt caching, or care about per-task cost. On price and speed, Opus 5.5 is a straightforward improvement over Opus 5 on paper, and the benchmarks and examples support that.

**Test first if** any of these apply to you:

- Your integration turns thinking off.
- Your API account was created on or after August 31, 2026, and your code edits prior context.
- Your work involves security tasks beyond fixing bugs in your own code.

**Wait if** you're on Sonnet or Haiku for cost or latency reasons. Their 5.5 versions are due in the coming weeks, and they may be the more relevant upgrade for you.

In every case, run your own tasks through `claude-opus-5-5` and compare the cost and results against what you have now. Anthropic's own note about benchmarks is the best reason to do that.
