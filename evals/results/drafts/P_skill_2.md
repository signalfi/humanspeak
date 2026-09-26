# The approval route you drew at go-live doesn't hold up in the last week of the month

At most manufacturers with a few hundred people, someone sketched the invoice approval route on a whiteboard when the AP system went in, and nobody has redrawn it since. It reads like the org chart on an ordinary Tuesday. An invoice over $5,000 goes to the plant manager, one over $25,000 then goes to the VP of operations, and anything coded to capex ends with the CFO. Each step waits for the one before it.

For about three weeks a month, that route works. In the fourth week it runs straight into everyone's other deadlines. The plant manager is running cycle counts. The VP of operations is getting ready for the monthly ops review. The CFO is reading the flash P&L. The route still sends each invoice to each of them one at a time, so a single day of delay at step one pushes back every step after it.

[NEED: a hard statistic on how approvals bunch up at month-end, e.g. the share of monthly invoice approvals completed in the last five business days, from anonymized Ledgerline customer data or a published AP benchmark (IOFM, APQC, Ardent Partners), with the source and year]

At Ledgerline we build approval routing for mid-sized manufacturers, so we look at a lot of these queues. We've found that controllers usually know the close is slow but can't say where the invoices are waiting. The usual guess is "approvers are busy," which is true but doesn't tell you what to change. The data will be more specific than that.

[NEED: quote from a controller or CFO at a manufacturer, ideally a Ledgerline customer, describing what the last week of the month looked like before they changed routing. Include full name, title, company, and confirmed permission to publish]

## Find out where the invoices are sitting

Before you change a threshold, pull the approval steps from the last three closes and group them by who held each one and how long they held it. Table and column names vary by ERP and AP tool, but the query looks roughly like this:

```sql
-- Approval steps assigned in the final five business days before each close,
-- over the last three closes
SELECT
  a.approver_name,
  a.route_step,
  (i.po_number IS NOT NULL)            AS po_backed,
  COUNT(*)                             AS steps_assigned,
  SUM(i.amount)                        AS dollars,
  AVG(DATEDIFF(day, a.assigned_at,
      COALESCE(a.completed_at, c.close_date))) AS avg_days_held
FROM approval_steps a
JOIN invoices i        ON i.invoice_id = a.invoice_id
JOIN close_calendar c  ON a.assigned_at BETWEEN c.last5_start AND c.close_date
WHERE c.close_date >= DATEADD(month, -3, CURRENT_DATE)
GROUP BY a.approver_name, a.route_step, (i.po_number IS NOT NULL)
ORDER BY avg_days_held DESC, steps_assigned DESC;
```

If you don't have a close calendar table, a spreadsheet with three rows (close date and the date five business days before it) is enough. What matters is the result. You'll see whether the backlog belongs to a few people or many, whether it builds at step one or step three, and whether the invoices waiting already have a purchase order behind them.

[LINK: downloadable version of this query with mappings for common mid-market ERPs, plus a blank delegation-of-authority template]

## What to change, based on what the query shows

**If three or fewer approvers hold more than half the late-month backlog**, you have an ownership problem, and raising thresholds won't fix it. Give each of those people one named delegate with a fixed window, for example from five business days before close through close day, set to expire on its own. We'd much rather see one delegate per approver with a hard end date than a pool where "any manager can approve." Pools feel flexible, but every invoice sits there waiting for someone else to pick it up, and your auditors will ask who actually approved it.

**If the backlog is spread across many approvers who each hold a handful**, look at your dollar tiers. Thresholds set a few years ago haven't moved while parts, freight and contractor rates have gone up, so more routine invoices now cross into the higher tier. Count how many invoices land within 20% above each threshold. If that band is crowded with repeat vendors and ordinary spend, raising the tier moves a lot of volume off the senior approvers' desks. The trade-off is less control on spend in that band. Write the change into your delegation-of-authority policy and get sign-off from whoever owns it (CFO, audit committee, or both) before you switch it on.

**If invoices are waiting at step two or three of a serial chain**, ask what each approver is actually checking. The plant manager confirms the goods or service arrived. The VP of operations confirms it fits the budget. Neither of those checks depends on the other, so they can run in parallel. Keep a step serial only when the later approver really needs the earlier one's answer.

**If most of what's waiting is PO-backed and already matched**, stop routing it. When an invoice matches the PO and the goods receipt within tolerance, the spending decision was made when the PO was approved, so a second approval adds a signature without adding any control. Auto-approve inside a tolerance you can defend (a percentage and a dollar cap, whichever is smaller) and send only the exceptions to a person.

**If the backlog is mostly non-PO spend** like utilities, freight, maintenance contractors or software renewals, set up recurring-vendor rules. An invoice from a known vendor that lands within a set range of last month's amount can go to one approver, or none, and anything outside the range goes to review.

[NEED: second quote from a finance leader on the trade-off between tighter control and a faster close, e.g. how they justified raising a threshold or adding auto-approval to auditors or the audit committee, with name, title, company and permission]

[NEED: second hard statistic, e.g. change in days-to-close or in late-month approval cycle time after a routing change, from a named Ledgerline customer (with permission) or aggregated customer data, with the time period stated]

## When the invoices aren't waiting on any approver

Sometimes the query comes back thinner than expected. The approvers don't look slow, but AP still has a pile of unposted invoices on the 29th. That usually means the invoices never reached an approver at all. They're sitting in match exceptions because nobody posted the goods receipts. The dock received the steel on the 18th, the paperwork is on a clipboard, and the three-way match can't close without it.

Routing can't fix that. It's a receiving problem, and it belongs in a conversation with the plant, which can be a hard one to have in the middle of close. So before you redraw any approval route, compare two counts for the last week of the month: invoices waiting on an approver, and invoices waiting on a receipt. If the second number is bigger, start at the dock.
