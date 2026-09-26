# Whose invoice is the compressor repair?

Say an outside shop rebuilds the air compressor that feeds Lines 2 and 3, and sends an invoice for $8,400. The maintenance planner cut the PO. The compressor is on the facilities asset register. Production owns the downtime and most of the budget pain. Your routing rule sends anything over $5,000 to a department head. So which department head gets it?

A common setup routes it to the requester's manager. Here that's the maintenance manager, who forwards it to the production manager because it's her line. She leaves it alone because facilities paid for the last compressor repair. Nobody is being careless. Each of them has a fair claim that the invoice belongs to someone else. In the last week of the month, each of them also has a dozen things more urgent than an AP notification.

That week makes routing problems worse for a few reasons. A lot of suppliers bill monthly or on statement, so invoices bunch up at the end. Plant and department managers are chasing their own month-end numbers at the same time, and an approval request is the easiest item in the inbox to put off, because putting it off costs them nothing until you call. Then there are invoices that need two or three signatures in a row. Each one waits in two or three queues, and every queue is at its slowest right then.

When a controller finally sits down to fix this, there are usually two options on the table: change the dollar thresholds, or reassign who owns approvals by cost center. They fix different problems. If you pick the wrong one, you'll be chasing the same people next month.

Threshold work means changing the dollar amounts that trigger each approval tier. If the goal is closing faster, that usually means letting more invoices clear at the first tier, dropping a tier, or both. It pays off when invoices stall at the second or third signature, especially invoices that already matched a PO and a receipt. For those, the extra approval mostly repeats a decision someone made when they approved the PO. Raising the tier-two trigger from $5,000 to $15,000 on PO-backed spend removes a whole queue for a lot of invoices. You can do it in an afternoon, and it doesn't depend on anyone's org chart. The cost is control. Your auditors will ask why, and non-PO spend is where I'd keep the thresholds tight. What thresholds can't fix is the compressor invoice. It's under $15,000 either way, and it still bounces between three people.

Ownership work means every cost center gets one named approver and one named backup, and invoices route to the cost-center owner no matter who placed the order. Shared assets get a default owner written down ahead of time, so the compressor goes to facilities every time and production gets a copy if you want. This fixes the forwarding loop. It also fixes concentration, where a few senior people approve for half the plant and turn into the bottleneck at month-end. The cost is setup and upkeep. Someone has to map every cost center, settle the arguments about shared equipment, and update the map whenever a manager leaves or a line gets reorganized. If that map goes stale, you've rebuilt the ambiguity with extra steps.

## Count last month's stuck invoices first

Don't decide in the abstract. Pull every invoice that was still unapproved three business days before your close deadline last month and fill in a row for each:

```
Invoice # | Vendor | Amount | PO-backed? (Y/N) | Cost center
Approval tier where it waited (1/2/3)
Who it waited with | Was that person the budget owner? (Y/N)
Times forwarded/reassigned | Days waiting
Real reason: tier wait / ownership unclear / approver out / match exception / other
```

If your AP system logs approval history, most of these columns come straight out of that log. The last column is a judgment call, so fill it in yourself. That's where you'll learn the most. [LINK: downloadable version of this worksheet]

Then read the counts.

If most of the stalled invoices were PO-backed and waited at tier two or higher, work on thresholds. Your approvers aren't confused. There are just too many of them in the chain.

If most were forwarded at least once, or sat with someone who wasn't the budget owner, restructure ownership. Moving the dollar amounts won't change who thinks the invoice is theirs.

If more than half of the stalled dollars sat with three or fewer people, restructure ownership and name delegates. Those people aren't slow. They're overloaded, and a threshold change won't take enough off their plates.

If the waits spread evenly across many approvers and most lasted only a day or two, you may not have a routing problem. You may simply have a volume problem. Moving your internal approval cutoff two days earlier, or accruing the stragglers, will do more than redesigning anything.

Many plants will land on a mix: raise thresholds for PO-backed spend and assign owners for the shared-asset cost centers where invoices bounce. That's fine, but make the threshold change first. It's quicker, and it shrinks the pile you'll need to sort out while you build the ownership map.

## When the invoice was never waiting on an approver

Check that last column before you change anything. Some of the invoices you chased as "stuck in approval" were probably never in anyone's approval queue. They were sitting in match exceptions: a receipt nobody posted in the ERP, a price that didn't match the PO, or a quantity short-shipped and never corrected. They look the same from your chair, because either way the invoice isn't approved. But nothing about routing touches them, and neither thresholds nor cost-center owners will move them.

If exceptions make up a large share of your list, the fix is on the receiving dock and in purchasing. Someone has to post receipts the day material arrives, and buyers need to fix PO prices before the invoice shows up. It's a less interesting project than redesigning approvals, and at plenty of plants it's the one that actually moves the close date. [NEED: any Ledgerline data on what share of month-end holds are match exceptions versus approval waits, if the team has it]
