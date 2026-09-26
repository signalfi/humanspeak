# Who approves the gearbox invoice on the 29th?

Picture a $14,200 invoice from the shop that rebuilt a gearbox on line 3. It reaches AP on the 26th. The routing rule was set up when the ERP went live. It sends any maintenance invoice over $10,000 to the maintenance supervisor, then the plant manager, then the VP of operations, one after another.

The supervisor approves it on the 27th. The plant manager spends the last three days of the month on the floor, pushing to ship everything the plant can before the period closes, so the invoice sits. The VP approves it from a phone on the 2nd. By then your team has booked an accrual for it. They'll reverse it next month, and someone will lose part of an afternoon matching the two up.

Nobody in that chain did anything wrong. Each approver acted sensibly, and the rule made sense when it was written. The delay comes from the order of the steps and from when they happen.

We're Ledgerline. We build accounts-payable automation for mid-sized manufacturers, so we have a stake in this and some opinions about it.

## Where the time goes

In a serial chain, the delays add up: each approver's slowest day becomes part of the total. If each of three people clears their queue within a day, the invoice takes three days at best. At month-end, the people who run production stop clearing their queues within a day. Your plant manager and maintenance lead are measured on output, and the last week of the month is when output gets counted. Approving invoices drops to the bottom of their list, and for their jobs that's the right place for it.

That same week is usually when invoice volume peaks, because plenty of vendors bill at month-end. [NEED: statistic on the share of a typical manufacturer's monthly invoices that arrive in the last five business days, with source: Ledgerline customer data or a published AP benchmark such as IOFM or APQC.] So the queue grows just as the approvers stop looking at it.

[NEED: quote from a controller or CFO at a 200–500 person manufacturer describing the month-end approval bottleneck in their own words; name, title, company, and permission to publish.]

The usual responses are to raise dollar thresholds or to set a hard invoice cutoff date for vendors. We wouldn't start with thresholds. Old thresholds do catch more routine spend as prices rise. But raising them across the board is a broad control change your auditors will ask about, and it may not touch the invoices that are actually late. We disagree even more with the vendor cutoff. Telling suppliers to invoice by the 25th only moves the problem into accruals. The goods still arrived, and the cost still belongs in the period. You end up estimating more instead of approving faster.

The first change we'd push for is to stop asking people to approve things that were already approved. Take a PO-backed invoice that matches the purchase order and the receiving record on price and quantity. It was approved when the PO was signed. Sending it to the plant manager adds a person to the chain without adding a control. [NEED: benchmark or customer figure for the share of invoices that are PO-backed and pass three-way match at a typical mid-sized manufacturer.] Let those invoices post once they match, and send only the exceptions to people.

For the invoices that still need a person, the order of approvers matters as much as the thresholds. Where segregation of duties requires two sign-offs, send them to both approvers at once instead of one after the other. Give every operational approver a named backup for the last five business days of each month. Then have the system escalate to that backup after a set number of hours instead of waiting for someone to notice the invoice is stuck.

[NEED: quote from a finance leader on what changed after removing approvals from matched invoices or adding month-end delegation; attributed and approved for publication.]

## Reading your own queue

Before you change any rule, find out where your late invoices actually waited. Export approval history for the last three closes, one row per approval step. Include invoice ID, amount, PO number (or blank), receipt date, approver, step number, when the step was assigned, when it was completed, and the period-end date. Then run something like this:

```sql
SELECT approver,
       COUNT(*) AS late_steps,
       ROUND(AVG(EXTRACT(EPOCH FROM (completed_at - assigned_at)) / 3600), 1) AS avg_hours_waiting,
       SUM(CASE WHEN po_number IS NOT NULL THEN 1 ELSE 0 END) AS with_po,
       SUM(CASE WHEN amount < 10000 THEN 1 ELSE 0 END) AS under_threshold,
       SUM(CASE WHEN step_number > 1 THEN 1 ELSE 0 END) AS later_steps
FROM approval_steps
WHERE assigned_at <= period_end_date
  AND completed_at > period_end_date
GROUP BY approver
ORDER BY late_steps DESC;
```

This returns every step that was assigned before period end and completed after it, grouped by who held it. Replace the 10,000 with your own threshold. A spreadsheet version with the same columns is here: [LINK: Ledgerline month-end approval audit template].

Then check the results against these rules:

- If most late steps have a PO number, those invoices are going to people who don't need to see them. Fix matching and auto-posting before anything else.
- If more than half the late steps sit with two or three people, the problem is who owns the approvals. Give those people month-end backups and escalation, and leave the thresholds alone.
- If the late steps are spread across many approvers and most are under your threshold, the threshold itself is catching routine spend. That's when a threshold review is worth the conversation with audit.
- If the late steps are mostly second or third approvals and the first approval cleared quickly, send approvals at the same time wherever your controls allow it.

[NEED: benchmark days-to-close for manufacturers of this size, with source, if you want to give readers a target to compare against.]

## When routing isn't the problem

Sometimes the export turns up invoices that never reached an approver at all. They sat in AP as match exceptions because the receipt wasn't posted: the dock took in the parts on the 29th and nobody entered them until the 3rd. From the controller's desk these look like approval delays, but no routing change will fix them. If many of your late invoices have a receipt date after the invoice date, you need to talk to receiving. Start by asking who posts receipts on second shift.
