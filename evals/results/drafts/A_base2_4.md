# Why Invoice Approvals Stall in the Last Week of the Month (and the Routing Change That Fixes It)

If you run the close at a mid-sized manufacturer, you know how the last week goes. The AP queue is full. A plant manager is doing cycle counts and hasn't opened email since Tuesday. Two invoices for a freight carrier have been forwarded three times because nobody is sure whose budget they belong to. Your job has turned into asking people to click "approve," and each of those requests costs you a day on the close calendar.

The usual response is to adjust dollar thresholds: raise the floor so fewer invoices need sign-off, or add tiers so large ones go higher. Sometimes that helps. More often, the stall comes from something thresholds don't touch, which is **who owns the spend**. Before you rewrite your approval matrix, figure out which problem you have.

## Why the last week is where things break

Month-end congestion has a few predictable causes, and they compound.

**Invoices arrive late in the cycle.** Many suppliers bill at or near month-end, and receiving often lags. A PO invoice can't match until the goods receipt is posted, so invoices that arrived mid-month sit in exception status and reach approvers during close week.

**Your approvers are busiest then too.** Operations leaders in manufacturing have their own month-end work: inventory counts, shipping pushes to hit revenue, production reports. Approving an MRO invoice ranks low when a line is down.

**Some spend has no obvious owner.** Maintenance contracts, utilities, freight, temp labor, and plant-wide supplies often touch several cost centers. When routing can't determine a single owner, the invoice goes to a default approver, gets forwarded, and waits in each inbox along the way.

**Routing is based on seniority, not knowledge.** Threshold-based rules send a $40,000 invoice to a VP because of its size, even when the maintenance supervisor is the only one who knows whether the work was done. The VP either asks the supervisor, which adds a step, or delays because they can't approve with confidence.

**No one covers for absent approvers.** One person on vacation can hold up a whole cost center's invoices if the system doesn't reroute after a set time.

## Option one: tighten dollar thresholds

Changing thresholds means deciding at which dollar amounts an invoice needs approval and at which levels it escalates. In practice, "tightening" usually means two moves: letting more low-value invoices through without human approval, and narrowing the band where senior approval is required.

**When this works:** Your stuck invoices are mostly with a few senior approvers, and most are routine and well-documented. If your CFO has forty invoices in queue and approves nearly all of them unchanged, those approvals aren't adding control. They're adding delay. Raising the threshold, or auto-approving PO-backed invoices that clear a three-way match within tolerance, takes volume away from the bottleneck.

**Where it falls short:** Thresholds lower volume but still decide routing by amount. The freight invoice with no clear owner is still stuck, now at a different level. Loosen thresholds too far without other controls and your auditors will ask questions you'd rather not answer.

## Option two: restructure approval ownership by cost center

Here, each cost center gets a named primary approver and a backup, and invoices route to whoever is responsible for that spend. Dollar thresholds still apply, but as an added requirement above a certain amount, not as the main routing rule.

**When this works:** Your stuck invoices are scattered across many people, have been forwarded, or sit with approvers who reply "not mine" or "check with..." Those are ownership issues. When the right person gets the invoice first, it moves in a single step.

**Where it takes effort:** You must maintain the cost center map. When people change roles, a plant reorganizes, or a new line starts, ownership needs updating. You also need a rule for shared spend, which is where most of the design work lies.

## How to tell which problem you have

Before changing anything, pull every invoice that was still unapproved five business days before your last three closes. For each, note:

1. Who held it when it stalled.
2. Its amount.
3. How many times it was reassigned or forwarded.
4. Whether it was eventually approved without changes.

Then look for patterns. If most stalled invoices are large, sit with two or three senior people, and were approved without changes, you have a threshold problem. If they're spread among many approvers, were forwarded more than once, or involve shared cost centers, you have an ownership problem.

At most 200–500 person manufacturers, the data shows ownership. Mid-sized plants often have lean management layers with several roles combined, and spend classifications were set up years ago when the org chart looked different.

## What to change if ownership is the issue

**Assign a primary and backup owner to every cost center.** Name people, not just roles. If an invoice sits for 48 hours during close week, it should automatically move to the backup.

**Set a rule for shared spend.** Pick one of two approaches and stick with it. Either the cost center taking the largest share approves the whole invoice and allocation happens afterward, or the invoice is split before routing and each owner approves their portion. The first is quicker; the second gives cleaner accountability. Either is better than routing to a general inbox.

**Take matched PO invoices out of the queue.** If an invoice matches the PO and receipt within your tolerance, approval already happened when the PO was issued. Requiring a second approval mostly adds to close-week congestion.

**Keep thresholds, but make them secondary.** Invoices over a set amount can require an additional senior approver after the cost center owner signs off. The owner confirms the spend is valid; the senior approver confirms it's acceptable at that level. Each person then has a clear, focused reason to act.

**Set an approval cutoff and accrue the remainder.** Publish a date, such as business day minus three, after which unapproved invoices get accrued rather than pursued. That keeps your close on schedule and pushes approvers to act earlier next month.

## Where to start this month

Run the five-day lookback before your next close. It takes an afternoon and will show you whether to adjust thresholds, restructure ownership, or both. If ownership is the problem, begin with the cost centers that caused the most stalled invoices. Clearing a handful of them usually removes most of the delay.

Ledgerline supports cost-center routing, backup escalation, and match-based auto-approval, but the analysis above applies no matter which system you use. Settle ownership first, then configure routing to reflect it.
