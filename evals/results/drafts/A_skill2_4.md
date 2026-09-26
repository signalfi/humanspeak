# Should invoice approvals follow the dollar amount or the cost center?

Somewhere on your shared drive there's a spreadsheet, probably named something like `Approval Matrix_FINAL_v3`, that decides who signs off on every invoice the plant receives. It usually has four or five rows of dollar bands. Under $2,500 goes to the department manager. Up to $25,000 goes to the plant manager. Anything bigger goes to the controller, and the top band goes to the CFO. The matrix was built to answer one question: how much can this person commit the company to? It answers that well. It doesn't say whose invoice it is.

Our view at Ledgerline is that the last week of the month goes missing in that gap.

Most of the year, the gap doesn't matter much. Invoices arrive at a pace people can keep up with, and when one lands with the wrong person, they walk it over to the right one. Month-end changes that. Vendors send their period bills together. Receiving works through the dock paperwork it put off. Freight, maintenance contractors and MRO suppliers bill for work that crossed two lines or two buildings. The invoices that pile up are the ones where the person the matrix names by dollar amount didn't order the thing, doesn't recognize the vendor, and isn't at a desk, because they run a production floor. So the invoice gets forwarded, or it sits. You find out on the 29th, when it shows up on your aging report and you start sending emails.

That leaves you two ways to change the routing. You can redraw the dollar bands so fewer invoices climb to the few people who are hardest to reach. Or you can give every cost center a named owner who approves what's coded to it, up to a ceiling, whatever the amount.

**Redrawing thresholds** is the smaller change. You can edit a policy in a week. It's easy to explain to your auditor, and it helps a lot when the bottleneck is one or two senior people. If your plant manager approves every invoice between $5,000 and $25,000 and spends the last week of the month on customer visits, raising the department-manager limit to $10,000 takes a real share of that queue off their plate. The cost is control. Every raised limit is a question your auditor will ask about, and you need a written reason for it. Thresholds also do nothing for the orphaned invoice. A $4,000 freight bill split across two plants is just as orphaned under a $10,000 band as it was under a $2,500 one.

**Restructuring by cost center** goes after the forwarding loop. The maintenance supervisor approves maintenance, whatever the amount up to their ceiling, because it's their budget and they know whether the work got done. It takes more work to set up. Every cost center needs an owner and a backup, and both names have to be kept current as people change roles. It also depends on getting the coding right at intake. If AP codes an invoice to the wrong cost center, the new routing just sends it to the wrong person faster. Our bias is toward ownership, because an approver who recognizes the invoice acts on it. But it's the wrong fix if your problem is really two overloaded executives.

## Read the last three closes before you choose

Don't decide this from memory. Last month's worst stragglers will distort it. Pull every invoice that was still waiting for approval at any point in the final five business days of your last three closes, and see where it waited. The query below assumes a generic AP export. Rename the tables and columns to match your system.

```sql
-- Invoices pending approval in the last 5 business days of each period
SELECT
    a.approver_name,
    a.approver_threshold_band,
    i.cost_center,
    COUNT(*)                                   AS invoices_waiting,
    SUM(CASE WHEN a.forward_count > 0 THEN 1 ELSE 0 END) AS invoices_forwarded,
    AVG(a.approved_at::date - a.assigned_at::date)       AS avg_days_with_approver,
    SUM(CASE WHEN a.approver_cost_center <> i.cost_center
             THEN 1 ELSE 0 END)                AS approver_outside_cost_center
FROM ap_invoices i
JOIN ap_approval_steps a ON a.invoice_id = i.invoice_id
WHERE a.assigned_at >= :period_end - INTERVAL '7 days'
  AND a.assigned_at <= :period_end
  AND i.period IN (:last_three_periods)
GROUP BY 1, 2, 3
ORDER BY invoices_waiting DESC;
```

If you run AP in Ledgerline, [NEED: name and path of the approval-aging-by-approver report, if it gives the same cut].

Then apply these rules to what you get back.

If more than half of the waiting invoices sit with three or fewer approvers, and those approvers are in the upper threshold bands, the problem is a senior bottleneck. Change the thresholds first. Also give those people a delegate for the last week of the month.

If the waiting invoices are spread across many approvers, and a large share were forwarded at least once or went to an approver outside the invoice's cost center, the problem is ownership. Map cost centers to owners. Changing thresholds would move the pile around without making it smaller.

If both patterns show up, do ownership first. Once invoices reach people who recognize them, the senior queue usually gets shorter too, and then you can see which thresholds still need to change.

[NEED: one Ledgerline customer's before-and-after, e.g. median days to approve in close week before and after moving to cost-center owners, with permission to name them]

## When neither one is the problem

Sometimes the query shows short waits with approvers and you still close late. Then the delay is upstream of approval. Two causes are common at manufacturers. The first is three-way-match exceptions: an invoice can't move until receiving posts the receipt, and at month-end receiving is behind too. The second is invoices that get to AP late, because they were emailed to a buyer's inbox or dropped at the plant office before anyone forwarded them. Neither routing change touches these. You'd be redesigning the approval matrix to fix a receiving backlog or an intake problem.

So add one column to the query before you run it: the date each invoice first reached AP, next to the date it was assigned to an approver. If that gap is longer than the time invoices spent with approvers, leave the matrix alone for now. Sit down with receiving before the next close.
