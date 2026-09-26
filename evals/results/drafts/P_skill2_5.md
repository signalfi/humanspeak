# The approval matrix nobody has opened since go-live

Somewhere in your ERP configuration there's a table that decides who approves what. Cost center 4100 goes to the maintenance manager. Anything over $10,000 goes to the plant manager as well, and anything over $50,000 also goes to the VP of operations. It was probably built during implementation by a consultant and whoever in finance could spare a week. Since then the company may have added a second plant and a hundred people, and the table stayed as it was.

We build accounts-payable software for manufacturers at Ledgerline, so we obviously care how invoices get approved. Our view is that this table explains more of the month-end backlog than approvers' habits do. You can make most of the changes below in the system you already run.

Look at the last week of the month from the approver's side. [NEED: statistic on the share of a typical month's supplier invoices that arrive, or are still waiting for approval, in the last five business days. Use Ledgerline customer data or a named benchmark such as APQC or IOFM, with the source cited.] Suppliers that bill on statement cycles push volume toward the end of the month. Operations is pushing to hit its shipment numbers that same week. The plant manager who is third in line for a $12,000 tooling invoice is out on the floor. The invoice can't reach them until the maintenance lead ahead of them clicks approve, and the maintenance lead is on the floor too. In a sequential chain, the invoice waits for each approver in turn, on the week when all of them are busiest.

[NEED: quote from a plant manager or operations approver, with name, title and company, on why invoices sit in their queue at month-end.]

Old thresholds make it worse. A $10,000 tier set when that was a large purchase now catches routine orders. Delegation rules often exist only in the policy binder. PO-matched invoices still get routed for a signature. AP spends the last three days emailing people, and the controller books accruals for invoices nobody disputes.

[NEED: quote from a controller or CFO at a Ledgerline customer, with name, title and company, describing month-end approval chasing before they changed their routing.]

## Find out where they're sitting

Take a snapshot before you change anything. Three business days before period end, pull every invoice still pending approval and group the list by who is holding it. If you can query the ERP directly, something like this works. Table and column names will differ by system.

```sql
-- Pending approvals, 3 business days before period end
SELECT
  current_approver,
  approval_step,                      -- 1 = first approver in chain
  COUNT(*)                         AS invoices,
  SUM(invoice_amount)              AS dollars,
  SUM(CASE WHEN po_number IS NOT NULL
            AND match_status = 'MATCHED'
      THEN 1 ELSE 0 END)           AS po_matched,
  AVG(CURRENT_DATE - step_entered_date) AS avg_days_at_step
FROM ap_invoice_approvals
WHERE status = 'PENDING'
GROUP BY current_approver, approval_step
ORDER BY dollars DESC;
```

If you can't query it, export the pending list with six fields and pivot it in a spreadsheet: approver, step number, amount, PO number, match status, and the date the invoice reached its current step. [LINK: Ledgerline month-end approval snapshot, spreadsheet version.] Run it for the last three month-ends. A single month can be thrown off by one person's vacation.

## What to change, depending on what you find

**If more than half of the pending invoices sit with three or fewer people,** you have an ownership problem. Those few people hold too wide a slice of spend, or they can't get to a desk in the last week. Give each of them a named delegate with the same dollar limits. Set the delegate to take over automatically once an invoice has waited a set number of hours, so nobody has to remember to forward it. Then think about moving routine cost centers to a supervisor who is at a desk during close.

**If the backlog is spread thin across many approvers,** look at the approval_step column. If most of the waiting happens at step 2 or 3, invoices are stuck behind someone else. Make the middle steps parallel so the maintenance lead and the plant manager see the invoice at the same time, and keep only the final sign-off sequential. Then compare your dollar thresholds with current spend. A tier that catches most invoices from routine suppliers is set too low.

**If a large share of pending invoices are PO-matched,** most of them don't need to be in an approval queue at all. Someone approved the purchase order when it was raised, and the receipt confirms the goods arrived. Let invoices that match the PO and receipt within a set tolerance post without another signature. The tolerance can be a percentage, a dollar cap or both. Only exceptions get routed. Your auditors will want the tolerance written down and evidence that someone reviews the exceptions. That takes one policy memo, which costs less than a signature on every matched invoice. [NEED: statistic on the share of PO-backed invoices at mid-sized manufacturers that match within tolerance on the first pass, with source.]

**If none of those describe your backlog,** it's probably made up of non-PO service invoices: contractors, calibration vendors and utilities, each with a different owner. A routing change won't help much here. A standing monthly approval against a budget line will. The approver agrees once to "up to $X a month from this vendor," and only the overage gets routed.

We'd change one thing at a time. Start with whichever group held the most dollars, then re-run the snapshot at the next month-end. It will tell you whether the queue actually shrank or just moved to someone else.

Before you touch the approval matrix, add one more column to the snapshot: receipt date. An invoice that seems stuck with an approver may actually be waiting for receiving to post the goods receipt. Until the receipt posts, the three-way match fails and the invoice is routed as an exception. No approval rule fixes that. If receipts post days after the goods reach the dock, talk to the receiving supervisor, and have that conversation well before the 25th.
