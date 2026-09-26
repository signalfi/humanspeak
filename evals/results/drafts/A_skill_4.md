# Who owns the invoice on the 28th?

Sort your month-end approval queue by approver instead of by vendor and you'll usually see one of two pictures. In the first, a few names hold most of the dollars: the plant GM, the VP of operations, maybe the CFO. Each is sitting on eight or ten large invoices that crossed a dollar tier. In the second, the queue is wide and shallow. Thirty or forty people each hold two or three invoices, and when you call them, a lot of them say the invoice isn't theirs.

Those two pictures need different fixes. Most controllers we talk to are choosing between the fixes without ever having sorted the queue this way. One option is to tighten the dollar thresholds that decide who has to approve. The other is to reassign approval ownership so that every cost center has one named person who approves its spend. Both are reasonable, but they clear different kinds of stall.

It helps to be clear about why the last week is so much worse than the other three. At a manufacturer, the end of the month is also when the plants push to ship. The people you need to approve invoices, like plant managers, maintenance leads and the ops VP, are on the floor or on the phone with customers about late orders. Vendors bill at month-end too, so invoice volume peaks just as approvers have the least time. And when someone gets an invoice they don't recognize, they set it aside rather than reject it, because rejecting it means working out who it actually belongs to. That set-aside pile is what you spend the week chasing.

## What each fix actually changes

Threshold rules control how many people touch an invoice and how senior they are. If your tiers were set years ago, they probably send more routine spend upstairs now than anyone intended, because the price of a pallet of resin or a replacement motor has moved and the limit hasn't. Tightening usually means a few things: raising the dollar level where senior sign-off starts, letting PO-matched invoices within tolerance skip approval (the PO was the approval), and requiring anyone above a certain tier to name a delegate before they travel. These are configuration changes. You can make them in a week, after a conversation with your auditors about the control you're relaxing.

What thresholds can't fix is an invoice routed to the wrong person. If a maintenance invoice lands with the plant GM because it's over $10,000, and the GM has no idea which line it was for, moving the limit to $15,000 just sends the next one to a different person who also has no idea.

Ownership by cost center goes after that problem. Every cost center gets an owner and a named backup, and invoices route on the cost center coded on the PO or the invoice line, not on the dollar amount alone. Approvers see only spend they're accountable for, so "that's not mine" mostly disappears. The cost is the map. Someone has to build it and someone has to keep it current. Shared cost centers like plant overhead, facilities and IT are where it gets fuzzy, and a person has to be assigned to them by decision, not by default. People change roles and the map goes stale. Plan on weeks to build it and a quarterly review to keep it honest.

[NEED: a Ledgerline customer example: which change they made, and their close days or day-minus-3 open approvals before and after]

## Deciding from your own queue

These cutoffs are our starting points, not laws. Adjust them once you've seen a couple of months of your own data.

- If three or fewer approvers hold more than half the stalled dollars on business day minus 3, and they hold them because of a dollar tier, change the thresholds and require delegates. A cost-center map won't help, because those people legitimately own that spend.
- If the stalled invoices are spread across fifteen or more approvers, and more than a quarter of your chase calls end with "not mine" or a reroute, restructure by cost center. Changing thresholds would only move misrouted invoices from one wrong desk to another.
- If most stalled invoices fall under your lowest tier and already match a PO and receipt, auto-approve matched invoices within tolerance. That counts as a threshold change, and it's the cheapest one you can make.
- If you see both patterns, make the threshold change first because it can ship this month. Start the cost-center map for next quarter.

To get the numbers, run something like this on the morning you'd normally start chasing. Rename the fields to match your AP system:

```sql
-- Run on business day -3, or whenever chase week starts
SELECT current_approver,
       routing_reason,          -- e.g. 'dollar tier', 'cost center', 'GL rule'
       COUNT(*)                 AS open_invoices,
       SUM(amount)              AS open_dollars,
       SUM(CASE WHEN reroute_count > 0 THEN 1 ELSE 0 END) AS rerouted,
       MAX(days_in_queue)       AS oldest_days
FROM   ap_invoices
WHERE  status = 'PENDING_APPROVAL'
GROUP  BY current_approver, routing_reason
ORDER  BY open_dollars DESC;
```

Plenty of systems don't log reroutes or the reason an invoice went to a particular person. If yours doesn't, keep a tally during one chase week. After each call or email, mark the outcome as approved, forgot, not mine, or waiting on something. A single month of that tally will tell you more than the query, because it records what the approver said rather than what the system did. We keep a blank version of that tally sheet here: [LINK: Ledgerline chase-week tally template].

## When the approver was never the problem

Some of what looks like an approval stall is really a matching stall. At a plant, a common cause is a receiver who hasn't posted the goods receipt at the dock, so the invoice can't match and the approver can't act on it, or does act and gets bounced back to AP. In many AP systems those invoices sit in the same "pending" bucket as the ones waiting on a signature, so they end up in your chase list and get counted against your approvers.

Neither thresholds nor cost-center ownership will move them. The fix is a receipt-posting cutoff at receiving, for example: everything physically received by the 25th is posted by end of shift on the 26th, and the receiving lead owns that deadline the same way a cost-center owner owns an approval.

So before you touch routing at all, pull the exception reason on every invoice still open on business day minus 3. If a third of them are waiting on a receipt, your first conversation is with the dock supervisor. The approvers can wait.
