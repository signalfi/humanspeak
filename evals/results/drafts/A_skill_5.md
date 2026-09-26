# Who is holding the invoices on the 28th?

After a bad close, someone usually proposes one of two fixes. The first is to change the dollar thresholds so fewer invoices need a second signature from the plant GM or the VP of Operations. The second is to redraw who owns which cost centers, so each invoice lands with someone who knows what was bought. Both are reasonable, but they fix different problems. The approval data from your last few closes will tell you which problem you have.

We spend a lot of time inside AP approval queues at manufacturers. Our view is that the last-week stall is mostly a calendar problem. The invoices that arrive late in the month are heavy. Vendors bill at month-end, freight and MRO invoices catch up with receipts, and maintenance contractors send everything at once. [NEED: share of monthly invoice volume Ledgerline customers receive in the final five business days.] Those invoices go to approvers who, that same week, are running physical counts, pushing shipments out to hit a revenue number, or sitting in their own forecast reviews. A plant manager with forty invoices in the queue on the 28th is probably out on the floor with a count sheet.

So what you need to find out is which of those people is the bottleneck, and why the invoice was sent to them in the first place.

## What each change fixes

Threshold changes act on escalation. Say your policy sends anything over $10,000 to a second approver. If most of your late invoices already have a first approval and are waiting on that second signature, the tier is causing the delay. Raising the limit, or exempting PO-backed invoices that match within tolerance, removes a step for a whole class of invoices at once. It's a policy edit you could make this month. The cost is control. Fewer people review mid-sized spend, and you'll have to explain to your auditors why the limit moved. For recurring, contracted spend like utilities, freight on a rate card or a maintenance agreement, that trade is usually easy to defend.

Ownership changes act on the first approval. They help invoices that sit because they went to the wrong person, or to someone who owns so many cost centers that month-end volume buries them. Manufacturers build these up over time. You get a shared maintenance cost center serving two lines, a plant controller who became the default approver for everything nobody claimed, or an ops director who picked up three departments in a reorg and never handed them back. [NEED: example from a Ledgerline customer, with permission, of one approver owning an outsized number of cost centers.] Changing thresholds does nothing for these invoices because they never reach the escalation step. Moving ownership around takes longer. The approvers' managers have to agree, and you have to name backup approvers for close week. But it's the only change that shortens the wait for the first signature.

When the data is ambiguous, we lean toward fixing ownership. A threshold change loosens a control to make up for a routing problem, and the routing problem comes back as volume grows.

## Run this on your last three closes

Take a snapshot of the open approval queue two business days before each of your last three closes. If your system can't produce point-in-time snapshots, export the approval history and rebuild what was pending on those dates. [LINK: Ledgerline approval-aging export.] Then group by approver:

```sql
SELECT approver,
       COUNT(*)                                              AS invoices_waiting,
       SUM(amount)                                           AS dollars_waiting,
       COUNT(DISTINCT cost_center)                           AS cost_centers_touched,
       SUM(CASE WHEN approval_step > 1 THEN 1 ELSE 0 END)    AS waiting_on_second_tier,
       SUM(CASE WHEN times_reassigned > 0 THEN 1 ELSE 0 END) AS rerouted_at_least_once,
       SUM(CASE WHEN match_status <> 'matched' THEN 1 ELSE 0 END) AS match_exceptions,
       AVG(days_in_queue)                                    AS avg_days_waiting
FROM approval_queue_snapshots
WHERE snapshot_date IN (:close_minus_2_m1, :close_minus_2_m2, :close_minus_2_m3)
GROUP BY approver
ORDER BY invoices_waiting DESC;
```

Your column names will be different. What matters is the measures. Read the results against these rules:

- **If three or fewer approvers hold more than half the waiting invoices, and those same people touch many cost centers, restructure ownership.** Start by giving their largest cost centers to the managers who actually spend from them, and name a backup approver for each one during close week.
- **If most waiting invoices are at step two or later, and the first approval came within a day or two of receipt, change the thresholds.** Start with PO-backed invoices that matched, since they're the easiest to route past the second tier.
- **If a large share were rerouted at least once, ownership is unclear.** AP is spending close week working out where to send things, and no threshold will fix that.
- **If the waiting invoices are spread thin, with a few each across many approvers, neither change will help much.** That calls for a firm approval deadline on the close calendar and an automatic nudge on the first day an approval is late.

You can make both changes. We'd still do ownership first, because a threshold change on top of bad routing tends to hide the routing problem for a quarter or two.

## When the approver isn't the problem

Some invoices that look stuck in approval can't be approved yet. In a plant, the usual reason is a missing goods receipt. The material arrived, nobody posted the receipt, and the three-way match fails. The invoice then either sits in exceptions or goes to an approver who won't sign for something the system says never arrived. That's why the query has a match column. If most of the invoices stuck on the 28th are match exceptions, talk to the receiving supervisor about posting receipts on the same shift. You might also add a receipt cutoff to your close calendar, one day before the approval cutoff.

Then check whether those approvals are holding up the close at all. If you accrue received-not-invoiced at month-end, a pending invoice with a posted receipt is already in your numbers. In that case, chasing it on the 28th gets you a cleaner subledger, not a faster close. [NEED: Ledgerline customer data on how many chased invoices were already covered by accruals.] It's worth knowing that before you spend political capital redrawing anyone's cost centers.
