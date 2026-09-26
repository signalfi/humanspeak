# Who owns cost center 4100?

Pull every invoice that was still waiting on an approver at close of business on the 25th last month. Sort the list by approver, not by vendor or amount. Most controllers never look at it that way, because the last-week chase goes vendor by vendor: the freight bill, the tooling shop, the maintenance contractor who invoices everything on the 28th. Sorted by approver, the list usually takes one of two shapes. Which one you have tells you whether changing dollar thresholds will help at all.

We build the approval routing in Ledgerline, so we spend a lot of time looking at these lists. Our view is that most late-month stalls come from routing invoices to people who don't recognize the spend. Dollar amounts are rarely the cause.

Take a made-up but familiar example: cost center 4100, "Plant 2 – Maintenance & Facilities." On paper the plant manager owns it. In practice, three maintenance leads, the EHS coordinator and a production scheduler all spend against it. The plant manager recognizes maybe a third of what lands in his queue. He holds the rest until he can ask somebody what it was for. The last week of the month is also when he's running cycle counts and pushing shipments out the door, so an invoice he doesn't recognize waits until he has twenty minutes and someone to ask.

Changing the dollar band doesn't solve that. Raise his threshold so he only sees invoices over $10,000, and the small invoices clear. The invoices still in his queue are now the large ones he understands least. Lower it so he signs off on more, which is the usual reaction after a bad close, and you add a stop at the one desk that's already backed up.

## Reading the list

Here are the decision rules we'd use. The cutoffs are our starting points and don't come from a study, so adjust them once you've seen two or three months of your own data.

**If three or fewer approvers hold more than half the stalled invoices, restructure ownership for their cost centers first.** Send each invoice to the person who asked for the spend, so the requester approves first. The cost center owner then only sees invoices above a limit, or ones the requester flags. For a shared cost center like 4100, this can mean splitting it into sub-centers or routing on the PO creator instead of the GL string.

**If no approver holds more than about 10%, and most stalled invoices fall below your lowest approval band, work on thresholds.** That pattern means approval is a formality spread across many people, and each of them lets two or three invoices sit. PO-backed invoices that match within tolerance were already approved when someone raised the requisition. Let those under a set amount skip the invoice approval step. Below a second, higher amount, cut two-level chains down to one approver.

**If the stalled invoices are mostly non-PO, lean toward ownership.** Non-PO spend is where approvers most often don't know what they're looking at. A lower dollar threshold won't make them any more familiar with it.

**If an approver clears invoices in a day mid-month but takes four days in the last week, the fix is the calendar.** Name a delegate for the close window, someone with real authority, and put that in the routing rules. Leaving it to an out-of-office reply doesn't count.

Tighter thresholds, meaning more senior sign-off on more invoices, make sense in one situation: when a single approver is approving large non-PO spend they can't actually judge. That's a control problem. Fix it, but plan on it adding a day or two to the close.

## The re-sort, as a query

This runs against a flat export of approval steps. Rename the columns to match your AP system. If your export has no `requester`, use the PO creator.

```sql
-- Invoices waiting on an approver at the day-25 cutoff, by approver
WITH stalled AS (
  SELECT *
  FROM invoice_approvals
  WHERE assigned_at < DATE '2026-08-25'
    AND (approved_at IS NULL OR approved_at > DATE '2026-08-25')
)
SELECT
  approver,
  COUNT(*)                                             AS stalled_invoices,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1)   AS pct_of_all_stalled,
  SUM(amount)                                          AS stalled_dollars,
  ROUND(100.0 * AVG(CASE WHEN po_number IS NULL
                         THEN 1 ELSE 0 END), 0)        AS pct_non_po,
  ROUND(100.0 * AVG(CASE WHEN requester = approver
                         THEN 1 ELSE 0 END), 0)        AS pct_own_spend,
  COUNT(DISTINCT cost_center)                          AS cost_centers
FROM stalled
GROUP BY approver
ORDER BY stalled_invoices DESC;
```

Two columns matter most. `pct_of_all_stalled`, summed over the top three rows, tells you which rule applies. `pct_own_spend` shows whether approvers are signing off on their own purchases or on other people's. A plant manager at 15% own spend is approving mostly other people's purchases, and he's who you'll be chasing on the 27th.

Run the query again with the cutoff moved to the 10th and compare. An approver who shows up only in the late-month run needs a delegate. An approver who shows up in both runs needs to own less.

## When it's neither

Some invoices in the chase aren't waiting on any approver. They're sitting in an exception queue: a price variance on a steel surcharge, a freight bill with no PO, or, most often at plants, a receipt that hasn't been posted. If the receiving dock logs goods in batches on Friday afternoon, every invoice for Tuesday's deliveries fails three-way match until then. During the chase, AP reports all of these as "waiting on approval." None of the routing changes above will move them.

So before you redraw a single approval rule, count how many of last month's late invoices were actually waiting on a receipt. If it's more than a quarter, your first meeting should be with the receiving supervisor.
