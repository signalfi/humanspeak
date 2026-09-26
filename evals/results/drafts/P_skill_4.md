# Your approvers are closing the month too

At a 300-person manufacturer, the person who approves an invoice for a spindle repair is usually the maintenance manager. In the last week of the month, that same person is signing off on a cycle count, chasing a shipment a customer wants booked before quarter-end, and answering the plant manager's questions about overtime. The invoice isn't hard to approve, but it's fourth in line behind three things that are.

At Ledgerline we spend a lot of time inside mid-sized manufacturers' approval queues. Our view is that the month-end stall usually gets blamed on the wrong thing. Controllers tend to blame volume: more invoices arrive late in the month, so the queue backs up. Volume does rise. [NEED: statistic on the share of monthly invoice volume that arrives in the final five business days, from Ledgerline customer data or a cited benchmark such as APQC or IOFM.] But the invoices that miss close are rarely stuck with AP. They're with operations people whose own month-end falls in the same week as yours, and your routing sends them work at the moment they have the least time for it.

[NEED: quote from a controller or CFO at a mid-sized manufacturer describing close-week approval chasing, with name, title, company and permission to publish.]

That's also why reminder emails do so little. A third automated nudge to a maintenance manager in the middle of a cycle count just adds a fifth thing to his list. If your fix for late approvals is louder reminders, you're working on the wrong part of the system.

## Find out who is holding the late invoices

Before you change any routing, look at your own data. Pull every invoice that was still unapproved at the close of business on the last day of each of the past three months. Most ERPs and AP tools can export this. If yours can't, AP can rebuild it from the aging report in an afternoon.

```
MONTH-END STALL AUDIT
One row per invoice still unapproved at close, last 3 months

invoice_id
vendor
amount
po_type            (PO / non-PO)
match_status       (matched / price variance / qty variance / no receipt / n/a)
current_approver
approver_role      (plant mgr, maintenance, purchasing, dept head, etc.)
approval_step      (e.g. 1 of 2, 2 of 2)
date_received_ap
date_entered_current_step
days_at_current_step

Pivot A: count and $ by current_approver, sorted descending
Pivot B: count by match_status
Pivot C: count by approval_step
Pivot D: count by po_type, split at your current approval threshold
```

[LINK: Ledgerline month-end stall audit, spreadsheet version with the pivots pre-built]

Three months is enough to tell a pattern from one bad month. Once the pivots are built, the right change is usually obvious, and it's usually not the one you'd have guessed.

## What to change, based on what you find

**If more than half of the late invoices sit with three or fewer approvers**, you have an ownership problem. Give each of those people a named delegate for the last five business days of the month, with a written dollar limit. Turn the delegation on by calendar, not by someone remembering to set an out-of-office. The delegate should be someone who isn't part of month-end, like a purchasing lead or an assistant plant manager. The original approver can still see everything. They just stop being the bottleneck.

**If the late invoices are spread thinly across many approvers and are mostly small**, your thresholds are too low. When every $400 MRO invoice needs a department head, you've built a queue with dozens of doors and a person asleep behind each one. For PO-backed invoices that match within tolerance, the spending was approved when someone cut the PO. A second approval at invoice time mostly confirms a decision that's already been made. Raise the threshold, or skip human approval for matched invoices entirely, and let AP post them. [NEED: statistic on the share of invoices below a given dollar amount, or the processing cost per invoice, from Ledgerline data or a named benchmark study.]

**If Pivot B shows a large share of price or quantity variances**, send those exceptions to purchasing, not to the requester. The requester didn't negotiate the price and usually can't tell you whether a 3% increase is legitimate. Purchasing can, often in thirty seconds. Set a tolerance your purchasing lead will put their name to, and auto-approve anything inside it.

**If Pivot C shows invoices waiting at step two of a sequential chain**, the first approver did their job and the second is where things die. For anything below your capital threshold, run the two approvals in parallel, or drop the second step in close week and review those invoices after the books are closed.

[NEED: quote from a finance leader who changed thresholds or delegation, describing what happened to close timing, ideally with a before-and-after figure.]

Ledgerline handles calendar-based delegation and match-based auto-approval out of the box, but everything above can be set up in most AP systems and in some ERPs' native workflow. What matters is choosing the right change for your pattern. Most teams we talk to have tried all four at once and ended up with a routing matrix nobody can explain.

A caution on thresholds: raising them feels like loosening control, and your auditors may ask about it. A matched, received, PO-backed invoice under a sensible limit carries less risk than a non-PO invoice a busy department head approves without reading on the 30th. Write down that reasoning before you make the change, not after the auditor asks.

## When routing isn't the problem

Sometimes Pivot B's biggest row is "no receipt." In that case, routing changes won't help much. The invoice can't match because the dock never entered the goods receipt, so it lands with someone whose real job is to confirm the parts arrived. Month-end makes this worse, because receiving is also slammed shipping product out the door.

The fix is at the dock: a receipt-entry cutoff that someone on the receiving team owns, and a daily list of open POs with invoices but no receipt, sent to whoever runs receiving. Neither change has anything to do with AP software.

For close itself, remember that the books don't need the invoice approved. If the goods arrived and the PO is open, you can accrue from received-not-invoiced and close on time while the approval catches up the following week. Many controllers already know this and still hold close for approvals out of habit, because an approved invoice feels more final than an accrual. If your audit shows the late invoices are mostly received and matched, try accruing them next month and see how many days you get back.

Start with Pivot B. If "no receipt" is the largest row, walk down to the dock before you touch the approval matrix.
