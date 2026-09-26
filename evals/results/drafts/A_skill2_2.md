# Should a $6,200 bearing invoice need two signatures?

By [NEED: author name and role at Ledgerline]

Here's an invoice for replacement spindle bearings on a CNC line. It's $6,200, it matches the PO, and the parts were received and installed two weeks ago. Say the routing policy is common for a manufacturer your size: cost-center manager up to $5,000, plant manager up to $25,000, VP of operations above that. The maintenance supervisor approves it from his phone in under a minute. Then it moves to the plant manager, whose queue is full of invoices like it, and who spends the last week of the month on the floor trying to get shipments out before the period ends. He didn't order the bearings and doesn't know which machine they went into. He has no reason to question them either. His signature adds somewhere between a day and a week to the invoice, and it adds nothing to anyone's knowledge.

Now picture every invoice between $5,000 and $25,000 that arrives in the last week, which is when a lot of vendors send their month-end billing. The people who hold the higher approval tiers are the same people with the most going on at month-end. You're the one who has to close, so you end up with a spreadsheet of names and a phone.

You can pull two levers in approval routing. You can change the dollar tiers, meaning which amounts need which level of sign-off. Or you can change ownership, meaning who is the approver for each cost center. They fix different failures, so pick based on where your invoices actually wait.

## What each lever is for

Dollar tiers matter when invoices get stuck in the escalation layer, where people approve because of the amount and not because they know anything about the purchase. The plant manager in the bearing example sits there. We'll say this plainly: tightening tiers in the stricter sense, meaning lowering the amount where senior sign-off starts, nearly always makes the last week worse. It sends more invoices to the smallest and hardest-to-reach group of people. If an auditor or your CFO wants tighter control, put it on the purchase order. Get senior approval when money is committed, and let an invoice that matches its PO and receipt within tolerance skip the second tier. Control happens once, when someone can still say no, and the approval queue at month-end gets shorter.

Ownership matters when invoices get stuck at the first approver because that person can't vouch for the charge. Shared cost centers cause most of this: facilities, IT, a maintenance pool serving two buildings, anything AP coded on a best guess. Other causes: the approver changed roles and the workflow wasn't updated, or they're on vacation with no delegate set. The invoice sits, or bounces back with "not mine," and restarts at the bottom of someone else's queue. Restructuring by cost center means every cost center gets one named owner who controls that budget and one named backup. Routing then follows the cost center first and the amount second. That takes more work to set up than changing a number in the tier table, and it needs maintenance every time someone changes jobs. We still think it's the more durable fix for most plants, because it puts each invoice in front of someone who knows what it's for.

## Reading your own stall

You don't have to guess which failure you have. On the morning of the third business day before close, export every invoice still pending approval, then sort it two ways.

```
Columns to export (one row per pending invoice):
  invoice_id | vendor | amount | cost_center | current_approver
  approval_step (1 = first approver, 2+ = escalation tier)
  days_waiting | times_reassigned_or_rejected | receipt_posted (Y/N)

Pivot A: current_approver × count of invoices, sum of amount
Pivot B: approval_step × count of invoices, sum of amount
Filter:  receipt_posted = N  (count these separately, see below)
```

A downloadable version with the pivots built in is here: [LINK: Ledgerline approval-aging workbook].

Then read the pivots against these rules:

- If most pending dollars are at step 2 or higher and step 1 is already done, the tiers are the problem. Raise the escalation amount for invoices that match a PO, or remove the middle tier for them.
- If most pending invoices are at step 1, or a noticeable share have been reassigned or rejected at least once, ownership is the problem. Start with the cost centers those invoices belong to, because it's usually a handful of shared ones.
- If more than half the stalled invoices are with three or fewer people, look at which step those people hold. A plant manager holding step-2 invoices points to tiers. A facilities coordinator holding step-1 invoices for four departments points to ownership.
- If the stall is thin and spread out, with one or two invoices each across dozens of approvers, rerouting won't fix it. Those approvers are batching. They open the queue once a week and that week happens to be the last one. What helps is a set approval sweep around the 15th, or a daily digest with the oldest items at the top, and not a new routing table.

Plenty of teams will find both patterns. If so, do ownership first. Moving tiers without fixing ownership just speeds invoices toward the wrong person.

What we can't give you yet is a reliable benchmark for what "normal" looks like on these pivots at a 300-person manufacturer. [NEED: Ledgerline aggregate data on typical share of pending invoices at step 1 vs step 2+ in the final week, if the team has it and can publish it.] Until we have that, compare this month's export with next month's after you make one change.

## When neither lever applies

Before you redesign anything, look at the rows with `receipt_posted = N`. Those invoices aren't waiting on an approver. They're waiting on the receiving dock. The goods came in, but nobody posted the receipt in the ERP, so the three-way match fails and the invoice sits in an exception queue. From your chair, that queue looks exactly like a stalled approval. Rerouting won't clear it and neither will new thresholds. The approver may never have seen these invoices at all.

If that filter returns a big pile, you're chasing the wrong people. Your first call is to the receiving lead at each plant, and the conversation is about how soon a receipt gets posted after the truck is unloaded. Get that number from them before you touch the approval matrix.
