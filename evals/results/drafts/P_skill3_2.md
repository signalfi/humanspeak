# Who approves the forklift repair invoice?

*By [NEED: author name and title], Ledgerline*

A hydraulic repair on a forklift comes in at $3,800. The service vendor emails the invoice on the last Thursday of the month, because that's the day their billing clerk sends everything out. Your AP system routes it to the maintenance supervisor, who owns the cost center. The supervisor's approval limit stops at $2,500, so after signing off the invoice moves on to the plant manager. Both of them are on the floor that week. One is keeping line 2 running through the month-end production push, and the other is walking the physical count. The invoice will get approved, probably on the 3rd. Until then your close either waits for it or carries an accrual you'll clean up later.

Nobody in that chain is being careless. At a mid-sized manufacturer, most of the people who approve invoices also run operations, and their busiest week is the same as yours: shipping to make the month's revenue, cycle counts, production reports. Vendors also bill on their own month-end. So the approval queue is longest on exactly the days when approvers have the least attention for it.

[NEED: statistic on the share of a typical mid-sized manufacturer's monthly invoice volume that arrives in the last five business days, from Ledgerline's anonymized customer data or a named, citable survey]

[NEED: quote from a controller or CFO at a 200–500 person manufacturer, with name, title and company, describing what chasing approvals during close looks like for them]

The usual response is a reminder email around the 20th asking managers to clear their queues before close. We'd skip it. On the 20th, the forklift invoice doesn't exist yet. A reminder asks people to be quicker, but it leaves the route the same: the invoice still goes to the busiest people in the building, sometimes twice, in their worst week. You can change the route. You can't move month-end.

Before you change anything, find out where the last three month-ends actually got stuck.

## Pull the last three closes

This query assumes an approval log with one row per approval step. It's written in SQL Server syntax, so rename columns and adjust date functions to fit your ERP or AP system. It only looks at steps routed in the final seven days of each month.

```sql
SELECT
    approver_role,
    approver_name,
    COUNT(*) AS steps,
    AVG(DATEDIFF(hour, routed_at, approved_at)) / 24.0 AS avg_days_waiting,
    SUM(CASE WHEN po_number IS NOT NULL
              AND match_status = 'MATCHED_IN_TOLERANCE'
             THEN 1 ELSE 0 END) AS clean_po_matches,
    SUM(CASE WHEN match_status = 'VARIANCE'
             THEN 1 ELSE 0 END) AS variance_holds,
    SUM(CASE WHEN is_escalation = 1
              AND invoice_amount <= prior_approver_limit * 1.25
             THEN 1 ELSE 0 END) AS just_over_limit
FROM invoice_approval_steps
WHERE routed_at >= DATEADD(month, -3, GETDATE())
  AND routed_at > DATEADD(day, -7, EOMONTH(routed_at))
GROUP BY approver_role, approver_name
ORDER BY avg_days_waiting DESC;
```

`just_over_limit` counts escalations where the invoice beat the previous approver's limit by 25% or less. Those are the second hops that mostly exist because a threshold is out of date. If you can't query the system, an export with the same columns works in a spreadsheet: [LINK: Ledgerline month-end approval worksheet].

## Reading what comes back

Start with the top five rows. Each column points to a different change.

**Mostly `clean_po_matches`:** stop routing these invoices to a person. The buyer already approved the spend when the PO went out, and receiving confirmed the goods arrived. A matched invoice within tolerance just asks the maintenance supervisor to approve the same spend again. We'd auto-approve these and send only exceptions to people. There's a real trade-off, though: you're now trusting your receiving data completely. If your dock posts receipts before anyone counts what's on the truck, you'll end up paying for shortages. If that's true of you, fix it first.

**High `just_over_limit`:** your thresholds are older than your prices. A $2,500 limit set in 2019 catches many more invoices in 2026 than anyone intended. Raise the lower approver's limit, or set limits by spend category. Either way, the invoices that were never meant to take a second hop stop taking it.

**Mostly `variance_holds`:** the invoices are sitting with buyers who owe a price or quantity answer. Let AP accept variances under a fixed amount or percentage. We'd start at $250 or 2%, whichever is lower, and adjust after a quarter. Send everything else to the buyer with a 48-hour clock, and escalate to the purchasing manager when the clock runs out.

**Waiting time bunched on two or three names, and nothing above explains it:** those people are the wrong approvers for month-end. Route by role instead of by name. Below a set dollar amount, let a plant controller or cost accountant who isn't on the floor that week approve against the budget line.

The common advice at this point is to give every approver a backup. We disagree. When a backup gets the same notification at the same moment as the primary, each has a reason to assume the other is handling it, and now two busy people are ignoring the invoice. We'd use an escalation with a clock instead. After 48 hours the invoice moves to a named role and leaves the first approver's queue, so exactly one person owns it at any moment.

[NEED: short quote from a Ledgerline customer's controller on what changed after they rerouted approvals. Include days-to-close before and after only if they'll go on record with the numbers.]

Sometimes the query comes back clean. Approvers cleared their steps within a day, and the close slipped anyway. When that happens, look before the approval step, at the gap between each invoice date and the goods-receipt posting for the same PO lines. If receipts for the last week's deliveries were posted on the 2nd, those invoices couldn't match. They sat in an exception queue before routing and never showed up in the approval log. No routing rule fixes that. Talk to whoever runs the dock about posting receipts the day the truck is unloaded, and do it before the next count week.
