# Your plant manager isn't approving that invoice on the 29th

Take a dull invoice: $6,400 from the service company that rebuilt a hydraulic cylinder on press line 2. There's a PO for it, and receiving posted the work as complete on the 20th. The invoice matches both to within a dollar. It lands in the plant manager's approval queue on the 26th and is still there on the 3rd, when your staff accountant books an accrual for it and adds a reminder to reverse it next month.

The invoice is fine, and so is the plant manager. In the last week of the month that person is running the cycle count, trying to get three more trucks shipped inside the period, and answering your team's questions about scrap. The approval route assumed they'd have ten spare minutes a day, and that week they don't.

We think most month-end stalls come from this. Approval routes follow the org chart, and the people on the org chart are busiest in the week when invoice volume is highest. Plenty of vendors bill on the last business day, so the queue is longest exactly when the people who clear it have the least time. [NEED: statistic on the share of monthly invoice volume that arrives in the last week of the month, from Ledgerline's anonymized customer data or a public AP benchmark such as Ardent Partners' *State of ePayables*, with source and year]

[NEED: quote from a controller or CFO at a 200–500 person manufacturer describing the month-end approval pile-up in their own words, with real name, title, company, and permission to publish]

Every invoice still unapproved at cutoff becomes an estimate, then a reversal, then a true-up. Some accruals can't be avoided. The ones caused by a matched invoice waiting for a signature can. [NEED: benchmark for days-to-close at mid-market companies, e.g. from APQC's financial close research, with the figure and edition cited]

## Where your invoices wait

Don't touch a rule until you know who holds invoices during close week and what kind of invoices they are. Most AP systems, Ledgerline included, can export approval steps with an assigned timestamp and an action timestamp. Three months of history is enough. This is the query we'd run (PostgreSQL; rename the columns to match your export):

```sql
WITH steps AS (
  SELECT approver,
         invoice_id,
         invoice_amount,
         po_matched,
         EXTRACT(EPOCH FROM (acted_at - assigned_at)) / 3600.0 AS hours_held,
         assigned_at >= date_trunc('month', assigned_at)
                        + interval '1 month' - interval '7 days' AS close_week
  FROM approval_steps
  WHERE assigned_at >= now() - interval '3 months'
    AND acted_at IS NOT NULL
)
SELECT approver,
       COUNT(*) FILTER (WHERE close_week)                     AS close_week_steps,
       percentile_cont(0.5) WITHIN GROUP (ORDER BY hours_held)
         FILTER (WHERE close_week)                            AS close_week_median_hrs,
       percentile_cont(0.5) WITHIN GROUP (ORDER BY hours_held)
         FILTER (WHERE NOT close_week)                        AS other_weeks_median_hrs,
       COUNT(*) FILTER (WHERE close_week AND po_matched)      AS matched_but_held
FROM steps
GROUP BY approver
ORDER BY close_week_median_hrs DESC NULLS LAST;
```

Without SQL access you can build the same thing as a pivot table. Put approvers in the rows, add a flag for "assigned in the last seven days of the month," and use median hours held as the value. [LINK: Ledgerline close-week approval audit spreadsheet]

For each approver, look at two numbers: how much longer they hold invoices in close week than in the rest of the month, and how many of the invoices they held were already PO-matched.

## What to change, based on what you find

**If a large share of close-week holds are matched PO invoices, stop sending them to a person.** The spending was approved when someone signed the PO, and receiving confirmed the goods or work arrived. A second signature on a matched invoice adds almost nothing. Set a match tolerance your auditors will accept, something like 2% or $250, whichever is smaller. Let invoices inside it post, and send only the exceptions to an approver. We'd make this change first because it takes work off people's desks for good.

**If more than half of close-week hold time sits with three or fewer people, you have an ownership problem.** Raising thresholds won't fix it. Give each of those people a named close-week delegate, and put it on the calendar at the start of the quarter. An out-of-office rule someone remembers on the 27th doesn't count. Then add a timer: during the last five business days, any invoice that sits for 24 hours moves to the delegate automatically.

**If holds are spread across many approvers and cluster just above a dollar threshold, the thresholds are out of date.** A $5,000 limit set when resin, steel, and outside maintenance cost less now catches routine invoices that nobody reviews closely. To check, pull the amounts of invoices approved in under an hour with no comments or edits. If lots of them sit just above a threshold, the threshold is doing no work at that level.

**If invoices pass through two or three approvers in a row, check whether the middle one has ever rejected anything.** If the operations VP has approved every invoice the plant manager already approved over the last year, that step adds a day of waiting and no control. Remove it, or run the two approvals in parallel. Talk to your auditors or lender first if the step was added to satisfy one of them. Often it wasn't, and nobody remembers why it's there.

[NEED: quote from a finance leader at a Ledgerline customer about one specific routing change they made and what it did to their close, with real before-and-after numbers]

## When routing isn't the problem

Sometimes the query shows that close-week invoices stall because they can't match: the goods arrived but nobody entered the receipt, or the service PO has no receiving step at all. No routing rule helps there. Wherever you send those invoices, the approver is looking at an exception they can't resolve from their desk.

Before your next close, count how many of last month's close-week exceptions have a receipt dated after the invoice date. If that count is large, you need to talk with the plant about posting receipts on the day things arrive, and that conversation is worth more than any change to approval routing.
