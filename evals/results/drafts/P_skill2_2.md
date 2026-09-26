# The $14,800 bearing invoice

*By [NEED: author name and title], Ledgerline*

Take an invoice for replacement bearings for your second plant. It's for $14,800, coded to the maintenance cost center, and it lands in AP on the 24th. Under a fairly ordinary approval matrix, it goes first to the maintenance supervisor because the cost center is his. It's over $10,000, so next it goes to the plant manager. His limit is $15,000, so the chain ends with him, unless purchasing amended the PO after it was issued. In that case purchasing gets a turn as well.

Somebody wrote each of those rules for a good reason. But the maintenance supervisor spends the last week of the month on the floor, because production is pushing to hit the monthly number. The plant manager is caught up in the same push. So the invoice sits in one inbox, then another, and on the 30th your AP lead is walking it around the building.

We build AP automation for mid-sized manufacturers, so we have an obvious interest in how invoices move. Even so, most of what follows can be done with the ERP you already have. Our view is that close-week stalls are mostly a routing problem. The matrix sends finance work to the busiest people in the building during the week they have the least time for it, and it sends that work to them one after another.

[NEED: statistic on how much monthly invoice volume arrives or waits for approval in the last five business days, e.g. from Ledgerline's anonymized customer data, with sample size and date range]

## Start with the approval log

Leave the matrix alone until you've seen where invoices actually wait. Most ERPs and AP tools can export approval events with an assigned time and an acted time for each step. Pull the last three closes. Table and column names will differ in your system, but the query looks like this (Postgres syntax):

```sql
SELECT
  approver_name,
  COUNT(*) AS steps,
  ROUND(AVG(EXTRACT(EPOCH FROM (COALESCE(acted_at, NOW()) - assigned_at)) / 3600), 1)
    AS avg_hours_waiting,
  SUM(CASE WHEN acted_at IS NULL
            OR acted_at - assigned_at > INTERVAL '48 hours'
      THEN 1 ELSE 0 END) AS steps_over_48h,
  SUM(CASE WHEN po_number IS NULL THEN 1 ELSE 0 END) AS non_po_steps
FROM invoice_approval_steps
WHERE assigned_at >= CURRENT_DATE - INTERVAL '90 days'
  AND EXTRACT(DAY FROM assigned_at) >= 22   -- rough stand-in for close week
GROUP BY approver_name
ORDER BY steps_over_48h DESC;
```

The day-22 filter is a shortcut. If your fiscal calendar doesn't follow calendar months, join to it and use the real last five business days. Then run the same query for the rest of the month so you have something to compare against. A spreadsheet version is here: [LINK: downloadable approval-wait worksheet].

Look at one number first: what share of the `steps_over_48h` column belongs to the top three names.

## Reading the result

**If three or fewer people hold more than half the stalled steps**, you have an ownership problem, and more reminder emails won't fix it. You can handle it two ways, and many teams need both.

The first is standing delegation for close week. Name a backup with the same approval limit and set it up in the system before the month starts. A delegation someone requests by email on the 29th doesn't count. The backup should be a person who can check an invoice against the work that was done, like a maintenance planner or an operations analyst, not whoever happens to be free.

The second is taking those approvers off invoices that match a PO within tolerance. If the plant manager approved the PO and the invoice matches it on price and quantity, a second approval from him adds a wait and very little control. Send him a notification and let the invoice post.

[NEED: quote from a controller at a 200–500 person manufacturer who removed plant or operations managers from PO-matched invoice approvals: what they were worried about beforehand and what actually happened at close]

**If the stalls are spread across many approvers**, the matrix is too tight everywhere, and delegation will just move the backlog to other people. Look at the thresholds that trigger a second approval. Many were set years ago at round numbers and never adjusted for price increases. Also look for chains that run in sequence when the approvers are checking different things. A cost-center owner and a project engineer can review the same invoice at the same time. Running them in parallel doesn't loosen control. It just stops one person's inbox from holding up the other.

Raising limits does mean fewer approvals per invoice, and you should say so openly. Write down the old and new thresholds and the reason for each change, and tell your auditors before year-end so they don't find out during fieldwork.

[NEED: quote from a CFO or external auditor on what documentation they expect when approval limits or routing rules change mid-year]

**If `non_po_steps` makes up most of the stalled volume**, this is a purchasing problem that happens to show up in AP. Invoices without a PO get routed by someone guessing the cost center, and wrong guesses bounce between approvers. That bouncing is often what drags the queue into the last week. Recurring spend on MRO supplies, maintenance contracts and freight belongs on blanket POs. That conversation happens with purchasing, not in the approval matrix.

[NEED: statistic comparing approval cycle time or cost per invoice for PO-backed and non-PO invoices, from Ledgerline data or a named public benchmark such as APQC or IOFM, if one of them publishes this comparison]

We'd hold off on one change people often reach for first, which is moving the approval cutoff earlier, as in "all approvals by the 25th." It squeezes the same backlog into fewer days, and invoices that arrive after the cutoff get accrued and carried over. The books close on schedule, but the approval queue at the start of next month is longer.

## When the approvals aren't the problem

In some logs the approval steps look slow, but the invoice was never approvable in the first place. It was waiting on three-way match because nobody had posted a goods receipt. If the receiving clerk at a plant enters receipts in a batch when things get busy, every invoice for those parts waits at "pending approval" in your system, and no routing change will move it.

Before you change the matrix, add `receipt_posted_at` to the query and compare it with the approval assignment time. If receipts are posted days after the goods arrived, go talk to whoever runs the receiving dock at that plant.
