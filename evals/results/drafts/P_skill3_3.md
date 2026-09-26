# Whose desk are your month-end invoices sitting on?

*By [NEED: author name and title], Ledgerline*

We'd guess most AP setups at manufacturers with a few hundred people have an approval rule something like this: any invoice over $5,000 goes to the requesting department head, then the plant manager, then the controller. Someone wrote it years ago, probably after one bad invoice, and nobody has read it closely since.

Follow a $6,200 freight invoice through that rule when it arrives on the 26th. Logistics approves it the next morning. Now say the plant manager is hosting a customer audit that week. Forty other approvals are in his queue, and he isn't going to question most of them: maintenance contracts, resin deliveries that already passed three-way match, the monthly forklift lease. He clears the whole queue in one sitting on Thursday night. The controller sees the freight invoice on the 30th, along with everything else the plant manager just released, and it becomes an accrual instead of a posted invoice.

You couldn't fairly call anyone in that chain slow. The rule put one busy person in the path of every invoice over a line that was set when the company was smaller.

That's the first thing we look for when a controller tells us approvals pile up at month-end. The end-of-month spike is real. [NEED: Ledgerline customer data on the share of monthly invoice volume received in the final five business days, e.g. "Across Ledgerline customers, X% of…"] But volume alone doesn't stall invoices. They stall when the spike lands on a few people and the routing rules send almost everything through them.

[NEED: quote from a controller or AP manager at a Ledgerline customer describing their month-end approval backlog in their own words, with name, title, company, and permission to publish]

## Find the wait before you change a rule

The usual advice is to send more reminders and move the invoice cutoff earlier. We'd hold off on both until you know where the waiting happens. Reminders go to the same people who are already behind on the queue, and an earlier cutoff moves the spike to the 22nd.

Most AP tools, and most ERPs with an approval module, can export approval history: one row per invoice per step, with the time it arrived at that step and the time it left. That's all you need. Pull the last three month-ends and run something like this:

```sql
-- How long each approver held invoices received in the last 7 days of the period
SELECT
  approver,
  approval_step,
  route_reason,          -- threshold, GL account, vendor, or PO exception
  COUNT(*) AS invoices,
  ROUND(AVG(EXTRACT(EPOCH FROM (left_step_at - entered_step_at)) / 3600), 1)
    AS avg_hours_waiting,
  SUM(CASE WHEN left_step_at > period_end THEN 1 ELSE 0 END)
    AS approved_after_close
FROM approval_events
WHERE invoice_received_at BETWEEN period_end - INTERVAL '7 days' AND period_end
GROUP BY approver, approval_step, route_reason
ORDER BY approved_after_close DESC, avg_hours_waiting DESC;
```

Your column names will be different. If all you have is a spreadsheet export, a pivot table with approver and route reason as rows and those three values as columns does the same job. [LINK: Ledgerline month-end approval audit template, spreadsheet version]

The `route_reason` column matters more than it looks. It tells you which rule put the invoice in front of that person, and that's the rule you'd change. If your system doesn't record it, add it by hand for the late invoices. There usually aren't many.

## What we'd change, depending on what you find

**If more than half the invoices approved after close sat with three or fewer people,** the problem is who owns approval. Look at what those people are actually approving. A plant manager who approves every PO-matched raw material invoice is signing off on spend that purchasing already approved when it issued the PO. We'd take PO-backed invoices that match within tolerance out of the manual route. We'd keep the plant manager on non-PO spend above a threshold he actually cares about. For whatever he still approves, name a delegate who covers the last five business days by default, so coverage doesn't depend on someone remembering to set an out-of-office.

**If the late invoices are spread thinly across many approvers,** your thresholds are too low for your volume. We disagree with the common fix of raising every threshold at once. Set them by GL category instead. Recurring, contracted spend like utilities, leases and maintenance agreements can go to a single approver at a much higher limit than one-off purchases. [NEED: statistic on the share of invoices that are recurring or contracted at a typical mid-sized manufacturer, from Ledgerline data or a named public benchmark such as APQC or IOFM, with source link]

**If the late invoices are mostly PO exceptions** (price variance, short quantity, no receipt), rerouting won't do much. Widening match tolerances helps at the margins. [NEED: quote from a finance leader on how they chose their match tolerance, as a percentage or dollar amount, and what happened after] What helps more is sending each exception to the person who can resolve it, usually the buyer or receiving. The budget owner can only reply "ask purchasing," and that reply costs a day.

If the export shows a mix, start with ownership. It's usually a handful of rules and a conversation with two or three people, and it clears the most invoices.

One change we'd consider whatever the export says: look at every serial chain where the approvers are checking different things. If the department head is confirming the goods arrived and the controller is checking the coding, neither needs the other's sign-off first. Serial routing lets each approver rely on the one before. Parallel routing gives that up and saves the days an invoice spends waiting in line. When the approvers aren't checking each other's work, we'd take the days.

[NEED: headline statistic on close timing for mid-sized manufacturers, e.g. median days to close from APQC's financial close benchmarks, with year and source link]

Some of what looks like a month-end approval stall never reaches the approval queue at all. A vendor who invoices on the 30th won't show up in your export. Neither will an invoice sitting in a buyer's inbox because it was emailed to the wrong address, since it never entered a step. If your accrual list is long and the export looks clean, compare invoice date to received date for everything dated in the last week of the month. A gap of two or three days there means you have an intake problem, and no approval rule will close it.

---

I didn't include any quotes or statistics because I don't have real ones, and making them up would hurt credibility. Each `[NEED: …]` marker shows what should go there and where to get it. That's mostly Ledgerline's own customer data, customer quotes you have permission to publish, and public benchmarks like APQC's. Fill those in and delete the markers before publishing. The opening scenario is presented as a hypothetical, not a customer story, and the `[LINK: …]` marker needs a real template link or should be removed. The article is about 1,000 words without the markers.
