# Month-end approval backlogs usually belong to a few names

Before you change a single threshold, pull the list of invoices still waiting on approval three business days before close. Sort it by the person each one is sitting with, not by vendor or amount.

Which fix will help depends on what that list shows. We build approval routing for mid-sized manufacturers. When a controller asks us whether to tighten dollar thresholds or restructure approval ownership by cost center, we ask for that sorted list first. The two changes solve different problems, and picking the wrong one costs you a quarter of policy work without moving your close date. [NEED: Ledgerline figure for the share of month-end pending invoices held by the top three approvers, across customers with 200–500 employees.]

Invoices don't arrive evenly across the month. Freight, contract labor, utilities and MRO vendors all bill at month-end, and the statements land in the same week your approvers are busiest. Those approvers are plant managers and maintenance leads with their own month-end: physical counts and a push to ship before the period closes. To them, your approval request is one email among fifty. The invoices that stall are the ones that make the approver stop and think: is this mine, and did the work actually happen?

Tiered thresholds add a second kind of stall. A $12,000 invoice that goes to the cost center owner, then the plant controller, then the VP of operations sits in three queues, and the wait starts over at each hop. Anything that crosses a tier in the last week will probably miss the close.

## What each change is good for

Tightening thresholds deals with the hops. If your bands were set years ago (say $5k for a department head, $25k for the plant GM, $50k for the CFO), bigger order sizes and higher prices have likely pushed routine invoices into upper bands nobody meant them for. You can redraw the bands so fewer invoices escalate, or let PO-backed invoices that pass a three-way match within tolerance skip approval entirely. Either way, invoices take fewer hops. It's also cheap: a policy memo, a note to the audit committee and a configuration change.

What thresholds won't fix is an invoice sitting with the wrong person. Say a maintenance contract is coded to cost center 4410 and the owner of 4410 left in March, or the approver never sees the work being done. Moving the dollar line just means the invoice waits in one queue instead of two.

Be straight with yourself about control, too. Your auditors will ask what replaced the approval you removed. For PO-matched spend, the approved PO is the control, and we think that argument holds up. For non-PO spend like services, one-off repairs and utilities, it's much weaker, and we wouldn't raise thresholds there without a post-payment review.

Restructuring ownership by cost center deals with the "is this mine?" stall. Every cost center gets one named owner and one named backup. The owner should be someone who would know whether the work happened, and routing follows GL coding, not an org chart last updated two reorgs ago. Shared cost centers, like a maintenance pool across three lines or plant-wide utilities, still get a single owner, even if you allocate the cost later.

It's more work. You'll clean up cost center master data, get plant leadership to accept specific names and set delegation rules for vacations and month-end coverage. Expect it to take a quarter to settle, and expect the first close after the change to be messier than usual.

## Deciding from the list

Go back to the sorted list.

**If three or fewer approvers hold more than half the stalled invoices, restructure ownership, and start with those people.** Either they own too many cost centers, or they've become the default route for coding nobody else claims. Splitting their cost centers or giving them real backups will clear more invoices than any threshold change.

**If the stalled invoices are spread across many approvers and most are waiting on a second or third hop, change the thresholds.** Count how many invoices on the list crossed a tier. If it's most of them, your bands are the problem.

**If they're spread thin and mostly on their first hop, neither change will do much.** Approvers are slow across the board, and the fix is timing. Set a mid-month cutoff for vendor statements. Set a hard approval deadline three business days before close, with automatic escalation to the backup. Send approvers a daily digest instead of one email per invoice.

**If you see both patterns, a few overloaded owners and lots of multi-hop invoices, fix ownership first.** New thresholds on top of bad routing only move the pile somewhere else.

If your AP system can export pending approvals with their routing history, this gets you the numbers. Rename the columns to match your export:

```sql
SELECT
  current_approver,
  COUNT(*)                                        AS pending_invoices,
  SUM(amount)                                     AS pending_amount,
  AVG(approval_hops_so_far)                       AS avg_hops,
  SUM(CASE WHEN po_number IS NULL THEN 1 ELSE 0 END) AS non_po_invoices
FROM pending_approvals
WHERE snapshot_date = :close_minus_3_business_days
GROUP BY current_approver
ORDER BY pending_invoices DESC;
```

Run it for your last three closes, not just the most recent one. One bad month can come down to a single approver's vacation. [LINK: Ledgerline pending-approvals diagnostic spreadsheet]

## When the list misleads you

One case catches controllers out. On PO-backed invoices, "pending approval" sometimes really means "pending receipt." The invoice is waiting on a goods receipt the warehouse hasn't posted, and nobody can approve something the system says hasn't arrived. Those invoices pile up under whichever buyer or receiving lead owns the match exceptions. That looks exactly like an ownership problem, and it isn't one. Before you reassign any cost center, filter the list for invoices with an open receipt exception. If that's where the pile is, the conversation you need is with receiving, about posting receipts before the last week of the month, and your approval routing can stay as it is.
