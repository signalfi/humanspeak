# Three signatures on a bearing invoice

Take one invoice. A distributor bills $6,200 for replacement bearings on a stamping line. It has a purchase order, and receiving logged the parts in the ERP two weeks ago. It reaches AP on the 24th.

Under routing rules written when the company was half its current size, the invoice goes first to the buyer who placed the PO. Because it's over $5,000, it then goes to the plant manager. After that it goes to the VP of operations, because someone once decided the maintenance account needed extra eyes. That's three people opening three emails, and none of them will learn anything about those bearings that the PO and the receipt didn't already say.

The 24th is also when the plant manager is trying to get the month's shipments out the door.

We build approval software at Ledgerline, so we spend a lot of time looking at chains like this one. Our view is that last-week stalls are mostly a routing problem that companies treat as a discipline problem. The usual response is a reminder cadence plus a rule that everything gets approved by the 25th. We'd skip both. Reminders add more email to the inboxes that are already the bottleneck, and a hard deadline makes approvers click through invoices without reading them, which defeats the reason the approval step exists.

The last week goes wrong for a few specific reasons. Many vendors bill at month-end, so invoice volume peaks just when approvers are busiest. The approvers outside finance have their own month-end: plant managers and maintenance leads are measured on what ships, and an invoice queue will lose to a late truck every time. And serial chains compound. If each approver clears their queue every two days, a three-step chain takes six days, and six days from the 24th lands in next month.

[NEED: statistic on the share of monthly invoice volume that arrives in the last five business days, from Ledgerline's aggregate customer data or a citable benchmark such as APQC or IOFM]

[NEED: statistic comparing median days-to-approve for invoices with three or more approvers against invoices with one]

[NEED: quote from a controller or CFO at a 200–500 person manufacturer, named and with permission, describing what they found when they checked where approvals were sitting at month-end]

## Decision rules for routing

Before you change a rule, look at the last three month-ends and list every approval step still open on the last business day. The query below does that. Then match what you see to one of these cases.

**If more than half of the stalled steps sit with three or fewer people,** fix ownership for those people rather than rewriting policy for everyone. Give each of them a named month-end delegate with the same approval limit, set up in the system and not in an out-of-office message. Or move approval of PO-backed invoices to the buyer, who is the person who actually knows whether the order was right.

**If the stalls are spread across many approvers but bunch up in one dollar band,** the threshold is the problem. A $5,000 limit set years ago catches far more routine spend today than it did when someone picked the number. Raise it, or put a review date on it so it doesn't go stale again.

**If invoices that match the PO and receipt within tolerance still go to a person,** stop routing them. Let matched invoices post, and send only the exceptions to people: price variances, short quantities, missing receipts. This has a real cost. It moves control to purchasing and receiving. If your dock doesn't log receipts accurately, you've just removed the one check that would have caught it. Automatic matching is part of what we sell, and we'd still tell you to fix receiving first.

**If a chain has three or more serial approvers who check different things,** such as budget owner and technical owner, run them in parallel. Only keep a chain serial when the second approver really needs the first one's answer.

**If an invoice arrives after your cutoff with a valid PO and a posted receipt,** accrue it and let the approval finish next month. Some controllers chase approvals on the 30th to avoid booking an accrual. We'd take a well-supported accrual over a rushed signature every time.

[NEED: quote from a finance leader who raised thresholds or switched to exception-only approval, with the before-and-after close timeline in real numbers]

## The query

This finds approval steps that were still open at each close cutoff, grouped so you can see which rule applies. The table and column names are placeholders, so map them to your ERP or AP system. It's written for Postgres; other databases handle date subtraction differently.

```sql
-- Approval steps still open at each month-end cutoff
SELECT
  m.close_date,
  s.approver,
  CASE
    WHEN i.amount < 1000  THEN '1: under 1k'
    WHEN i.amount < 5000  THEN '2: 1k-5k'
    WHEN i.amount < 25000 THEN '3: 5k-25k'
    ELSE '4: 25k+'
  END AS amount_band,
  CASE WHEN i.match_status = 'MATCHED'
       THEN 'matched' ELSE 'exception' END AS match_result,
  COUNT(*) AS open_steps,
  AVG(m.close_date - s.assigned_date) AS avg_days_waiting
FROM approval_steps s
JOIN invoices i   ON i.invoice_id = s.invoice_id
JOIN month_ends m ON s.assigned_date <= m.close_date
                 AND (s.completed_date IS NULL
                      OR s.completed_date > m.close_date)
WHERE m.close_date BETWEEN DATE '2026-06-30' AND DATE '2026-08-31'
GROUP BY 1, 2, 3, 4
ORDER BY open_steps DESC;
```

Here's how to read the output. If the top rows are the same few names every month, that's the first rule. If one amount band dominates across many names, that's the second. Any meaningful count of `matched` rows means people are signing off on invoices the system has already checked, which is the third. If you need a `month_ends` table, a list of your actual close dates is enough, and it's better than calendar month-ends if you close on a workday schedule.

[LINK: downloadable version of this query with column mappings for common mid-market ERPs]

One result means routing isn't your problem. If most of the stalled steps are `exception` rows with no posted receipt, the approvers aren't slow. They're waiting on the dock, and a sensible approver won't sign for parts nobody has recorded receiving. Rerouting those invoices just moves the queue from one inbox to another. For that pattern, check the gap between when goods physically arrive and when the receipt is posted. If that gap runs past three days in the last week of the month, fix receiving before you touch any approval rule.
