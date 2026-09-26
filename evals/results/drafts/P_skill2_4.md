# Whose desk is the invoice on?

*[NEED: author name and title], Ledgerline*

Follow one invoice through a close. Say it's $6,400 from a tooling supplier for replacement inserts on a horizontal mill. It arrives on the 19th and gets matched to its PO that afternoon. The price is 3% over because the supplier added a carbide surcharge, so it lands in the exception queue. AP clears it on the 22nd and routes it to the plant manager, who approves it from his phone on the 24th. It's over $5,000, so it goes next to the VP of operations. She's at a supplier audit until the 29th. On the 30th someone in accounting books a manual accrual for it, and the VP approves it on the 2nd.

Nobody in that story did anything wrong. The plant manager took two days, which is reasonable for someone who spends his shift on the floor. The VP was where her job needed her to be. The invoice spent nearly all of its two weeks waiting in places the routing rules sent it, and those rules were written for an ordinary week in the middle of the month.

The last week of the month is where those rules cost the most, and the reasons are mostly arithmetic. Suppliers bill at month-end, so volume bunches up [NEED: share of monthly invoice volume received in the final seven days, from Ledgerline customer data or the reader's own AP system]. At a manufacturer, most approvers are operations people, and their month-end is its own crunch of shipments to get out and production numbers to hit. When two approval steps run in sequence, a slow day at the first one is also a slow day at the second. And an escalation timer set to five business days means an invoice assigned on the 26th won't escalate until after the close.

[NEED: quote from a controller at a 200–500 person manufacturer describing what chasing approvals in close week looks like, with name, title, company and permission to publish]

[NEED: public benchmark for invoice approval cycle time or days to close at mid-sized companies, e.g. from APQC or Ardent Partners; confirm the current figure and link the source]

Most controllers already have a theory about where their stuck invoices sit. We'd still check it against the data, because the right fix depends on the pattern, and memory tends to favor the loudest month over the typical one.

## Pull the last three closes

Run this against your approval history once for each of the last three period ends. It returns every approval step that was open at any point in the final seven days of the period, grouped by who held it and what kind of step it was.

```sql
-- One row per approval step. Rename tables and columns to match your ERP or AP export.
-- :period_end = last day of the period you're checking. Run once per period.
SELECT
  s.step_type,        -- exception review, first approval, second approval, etc.
  s.assignee,
  COUNT(*)            AS steps_open_in_close_week,
  SUM(i.amount)       AS dollars_waiting,
  AVG(COALESCE(s.completed_at, :period_end) - s.assigned_at) AS avg_days_open
FROM approval_steps s
JOIN invoices i ON i.invoice_id = s.invoice_id
WHERE s.assigned_at <= :period_end
  AND (s.completed_at IS NULL
       OR s.completed_at > :period_end - INTERVAL '7 days')
GROUP BY s.step_type, s.assignee
ORDER BY dollars_waiting DESC;
```

Date arithmetic varies by database, so adjust the interval syntax to match yours. If all you can get is a spreadsheet export, a pivot table does the same job. Put step type and assignee in the rows, count and sum of amount in the values, and filter to steps that were open during the last seven days.

## Reading it

If three or fewer people hold more than half the close-week dollars, you have an ownership problem, and changing thresholds won't fix it. Give each of those people a named delegate with authority up to the same limit. Set the delegation to take over automatically when a step has sat for 48 hours in the last seven days of the period. (In Ledgerline this is a delegation rule with a period-end condition; [NEED: confirm feature name and link to help article].) If a delegate has to check with the original approver before signing, they aren't really a delegate, and your routing shouldn't be set up as though they were.

If the waiting is spread across many approvers but most of it sits at second-level steps, look at your dollar thresholds. Pull every second-level approval from the past year and count how many were rejected or sent back. If that number is close to zero, the step is costing you days and catching nothing. Raise the threshold, or turn the second approval into an after-the-fact review of a weekly list that a VP can clear in one sitting. Where two approvers are both required and neither one's decision depends on the other's, route to them in parallel.

If the biggest bucket is exception review, invoices are failing the match before anyone is asked to approve them. At a manufacturer we'd look first at two things. One is a price tolerance set tighter than your suppliers' surcharges and freight lines. The other is receipts that haven't been posted at the dock. The tolerance is a settings change. The receipts mean a conversation with whoever runs receiving about posting within a day, which is harder and matters more.

For PO-backed invoices that match within tolerance, ask whether they need a human approval at all. Someone approved the PO when it was raised, and the receipt confirms the goods arrived. We think sending a clean three-way match straight to payment scheduling is a defensible control. Talk to your auditors before you do it and write down the control you're relying on, because they will ask.

[NEED: quote from a finance leader who changed their approval routing, covering what they changed and what happened to close timing]

One more change sits in accounting policy rather than routing. If the books stay open because invoices are unapproved, you're treating payment approval as your signal that an expense happened. Goods received by the 31st are an expense of that period whether or not the VP has signed. Accrue from receipts and matched invoices, close on schedule, and let the approval to pay come through on the 2nd. The cost is more reversing entries and the occasional estimate that turns out to be wrong. We'd take that over holding the close for a signature.

If the query comes back thin, without much sitting anywhere, routing probably isn't your problem. Take the invoices you accrued manually last month and compare each invoice date with the date AP received it. If an invoice is dated the 24th and reaches AP on the 3rd, it was probably sitting in a buyer's inbox, and no approval rule can act on an invoice it hasn't seen yet. Start by giving suppliers a single AP address and asking your ten largest to use it.
