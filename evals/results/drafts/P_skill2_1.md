# Who approves invoices on the 28th?

Somewhere in your AP system there's a rule that reads roughly like this: *PO invoices over $25,000 route to the plant controller. Non-PO invoices over $5,000 route to the department head, then the VP of operations.*

Someone wrote that rule during a quiet week, with spending authority and segregation of duties in mind. It's a reasonable rule. It doesn't account for what the plant controller is doing on the 28th: tying out the physical count, chasing WIP variances, drafting accruals and answering the CFO's questions about scrap. The rule sends her a $40,000 resin invoice anyway, along with thirty others, and they sit in an inbox she won't clear until the 3rd.

We build approval routing for mid-sized manufacturers at Ledgerline. Our view is that most late-month approval stalls come from this collision. The people your matrix names as approvers tend to be the same people doing the close. [NEED: quote from a controller or AP manager at a manufacturer, ideally a Ledgerline customer who has agreed to be named, describing who ends up holding invoices during close week and why.]

Volume makes it worse. Plenty of vendors bill at month end, and receipts that built up over the month all get matched in a rush. [NEED: hard statistic on how invoice volume concentrates at month end, e.g. the share of monthly invoices received in the final five business days, from Ledgerline's aggregated customer data or a public benchmark that can be cited.] The heaviest week of invoices lands on the approvers with the least time.

Two more things pile on at manufacturers. The first is receiving. If your dock team is doing cycle counts or a full physical inventory at month end, goods receipts get posted late. PO invoices that should three-way match then drop into an exception queue. On the aging report that looks like an approval delay, but no approver has touched those invoices. The second is serial chains. An invoice that has to go through the department head, then the plant manager, then the controller waits in three queues one after another, and each queue moves slower in close week.

## Pull three closes of data before changing anything

If you guess which of these is your problem, you'll probably end up rewriting your routing rules twice. Your approval log already has what you need to tell them apart: one row per approval step for everything assigned in the last seven days of each of your last three months, grouped by approver.

Here's a query to start from. The table and column names are placeholders for your schema, and the date math is Postgres-style, so adjust it for your database.

```sql
-- Approval steps assigned in the last 7 days of each of the last 3 month-ends
SELECT
  s.approver_name,
  COUNT(*)                                                         AS steps,
  SUM(COALESCE(s.completed_at, CURRENT_DATE)::date
      - s.assigned_at::date)                                       AS days_waiting,
  SUM(CASE WHEN i.match_status = 'MATCHED' THEN 1 ELSE 0 END)      AS matched_po_steps,
  SUM(CASE WHEN i.po_number IS NULL THEN 1 ELSE 0 END)             AS non_po_steps
FROM approval_steps s
JOIN invoices i       ON i.invoice_id = s.invoice_id
JOIN close_calendar c ON s.assigned_at::date BETWEEN c.period_end - 6 AND c.period_end
WHERE c.period_end >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY s.approver_name
ORDER BY days_waiting DESC;
```

Then run two variations. Group late-month invoices by status to see how many were stuck in match exception instead of with a person, and count approval steps per invoice to see how long your chains are. [LINK: Ledgerline close-week routing audit spreadsheet, with the same columns and the pivots already built]

## What to change, depending on what you find

**If three or fewer approvers account for more than half the waiting days,** your matrix is putting approval authority on your close team. Give each of those people a named delegate with the same limits for the last five business days. Set the delegates up in the system before the month starts, not by email on the 27th. If delegation worries your auditors, you can narrow the controller's routing instead: send them only capex, new-vendor and non-PO spend, and let a senior AP analyst approve matched PO invoices.

**If a large share of the waiting steps are on matched PO invoices,** ask whether those need a human approval at all. The spending decision was made when someone approved the purchase order. We think an invoice that matches the PO and the receipt within tolerance should post without another sign-off, and that this is the right default for most manufacturers. Set your price and quantity tolerances deliberately, and review the auto-posted invoices after close, not before.

**If the waiting days are spread thinly across many approvers,** with each holding a handful, your thresholds are probably too low. Dozens of department heads each get a few small invoices during the week they're least likely to look at the queue. Raise the non-PO threshold for routine categories like MRO supplies and utilities. Send approvers one batched digest a day instead of an alert for every invoice.

**If most chains have three or more serial steps,** check what each approver is actually confirming. A department head confirming the work was done and a controller confirming the GL coding are checking different things, so they can approve in parallel. Keep serial routing only where a later approver needs the earlier approver's answer.

**If match exceptions are the biggest bucket,** leave routing alone and talk to operations. Ask them to post receipts daily during counts, even if that means one person keying in the dock paperwork at the end of each shift.

[NEED: second quote from a finance leader on what changed after they reworked approval routing, ideally with before-and-after days-to-close figures, which would also serve as the second hard statistic.]

## The invoices you shouldn't chase

Some invoices will still be unapproved on the last day, and no routing change will fix them. A disputed tooling charge or a capital purchase waiting on the plant manager's review won't move on your schedule. Chasing them during close week costs you time you don't have.

For these, set a cut-off. Anything not approved by the second-to-last business day gets accrued at the PO amount or your best estimate, and gets approved in the next period on its own schedule. Your close then depends on the accrual schedule, which you control, instead of on an approver's inbox, which you don't. At the start of each month, send approvers a close calendar with the cut-off date on it, next to the name of their delegate.

---

*Note: I didn't write any quotes or statistics because I don't have real ones, and made-up figures attributed to finance leaders would hurt the article's credibility. Each `[NEED: …]` marker shows what should go there. The two quote slots and the month-end volume statistic need real sources. The before-and-after close figure in the second quote slot can also count as your second statistic.*
