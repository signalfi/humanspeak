# The plant manager's inbox is part of your close calendar

*By [NEED: author name and title at Ledgerline]*

Take one invoice. A maintenance supervisor orders a replacement gearbox for a stamping press, $11,800, on a PO. The part arrives, receiving logs it, and the vendor invoices on the 24th. The approval matrix was written when the company was half its current size, and it says anything over $10,000 goes to the plant manager and then to the VP of operations, in that order. That week the plant manager is also running physical inventory counts. So the invoice sits.

Every rule in that chain made sense when someone wrote it. The trouble comes when a few hundred invoices like it land in the same five business days. AP has keyed everything and the approval requests are out, but the controller spends the week chasing signatures when they should be reviewing accruals.

[NEED: quote from a controller or AP manager at a mid-sized manufacturer describing a specific month-end approval delay, with name, title, company, and permission to publish]

Part of the problem is timing. Many suppliers bill on their own month-end cycle, so invoice volume bunches up late in the month [NEED: share of monthly invoice volume arriving in the final five to seven business days, ideally from anonymized Ledgerline customer data, with sample size and period]. The approvers on the operations side also have close-week work of their own, mainly inventory counts and production variance reporting. Most approval chains are sequential too, so the VP can't act on the gearbox invoice until the plant manager does. A VP who approves within the hour is no help while the plant manager is on the floor counting pallets.

Our view at Ledgerline is that most month-end stalls come from how invoices are routed, and that the right fix depends on where the stuck invoices are sitting. So before changing any rule, go and look.

## Find where they're waiting

On the third business day before close, pull every invoice still waiting for approval and group the list by current approver. The query below is written for Postgres against a typical approval-log export. Rename the columns to match your system.

```sql
-- Invoices awaiting approval as of close minus 3 business days
SELECT
  a.current_approver,
  COUNT(*)                                        AS invoices_waiting,
  SUM(i.amount)                                   AS dollars_waiting,
  ROUND(AVG(EXTRACT(EPOCH FROM (:as_of - a.assigned_at)) / 3600), 1)
                                                  AS avg_hours_waiting,
  AVG(a.step_number)                              AS avg_chain_step,
  SUM(CASE WHEN i.po_number IS NOT NULL
            AND i.match_status = 'matched'
           THEN 1 ELSE 0 END)                     AS po_matched,
  SUM(CASE WHEN i.match_status IN ('price_variance','qty_variance','no_receipt')
           THEN 1 ELSE 0 END)                     AS exceptions
FROM approval_tasks a
JOIN invoices i ON i.invoice_id = a.invoice_id
WHERE a.status = 'pending'
  AND a.assigned_at <= :as_of
GROUP BY a.current_approver
ORDER BY invoices_waiting DESC;
```

If you'd rather not write SQL: [NEED: link to a downloadable spreadsheet version of this audit, if Ledgerline publishes one].

Look at two things in the output. First, how many people hold the backlog. Second, what kind of invoices they're holding.

## Match what you find to a change

**If more than half the pending invoices sit with three or fewer approvers,** you have an ownership problem. For the last seven business days of the month, give each of those people a named delegate who can approve up to a set amount. Then add a timer so anything they haven't touched in 24 hours moves to the delegate automatically. This has a real cost: delegates approve things they know less about. Set the delegate's limit below the point where you'd want the primary approver's judgment.

**If the backlog is spread across many approvers but most of it sits above a dollar threshold nobody has revisited in years,** re-index the thresholds. Parts and materials cost more than they did when your matrix was written, so a $10,000 tier set a decade ago now catches invoices it was never meant to see. Check what share of total invoices each tier gets today. If the VP tier is seeing a quarter of everything, it's doing a job it wasn't designed for.

**If most pending invoices are PO-backed and matched to a receipt within tolerance,** ask why they need a person to approve them at all. Someone approved the spend when the PO went out, and receiving confirmed the goods arrived. If the only reason for the extra step is that it has always been there, let matched invoices within tolerance post without it. Keep human approval for non-PO spend and variances. Talk to your auditors before you switch. They'll want the tolerance settings and the PO approval controls documented, and it's better to learn that in September than during fieldwork.

**If the wait piles up at the second or third step of multi-approver chains,** run those approvals in parallel. The plant manager and the VP get the invoice at the same time, and it posts once both have acted. You lose one thing: the VP no longer sees the plant manager's comments before deciding. Where that matters, capital purchases for example, keep that category sequential and run everything else in parallel.

[NEED: before-and-after median approval cycle time for a routing change like one of the above, from a named Ledgerline customer (with permission) or an anonymized aggregate, with the measurement period]

[NEED: second quote, e.g. from a plant manager or VP of operations on how month-end approval requests look from their side of the business]

## Where routing won't help

Sometimes the pending list isn't really waiting on approvers. The invoices are exceptions: price or quantity variances, or no receipt at all because receiving posts goods receipts in batches and the dock is behind. No routing rule can approve its way past a missing receipt. Before you change anything, take every invoice still open at close minus three and compare its invoice date with its receipt posting date. If many receipts were posted after the invoice arrived, the fix is at the dock, and the conversation you need is with the receiving supervisor.

It's also worth asking whether the close needs these invoices approved at all. If you accrue on goods received, an unapproved invoice for received goods is already in your numbers. The approval backlog is then a payables problem. That still matters for vendor terms and early-pay discounts, but it no longer has to hold up the close.

---

I couldn't include real quotes or statistics because I don't have access to any, and making them up would undercut the credibility you asked for. Every `[NEED: …]` marker shows where one belongs and what it should contain. Anonymized Ledgerline customer data plus one or two customer quotes (with permission) would fill all of them. The author byline and the spreadsheet link are also placeholders.
