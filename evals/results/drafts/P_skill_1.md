# Month-end invoice approvals stall in a handful of inboxes

*By [NEED: author name and title], Ledgerline*

When a controller tells us their AP team can't keep up at month-end, the first thing we ask for is the approval log for the last six months. We want one row per approval step, showing when the step was assigned and when it was completed. Very few finance teams have looked at their data this way. When they do, the pile-up usually sits with a small number of approvers outside finance, on the same five or six days every month. AP is rarely where the hours go.

In a plant, that pattern isn't surprising. In the last week of the month the plant manager is pushing shipments out the door to make the month's numbers, and the operations VP is building the deck for the monthly review. An invoice approval request is the least urgent thing in either inbox. It also looks unimportant: an email with a PDF attached, asking them to confirm spend they may have already approved on the purchase order three weeks earlier.

> [NEED: quote from a controller or CFO at a 200–500 person manufacturer about month-end approval delays, with name, title, company and permission to publish]

[NEED: a published statistic on invoice approval cycle time or cost per invoice for mid-sized companies, with source and year, e.g. an APQC or Ardent Partners AP benchmark]

Our view is that most approval matrices at mid-sized manufacturers were designed for control and never reviewed for flow. The thresholds were set when the company was half its current size. Serial chains grew one approver at a time, each added after some old incident. Nobody set up delegates, because nobody happened to be out when the rules were written. Each of those decisions made sense on its own. Together they can put a dozen hand-offs between a received invoice and a posted one, and at month-end every hand-off becomes a queue.

## Find out where the hours go

Measure before you change any rule. If your ERP or AP system stores approval steps, the query below returns wait hours per approver for the last seven days of each month over the past six months. It's written for Postgres, so rename the columns to match your schema.

```sql
-- Month-end approval wait by approver and step type, last 6 months
WITH steps AS (
  SELECT
    approver,
    step_type,  -- e.g. 'approval', 'match_exception'
    EXTRACT(EPOCH FROM (COALESCE(completed_at, NOW()) - assigned_at)) / 3600 AS wait_hours
  FROM approval_steps
  WHERE assigned_at >= NOW() - INTERVAL '6 months'
    AND assigned_at >= DATE_TRUNC('month', assigned_at)
                       + INTERVAL '1 month' - INTERVAL '7 days'
)
SELECT
  approver,
  step_type,
  COUNT(*)                                   AS steps,
  ROUND(SUM(wait_hours)::numeric, 0)         AS wait_hours,
  ROUND((100 * SUM(wait_hours)
         / SUM(SUM(wait_hours)) OVER ())::numeric, 1) AS pct_of_wait
FROM steps
GROUP BY approver, step_type
ORDER BY wait_hours DESC;
```

If all you have is a spreadsheet export, a pivot table does the same job. Add a column for hours waited (completed minus assigned), filter to the final seven days of each month, sum by approver and step type, and sort from largest to smallest. [LINK: downloadable version of this worksheet]

Focus on two columns. `pct_of_wait` shows whether the delay is concentrated in a few people or spread across many. `step_type` shows whether invoices are waiting for someone's judgment or stuck on a match exception, which is a separate problem.

## What to change, depending on what you find

**If three or fewer approvers hold more than half the month-end wait hours,** change how those people own approvals and leave the thresholds alone. Give each of them a named delegate who can approve during the last week of the month. Set an escalation that reassigns the step after 24 hours. Then ask whether they need to see these invoices at all. A plant manager often ends up on the chain because they once wanted visibility into spend, and a weekly spend report gives them that without anything waiting on them.

**If the wait is spread thinly across many approvers,** your thresholds are too low. Look at the amounts on invoices that go to a second or third approver. If most of them are routine, like MRO supplies, freight or maintenance contracts, raise the limit. You can also add a category rule that sends invoices from recurring vendors on an approved contract straight to posting.

**If PO-backed invoices that match within tolerance still go to a person,** remove that step. The spend was approved when the PO went out. Asking for approval again on a matched invoice means the same person approves the same money twice, and in the last week of the month they'll be slow about it. Keep human review for invoices outside tolerance, for non-PO invoices and for new vendors.

**If much of the wait sits in match-exception steps,** look at receiving before you look at approvers. At month-end the dock is busy shipping, and goods receipts often get posted in batches days after the material arrived. An invoice can't three-way match against a receipt that isn't in the system yet. Ask whoever runs receiving to post receipts daily during the last week, even if that takes an extra person on the dock for those days. While you're in the match rules, check the tolerances as well. A 0% price tolerance will reject invoices over freight rounding.

**If invoices above a threshold go to two executives in sequence,** for example the operations VP and then the CFO, run the two approvals in parallel or keep only one. A serial chain doubles the chance that the invoice is waiting on someone who is traveling.

[NEED: Ledgerline customer example with permission (named, or anonymized with consent) showing median month-end approval time or days-to-close before and after a routing change]

> [NEED: second quote from a finance leader, ideally about removing approval from PO-matched invoices or about setting up delegates, with name, title, company and permission]

## When routing isn't what's holding up the close

Some of what looks like an approval stall is actually invoices arriving late. If a supplier sends an invoice on the 28th for goods delivered on the 10th, no change to your routing will get it approved before cutoff. You can check this in the same export by comparing the goods receipt date with the invoice received date. If most of your late invoices were late to arrive, stop chasing approvals to close the month. Book received-not-invoiced accruals from your goods receipts, close on schedule, and let those invoices go through the next month's normal approval flow. Accruing received goods is standard practice. A consistent accrual method is also easier to explain to your auditors than a last-minute rush of approvals.

The late suppliers are usually a short list too. A call to their billing contact about invoicing on shipment will often fix more than any change to your routing.
