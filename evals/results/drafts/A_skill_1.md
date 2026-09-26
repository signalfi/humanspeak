# Lower the threshold, or give the cost center a new owner?

Three business days before your close date, pull every invoice that's still waiting for approval and sort the list by approver. Most AP reports default to vendor order, because AP thinks about the work vendor by vendor. Sorted by approver, the same list usually shows which of the two fixes you've been weighing will actually shorten your close.

We talk through approval queues with a lot of controllers at manufacturers in the 200 to 500 person range, and the conversation keeps coming to the same fork. One side wants to adjust the dollar thresholds in the delegation-of-authority matrix so fewer invoices climb to the plant manager or the VP of operations. The other side wants to redraw who owns which cost centers, so each invoice lands with someone who knows what it's for and is at a desk to approve it. Both are reasonable, but they fix different problems.

It helps to be clear about why the last week is worse than the other three. Freight carriers, utilities, temp labor agencies and MRO distributors all bill on or near month end, so invoice volume spikes just as the people who own the biggest cost centers are on the floor pushing shipments out to make the month's revenue. An approver who clears their queue in two days in the middle of the month is a two-day delay on the close in the last week. Nobody is being careless. The spike in invoices lands when approvers have the least time.

## What each fix is good for

Threshold changes help when the queue is full of small, routine invoices going to senior people. A second-approval limit set when the company was half its current size can send every restock of shrink wrap and every freight bill to the plant manager. You can raise that limit, or let PO-backed invoices that match the receipt within tolerance post without a human approval at all. Either way, invoices leave the queue entirely instead of moving to someone else's. The cost is on the controls side. Your auditors, and possibly your lender, care about the delegation-of-authority matrix, so any change needs sign-off and a written rationale, and that takes a few weeks.

Tightening thresholds in the other direction, so that more invoices get a senior signature, is sometimes the right call after a bad invoice gets through. Make that case if you need to, but budget for it as extra days on the close, because it adds approvals in exactly the week you can least afford them.

Ownership changes help when the queue is concentrated. The patterns we see most are a maintenance manager who owns the maintenance cost centers for every line, a shared "Plant Overhead" or "Facilities" cost center with one owner approving everything, and cost centers whose owner left and which quietly fell back to the CFO as the default approver. Moving ownership down to line supervisors, or splitting a shared cost center by line, spreads the load. The cost is more approvers to train, more people who can approve the wrong thing, and a mapping that decays every time someone changes roles unless one person is responsible for maintaining it.

## Decision rules

Run these against the sorted list:

- **If three or fewer approvers hold more than half the pending invoices by count, restructure ownership first.** Changing thresholds won't help, because the same people still own the cost centers.
- **If more than half the pending invoices are PO-backed, matched to a receipt and under your current second-approval limit, change the thresholds** or add an auto-approval rule for matched invoices. Those invoices are waiting on a signature that adds very little control.
- **If both conditions are true, do ownership first.** A cost center remap is a configuration change you can reverse next month. A threshold change alters your control posture and needs sign-off, so start that paperwork in parallel.
- **If dollars are concentrated but the count isn't,** you probably have a few large invoices, often capex or a tooling vendor, stuck with one executive. Handle those by name. Neither structural fix is aimed at them.
- **If any invoice is routed to someone who no longer holds the role,** fix that mapping this week, whatever else you decide.
- **If the pending invoices are spread thinly across many approvers and are mostly non-PO,** the routing is probably fine and the issue is habit. People approve in batches, often on Fridays. A hard approval cutoff at close minus five business days, with a daily digest to each approver, will do more than any change to the matrix.

Here's the pull we suggest, in a form you can hand to whoever runs your AP reports:

```
Pending-approval pull — run at close minus 3 business days

Columns:
  invoice_number
  vendor
  amount
  po_number              (blank if non-PO)
  receipt_matched        (Y/N)
  cost_center
  current_approver
  days_with_current_approver
  approver_current_role  (from HR, not from the ERP approver table)
  cost_center_owner_role (from the delegation-of-authority matrix)

Pivot A: count and total amount by current_approver, sorted descending
Pivot B: count where po_number is not blank AND receipt_matched = Y
         AND amount < second-approval limit
Pivot C: rows where approver_current_role ≠ cost_center_owner_role
Pivot D: count where receipt_matched = N, by cost_center
```

[LINK: spreadsheet version of this pull with the pivots pre-built]

Pull the approver role from HR data instead of the ERP. The ERP approver table is exactly the thing that goes stale, so checking it against itself will always look fine.

## When it's neither

Look at Pivot D before you act on any of the rules above. At a lot of manufacturers, a big share of what AP calls "pending approval" is really pending receipt. The invoice is matched to a PO, but nobody at the dock has posted the goods receipt, so the invoice sits in a match exception that shows up in an approver's queue. The approver can't clear it, and changing thresholds or cost center owners won't either. If more than about a quarter of your pending list is unmatched, your first conversation this month is with the receiving lead about posting receipts the same day. Approval routing can wait until after that.
