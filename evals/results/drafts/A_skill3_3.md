# The approver column on your open-invoice report

An open-invoice report has a dozen or so columns: vendor, invoice number, amount, due date, GL account, cost center. Somewhere near the right edge is the name of the person each invoice is waiting on. When the printout gets too wide, that's the column that gets hidden. It's also the one that tells you whether your approval problem comes from dollar thresholds or from who owns each cost center.

If you're a controller at a manufacturer with a few hundred people, you've probably heard both fixes offered after a slow close. One camp wants to tighten the dollar thresholds, meaning redraw the bands for who can approve alone and when a second signature kicks in. The other wants to restructure approval ownership, so every cost center has one named person who answers for its invoices. Both are real policy changes. Both take a couple of cycles to settle, and switching halfway through costs you. We think you should read the approver column before you pick either one.

The mechanics of the last week are easy to describe. Many vendors bill at period end, so invoices arrive in a wave. In a plant, the people approving them are usually operational people: plant managers, maintenance leads, purchasing. They have month-end work of their own, like cycle counts and production reporting, and approving invoices interrupts it. None of that is anyone's fault. What turns a busy week into a late close is where the routing sends each invoice. Most stalls fall into one of two patterns.

The first pattern is a **chokepoint**. A dollar line sends a large share of invoices to one senior person, often a VP of operations or the CFO, and that person's queue grows while they travel or sit in reviews. Every invoice in the queue is legitimate. There are just too many of them in one place.

The second pattern is **orphans**. An invoice gets routed to someone who can't really judge it. Think of a maintenance parts order charged to a shared cost center, or a utilities bill split across three production lines, or a cost center whose owner left in the spring and whose routing still points to an inbox that nobody reads closely. These invoices don't sit because the approver is overloaded. They sit because the approver has to ask around first, or quietly hopes someone else will deal with it.

Changing thresholds helps with chokepoints. Changing ownership helps with orphans. If you apply the wrong one, the close stays slow and your approval matrix gets more complicated.

## Reading the export

Run this on whatever your AP system exports on day 24 or 25. The syntax is SQLite, and you can build the same thing as a pivot table in about ten minutes:

```sql
-- Who is holding pending invoices, and how long they've held them
SELECT current_approver,
       approval_level,
       COUNT(*)                                  AS invoices_waiting,
       SUM(amount)                               AS dollars_waiting,
       ROUND(AVG(julianday('now') - julianday(routed_to_approver_at)), 1)
                                                 AS avg_days_held,
       COUNT(DISTINCT cost_center)               AS cost_centers_covered
FROM open_invoices
WHERE status = 'pending_approval'
GROUP BY current_approver, approval_level
ORDER BY invoices_waiting DESC;

-- Where pending invoices fall against your current dollar bands
-- (replace the breakpoints with your own matrix)
SELECT CASE
         WHEN amount <  5000 THEN '1: under 5k'
         WHEN amount < 25000 THEN '2: 5k-25k'
         WHEN amount < 100000 THEN '3: 25k-100k'
         ELSE '4: 100k+'
       END AS band,
       COUNT(*) AS invoices_waiting,
       ROUND(AVG(julianday('now') - julianday(routed_to_approver_at)), 1) AS avg_days_held
FROM open_invoices
WHERE status = 'pending_approval'
GROUP BY band
ORDER BY band;
```

[LINK: downloadable spreadsheet version of both views]

These are the rules we'd apply to the results.

**If more than half the waiting invoices sit with three or fewer people, and those people are at the second or third approval level, you have a chokepoint.** Look at the band query. If the pile sits just above one escalation line, move that line or add a delegate for that band. That kind of threshold change is narrow and easy to explain to your auditors.

**If the waiting invoices are spread across many first-level approvers, and some of those approvers cover five or more cost centers, you have orphans.** Changing thresholds won't help, because these invoices were never going to escalate anyway. Give each cost center one owner who actually spends from it, plus a named backup.

**If `avg_days_held` is high for a small number of cost centers regardless of who holds them, the cost center is the problem.** This usually means a shared or overhead center. Split it, or assign it to the person who places most of its orders, even if that person is more junior than the current approver.

One opinion to add to those rules: we'd push back on lowering thresholds as a reaction to a single surprise invoice or an audit comment. Lowering a line adds signatures to every invoice in that band, and those signatures land hardest in the week when you have the least capacity. If the concern is control, you'll often get more from giving a cost center a named owner who reads the invoice than from adding a second approver who skims it. It isn't free, though. Restructuring ownership means an afternoon with each plant manager working out who really orders what, and that's harder to schedule than editing a matrix.

## When neither is the problem

Sometimes the export shows short queues everywhere and the close still slips. In that case, check when the invoices got routed in the first place.

In a manufacturer running three-way match, an invoice can't go to an approver until there's a goods receipt to match it against. If receiving posts receipts in batches, or the dock is behind at month end, invoices sit in match exception for days. Then they reach approvers late, in a lump, and look like an approval stall. Neither a threshold change nor an ownership change touches that wait. The fix is on the plant floor: a receipt-posting cutoff, or someone on the dock who owns clearing exceptions before the 25th.

Start by adding one column to the first query: the date each pending invoice cleared matching. If a large share cleared on day 22 or later, your approvers have been getting the blame for a receiving problem, and that's where to go next.
