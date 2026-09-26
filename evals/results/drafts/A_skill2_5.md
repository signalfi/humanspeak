# Who owns the gearbox invoice?

Take a $6,800 invoice for a rebuilt gearbox on line 3, received on the 24th. The approval workflow sends it to the maintenance supervisor. He forwards it to the plant manager because the repair was coded to the production cost center. The plant manager sends it back, since maintenance has its own budget. Then it lands in the controller's queue, because the controller is the fallback approver for anything unresolved. It sits there until someone walks it down the hall on the 2nd. Nobody on that trail was careless. Each of them was correct that the invoice wasn't quite theirs.

At Ledgerline we think this invoice is what a finance team should design its routing around. It's more useful to plan for it than for the average invoice or the biggest one. The average $900 PO-matched invoice for resin or fasteners already clears on its own. The $80,000 capital purchase gets attention because everyone knows it's coming. The invoices that hold up the close are the ones whose owner is ambiguous, and the last week of the month creates more of them just when there's the least slack to sort them out.

That happens for a couple of reasons. Many vendors bill at period end, so volume spikes as approvers get busy. At a manufacturer, those approvers have their own month-end work: plant managers are pushing shipments out the door, supervisors are doing cycle counts, and purchasing is reconciling receipts. An approval request that needs a judgment call ("is this mine?") gets set aside for later, and at month end later means after the close. Clear invoices still move. Ambiguous ones wait.

A controller usually has two levers here. The first is the dollar thresholds that decide how senior an approver has to be. The second is who owns an invoice to begin with, organized by cost center.

## What each lever actually changes

Thresholds control how many invoices reach senior people. Tightening them sends more invoices up the chain, which is sometimes the right call. If an audit finding, a fraud incident, or a new lender covenant requires a plant manager to sign anything over $5,000, then that's the requirement and you plan the close around it. As a speed measure, though, tightening makes month end worse, because it adds work to the busiest queues during the busiest week. Loosening the floor helps more often. If a PO-matched invoice under $2,500 with a clean three-way match gets approved almost every time without comment, the approval step isn't catching anything, and you can move that step off the calendar.

Ownership decides whose queue an invoice goes to first, and whether that person accepts it. Restructuring by cost center means every cost center has one named owner and one named delegate. Shared or disputed codes, like maintenance on production equipment, freight, utilities, and plant-wide services, get an explicit ruling ahead of time about who approves. Threshold changes don't help the gearbox invoice at all, because it bounced between owners and the dollar amount had nothing to do with it.

In our opinion, most controllers reach for thresholds first because a threshold is a single number in a settings screen, while ownership means a conversation with three department heads. That's understandable. It's often the wrong lever, though, and your own data will show whether it is.

## Pull this before you decide

Export the approval history for the last two or three closes and look only at invoices received in the final seven days of each period. Most AP systems can produce a step-level log with the invoice, approver, cost center, amount, and when each step was assigned and completed. The query below assumes a table shaped like that, so rename the columns to match your export.

```sql
-- Late-period approval steps: who holds the time, and how often invoices bounce
WITH late AS (
  SELECT s.*
  FROM approval_steps s
  JOIN invoices i ON i.invoice_id = s.invoice_id
  WHERE i.received_date >= i.period_end_date - INTERVAL '7 days'
)
SELECT
  approver,
  COUNT(DISTINCT invoice_id)                                   AS invoices,
  ROUND(SUM(EXTRACT(EPOCH FROM (completed_at - assigned_at)))/3600, 1)
                                                               AS queue_hours,
  ROUND(100.0 * SUM(EXTRACT(EPOCH FROM (completed_at - assigned_at)))
        / SUM(SUM(EXTRACT(EPOCH FROM (completed_at - assigned_at)))) OVER (), 1)
                                                               AS pct_of_all_hours,
  SUM(CASE WHEN action = 'reassigned' THEN 1 ELSE 0 END)       AS reassignments,
  SUM(CASE WHEN action = 'approved' AND comment IS NULL
            AND amount < 2500 THEN 1 ELSE 0 END)               AS silent_small_approvals
FROM late
GROUP BY approver
ORDER BY queue_hours DESC;
```

[LINK: Ledgerline's spreadsheet version of this diagnostic, for teams without SQL access to their AP data]

Here's how we'd read the output:

- **If three or fewer approvers hold more than half the late-period queue hours, and their reassignment counts are high,** restructure ownership. Those people are either the default destination for invoices nobody claims, or they own cost centers too broad for one person to handle at month end. Break up the cost centers or assign delegates before you touch any dollar amount.
- **If queue hours are spread across many approvers, reassignments are rare, and a large share of their approvals are silent small ones,** adjust thresholds. Raise the floor for PO-matched invoices so those approvals don't have to happen during close week.
- **If the controller or AP manager appears near the top of the list,** your fallback rule is doing the ownership work, and it's doing it badly. That means ownership needs fixing, whatever the other rows show.
- **If both patterns appear,** fix ownership first. Once invoices stop bouncing, run the query again, because the threshold question often looks different afterward.

The $2,500 line in the query is a placeholder. Set it at whatever amount your team would be comfortable auto-approving on a clean match, and check that with your auditors before changing policy. [NEED: Ledgerline customer data on typical late-period queue concentration or before/after close times, if available, to show readers what a normal result looks like]

## When neither lever helps

Sometimes the query shows long waits spread evenly, few reassignments, and approvers who act within a day once they finally see the invoice. When that happens, the delay usually comes before approval even starts. The invoice is waiting on a goods receipt that nobody at the dock entered, or on a PO that purchasing hasn't closed out. Routing can't approve an invoice that can't match. In that case, check how many late-period invoices sat in a match exception before their first approval step was assigned. If that number is large, the conversation you need is with receiving, not with your approvers.
