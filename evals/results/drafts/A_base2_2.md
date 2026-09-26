# Why Invoice Approvals Stall in the Last Week of the Month, and the Routing Change That Fixes It

Most controllers know the pattern. Around day 24, the AP aging report starts to swell. By day 27, you're sending the same Slack message to the maintenance manager for the third time. On the last business day, a stack of invoices is still waiting on someone who is on the plant floor, at a supplier audit, or out on PTO. You end up accruing what you could have booked, or you hold the close a day to catch the stragglers.

The usual response is to tighten the rules: lower the dollar thresholds, add a senior approver, send more reminders. That feels like control, but it rarely speeds up the close. To see why, look at what actually causes the stall.

## Why the last week clogs

Month-end approval delays in a manufacturer usually come from four causes, and they compound.

**Invoices arrive in batches.** Many suppliers bill at month-end, and freight, utilities, and contract labor often invoice on fixed cycles. Receiving may hold packing slips until a batch is complete. Much of the month's volume lands in the same ten days the approvers are busiest.

**Approvers aren't at desks.** A plant manager at a 300-person manufacturer spends most of the day on the floor. Approving invoices competes with a line that's down or a customer audit, and it loses. Month-end is also when operations leaders are pushing shipments out the door to hit revenue.

**Invoices bounce because nobody clearly owns them.** This is the cause most finance teams underestimate. An MRO invoice for a bearing gets coded to maintenance, but the requester was a production supervisor. A freight bill covers inbound raw materials and an outbound customer shipment. The first approver isn't sure it's theirs, so they forward it, or worse, they leave it alone. Every handoff adds a day or two, and in the last week you don't have them.

**Escalation stacks at the top.** Threshold-based routing sends every invoice over a set amount to a VP or the CFO. At month-end those are the people in board prep, forecast reviews, and bank calls. The queue that matters most sits with the people who have the least time.

## The two levers, and what each actually changes

When a controller decides to fix routing, the choice usually comes down to two options.

**Option one: tighten dollar thresholds.** This usually means lowering the amount that triggers a senior approval, or adding tiers so a $15,000 invoice needs two signatures instead of one. The appeal is obvious. It's easy to explain to auditors, and it feels like it reduces risk.

The problem is what it does to volume. Lowering a threshold sends *more* invoices to *fewer* senior people, which makes the stacking problem worse. It also leaves the ownership problem untouched. A $4,000 invoice that bounces between three department heads bounces just as much under a new threshold table. Thresholds decide how high an invoice goes. They don't decide whose it is.

**Option two: restructure approval ownership by cost center.** Every cost center gets one named primary approver, and ideally one named backup, who owns every invoice coded there, up to a defined authority limit. The question "who approves this?" is answered by the coding, not by someone's judgment on the day it arrives.

This fixes the bounce problem directly. When coding determines the approver, there's nobody to forward to. It also spreads the load. Instead of a few executives clearing a month-end pile, you have twenty or thirty cost-center owners each clearing a small, predictable queue for spending they already track against budget.

## The recommendation: ownership first, thresholds second

For most mid-sized manufacturers, restructuring by cost center will do more for close speed than tightening thresholds. That doesn't mean dropping thresholds. It means using them as a second gate for the top tail of spend rather than as the main routing logic. In practice, that looks like this:

1. **Assign one primary and one named backup per cost center.** The backup matters as much as the primary. If the maintenance manager is out the last three days of the month, their invoices go straight to the backup, with no escalation email and no waiting.

2. **Give each owner an authority limit that fits their budget.** A plant manager with a seven-figure annual budget shouldn't need a VP's signature on a $12,000 tooling invoice. Set the limit high enough that routine spend closes at the cost-center level.

3. **Apply thresholds only above that limit.** Senior approvers then see the invoices that warrant their attention: capital purchases, unusual contracts, spend beyond budget. They don't see the whole month's volume.

4. **Take PO-backed, matched invoices out of the queue.** If an invoice matches the purchase order and the receiving record within tolerance, the approval already happened when the PO was issued. Requiring a second sign-off at month-end adds delay without adding control.

5. **Set a rule for unmapped invoices.** Some invoices will arrive miscoded or split across cost centers. Make the AP lead responsible for assigning an owner within one business day, so these don't sit in a general queue.

## Diagnose before you decide

You don't have to take this on faith. Your approval logs from the last three closes will tell you which problem you have.

Pull every invoice approved in the final seven days of each month. For each one, look at two things: how many times it was reassigned, and how long it sat with each approver.

If a large share of invoices were reassigned once or more, you have an ownership problem, and restructuring by cost center will pay off quickly. If most invoices went to the right person the first time but sat for days with a VP or the CFO, your thresholds are pulling too much volume upward, and raising cost-center authority limits is the fix. If both patterns show up, and they often do, start with ownership. It shrinks the queue that reaches the top, which eases the second problem too.

## Change the calendar, too

Routing is the biggest lever, but a few calendar changes help it work. Set an invoice approval cutoff two or three business days before period end, and accrue anything that misses it rather than chasing it. Run a mid-month sweep of anything aging past ten days, so the last week isn't carrying the first three weeks' backlog. And publish the cost-center owner list where operations leaders can see it, so a supervisor knows where an invoice will go before it arrives.

## Where Ledgerline fits

Ledgerline routes invoices by cost center automatically, applies backup approvers when the primary is unavailable, clears PO-matched invoices without manual sign-off, and escalates by threshold only above each owner's authority limit. Approvers can act from a phone on the plant floor. And the approval-time and reassignment reports described above are built in, so you can see which problem you have before your next close starts.

The last week of the month will always be busy. It doesn't have to be the week you spend chasing signatures.
