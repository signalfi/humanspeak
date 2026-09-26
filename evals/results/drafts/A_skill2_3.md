# Who owns cost center 4120?

Here's an invoice we made up, though there's nothing unusual about it. A bearing supplier bills $11,600 for spindle parts, coded to cost center 4120, plant maintenance. It lands on the 24th. The approval matrix says anything over $10,000 needs the maintenance manager and then the plant manager. The maintenance manager approves it on the 26th, on his phone, between a changeover and a safety walk. The plant manager gets it on the 27th. That's also the day she's trying to get three late orders onto trucks so they count as this month's shipments. She approves it on the 3rd, and your accrual for it was a guess.

Everyone in that chain did what the matrix told them to. The invoice stalled because the second signature belonged to someone whose own month-end falls in the same week as yours.

That timing is built in. Invoice volume bunches up late in the month, because vendors bill on their own cycles and receiving catches up on paperwork before the period ends. Meanwhile the people who approve spend in a plant have month-end deadlines of their own: shipments to push out, counts to finish, overtime to justify. The approval matrix treats the 9th and the 28th the same, but the approvers don't.

## Two levers

A controller who wants that week back can change the dollar bands, so fewer invoices need a second or third signature. Or they can change who owns the first signature, by giving each cost center one named owner and a named backup.

Changing thresholds is the cheaper move. It's an edit to the approval policy, one conversation with your auditors, and a config change. It works best on PO-backed invoices that already match the PO and the receipt. On those, the plant manager's signature approves spending that someone with authority already approved when the PO was cut. If the invoice matches within tolerance, you can defend raising the floor for the second signature on matched invoices and keeping dual approval for non-PO spend. The weakness is that thresholds only affect the later steps. If the first approver is where invoices sit, moving the bands won't change anything.

Restructuring ownership costs more. You need a maintained table of cost centers, owners and delegates. Operations leadership has to agree that "Dave in maintenance" means Dave approves, or his named backup does, and nobody else. When someone changes roles, the table has to change with them. What you get for that is an invoice that reaches a person who knows it's theirs. It stops getting forwarded with "not mine, try purchasing."

We build approval routing software, so here's our opinion. Controllers tend to reach for thresholds first because it's a one-line change, and that's exactly why you should check the data before you pull that lever.

## Finding out which one you need

Look at where invoices actually waited over your last three closes. If your AP system can export approval step history, a query like this will show you. Adapt the table and column names to your own export:

```sql
-- Approval steps completed after the AP cutoff, last three closes
SELECT
  s.approver,
  s.step_number,
  i.cost_center,
  COUNT(*)                         AS late_steps,
  SUM(i.amount)                    AS dollars_held,
  ROUND(AVG(s.hours_in_queue), 1)  AS avg_hours_waiting,
  SUM(s.times_reassigned)          AS reassignments,
  SUM(CASE WHEN i.receipt_posted_at > i.received_by_ap_at
           THEN 1 ELSE 0 END)      AS waiting_on_receipt
FROM approval_steps s
JOIN invoices i       ON i.invoice_id = s.invoice_id
JOIN close_calendar c ON c.period = i.gl_period
WHERE s.approved_at > c.ap_cutoff
  AND i.gl_period IN ('2026-06', '2026-07', '2026-08')
GROUP BY s.approver, s.step_number, i.cost_center
ORDER BY dollars_held DESC;
```

If your system doesn't store `hours_in_queue`, calculate it from the assigned and approved timestamps. If you're a Ledgerline customer, the same cut is available as a saved report: [LINK: Ledgerline stall report template].

Then read the results against a few rules:

- **If more than half of the late steps are step 2 or higher**, change the thresholds. Start with PO-matched invoices, where the extra signature adds the least control.
- **If most late steps are step 1 and the reassignment column isn't zero**, invoices are going to people who don't think they own them. Restructure ownership, starting with the cost centers that have the most reassignments.
- **If most late steps are step 1 and three or fewer approvers account for most of the dollars held**, those people own too many cost centers. Split their cost centers or give each one a named delegate who approves during close week. Raising the thresholds won't help, because these invoices never get as far as the second step.
- **If the late step-1 invoices are spread across many approvers with no reassignments**, the people routed to are the right ones, but they aren't getting to it. Neither lever solves that directly. A close-week rule that escalates to the delegate after 24 hours is the smallest change that might.

You'll often get a mix. A plant can have both a second-signature problem on maintenance spend and an ownership problem on shared cost centers like facilities or IT. You can fix them separately, and you should start with whichever one holds more dollars.

## When the problem is upstream of routing

Look at the `waiting_on_receipt` column before you take anything to your CFO. When an invoice arrives before the goods receipt is posted, the three-way match fails. The invoice goes into an exception queue, or it sits unmatched until someone at the dock catches up on paperwork. The approval clock is running that whole time, even though no approver has anything to do yet. Tightening thresholds won't move those invoices, and neither will reassigning cost centers.

If a large share of your late invoices were waiting on a receipt, the conversation you need is with the receiving supervisor. Ask when receipts get posted and whether anyone posts them in the last three days of the month. [NEED: Ledgerline or customer data on the share of late invoices blocked by missing receipts, if the team has it, to show how often this is the real cause.]
