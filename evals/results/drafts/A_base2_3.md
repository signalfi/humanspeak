# Why Invoice Approvals Stall in the Last Week of the Month (and How to Fix the Routing)

It's the 26th. You have a spreadsheet of unapproved invoices, a close calendar that says accruals are due in three days, and a plant manager who hasn't opened his approval queue since the 12th. You send the third reminder. You walk over to the maintenance office. You find out the invoice he's sitting on belongs to a different line, and he's been waiting for someone to tell him whose it is.

If you're a controller at a mid-sized manufacturer, this week probably looks familiar. You've likely considered two fixes: tightening the dollar thresholds that decide who has to approve what, or restructuring approval ownership around cost centers. Both can help. They solve different problems, and picking the wrong one can make next month's close worse.

## Why the last week is where approvals pile up

Month-end stalls aren't only about approvers being slow. Several pressures converge at once.

**Invoice volume spikes.** Many vendors bill at month-end, and freight, utilities, and contract services often arrive in a batch. Your approvers get more in five days than they saw in the previous three weeks.

**Your approvers have their own close.** Plant managers are running cycle counts, pushing production to hit shipment targets, and reconciling scrap. Maintenance leads are closing work orders. Approving a $4,000 invoice for hydraulic fittings ranks low on their list that week.

**Exceptions surface late.** Receiving documents lag, so price variances and quantity mismatches on PO-backed invoices appear just as everyone is busiest. An exception usually needs a human to decide, and that human is usually the one who's hardest to reach.

**Routing breaks on ambiguity.** When an invoice goes to someone who doesn't recognize the spend, it doesn't get rejected. It sits. Nobody wants to approve something they can't vouch for, and few people bother to forward it.

**Coverage gaps.** Someone is on vacation, out sick, or traveling to a supplier. If your workflow has no named backup, their queue freezes.

## Diagnose before you redesign

Before changing anything, pull your aging data for the last two or three closes. For every invoice approved after the 20th, look at three things: which step it waited at, who it waited on, and whether it was reassigned or sent back.

You'll usually see one of two patterns.

**Pattern one: the queue is concentrated at the top.** A handful of senior approvers, often the VP of operations, the CFO, or a general manager, hold most of the late invoices. Many of those invoices are routine and within budget. They reached a senior approver only because a dollar threshold required it. That is a threshold problem.

**Pattern two: the queue is scattered and bouncy.** Late invoices are spread across many approvers, get reassigned often, and carry notes like "not mine" or "who ordered this?" That is an ownership problem.

In our experience, most manufacturers in the 200 to 500 employee range show more of pattern two than they expect. Your data may say otherwise, so check.

## Option one: adjust the dollar thresholds

Threshold changes are attractive because they're quick. You edit a matrix, get sign-off, and the change takes effect next month.

Be clear about which direction you're moving. After an audit finding, many finance teams *tighten* thresholds by lowering the amount that triggers senior review. That adds control, but it also sends more invoices to the busiest people in the building at the worst possible time. If your stall is already at the top, lowering thresholds will lengthen it.

Raising thresholds, or removing a middle approval tier for spend that's already covered by an approved PO, can clear a top-heavy queue fast. The tradeoffs:

- It does nothing for invoices routed to the wrong person. A misrouted $800 invoice stalls just as long as a misrouted $80,000 one.
- It needs your auditors and CFO on board, and the compensating controls need to be real: three-way match, budget checks, and periodic review of what flowed through without senior sign-off.
- It treats dollar amount as a proxy for risk. For a manufacturer, a small non-PO invoice from a new vendor can be riskier than a large, fully matched raw materials invoice.

## Option two: restructure ownership by cost center

Restructuring by cost center means every cost center gets a named owner and a named backup. Invoices route by where the spend is coded, not by who requested it, which buyer placed the PO, or which vendor sent it. The owner approves anything in their cost center up to their authority limit, and the backup takes over automatically when the owner is out.

This directly addresses pattern two. The person who gets the invoice is the person accountable for that budget, so they recognize the spend and have a reason to act on it. "Not mine" stops being a valid response. The backup rule removes the vacation freeze.

The costs are real:

- **Your cost center master data has to be clean.** If half your plant spend is coded to a catch-all overhead center, you'll need to split it first.
- **Coding has to happen at intake.** AP or the PO needs to assign the cost center before routing, which may change how your receiving and purchasing teams work.
- **Some managers will resist ownership.** A few will discover they're accountable for spend they've never looked at. That is uncomfortable, and it is also the point.

Expect a one-time project of several weeks, not a matrix edit.

## Which one to choose

If your aging data shows pattern two, restructure by cost center first. Ownership fixes misrouting, bouncing, and coverage gaps, which are the problems that make the last week painful. Once owners are in place, treat thresholds as a tuning layer: set each owner's authority limit and the escalation point above it.

If your data clearly shows pattern one, with routine, matched, in-budget invoices stuck with two or three senior people, a threshold change will give you faster relief. Just don't expect it to fix the scattered stalls too.

Most teams end up doing both, in that order.

## Changes worth making regardless

Whichever path you take, a few routing rules pay off every month:

- **Auto-approve clean three-way matches** within tolerance, so humans only see exceptions.
- **Give AP ownership of the exception queue**, so variance and receiving issues get worked before they reach an approver.
- **Run an approval sweep around the 20th.** Clear everything aged more than five days before the month-end surge arrives.
- **Publish an approval cutoff** on the close calendar, and make escalation to the backup automatic after the cutoff passes.
- **Review aging after every close.** Routing rules drift as people change roles.

## Where Ledgerline fits

Ledgerline routes invoices by cost center or dollar threshold, or both, with named backups, automatic delegation, and aging reports that show where each invoice waited. You can run the diagnosis above from your own data before changing a single rule.

The goal isn't to chase approvers more efficiently. It's to build routing where the right person sees the invoice early enough that you don't have to chase anyone at all.
