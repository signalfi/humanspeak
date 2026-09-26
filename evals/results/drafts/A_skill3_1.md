# Is your approval matrix sorted by the wrong column?

Here's an approval matrix of the kind a 300-person manufacturer might run. Under $2,500, the requester's supervisor signs. From $2,500 to $25,000, the department manager. Above $25,000, the plant manager, and above $100,000, the VP of operations. It sits on one spreadsheet tab. Most of the arguments about it are about the dollar column, because that's the column that looks like a control.

When approvals pile up in the last week of the month, the dollar column is the obvious thing to change. You could tighten the bands, let department managers sign to a higher limit, and send fewer invoices up to the plant manager, who is also trying to hit a shipping number that week. Sometimes that's the right move. But the dollar column only says who has authority to approve an invoice. It says nothing about who recognizes it, and at month-end, recognition is where a lot of invoices get stuck.

Look at what arrives in that final week. Vendors bill at month-end. Receiving catches up on a backlog of packing slips, so invoices that were waiting on a three-way match all become approvable at once. Many of them are for spend nobody clearly owns: freight that served two plants, MRO supplies charged to a general maintenance account, a calibration contractor who worked on lines belonging to three supervisors. The matrix sends each one to whoever the amount points at. If that person doesn't recognize the charge, they either leave it or forward it, and every forward starts the wait over.

We think a controller should find out where invoices actually sit before changing either the thresholds or the ownership model. Each fix solves a different problem, and each one is wasted effort if you apply it to the other's problem.

Changing thresholds helps when a senior approver is in the chain only because of the amount, and approves almost without looking once they get to it. If the plant manager signs $30,000 resin invoices from a contracted supplier after a glance, then raising the department manager's limit to $50,000 removes one wait without losing any real review. It won't do anything for a $4,000 freight bill that nobody recognizes, because at any threshold the bill still lands on someone who doesn't know what it is.

Restructuring by cost center means every cost center gets one named owner and one named delegate. Every invoice coded to it goes to that owner, whatever the amount. Senior sign-off above a high band runs alongside the owner's approval, not after it. This fixes orphan spend and rerouting. It costs more to set up. Invoices have to be coded correctly when they come in, which means default cost centers on vendors and POs. Owners also have to accept that they own the budget line, including the dull parts. Plant managers sometimes push back because they lose sight of spend below the top band. That's a real trade-off, and a weekly spend report usually settles it better than keeping them in the approval chain.

I'd push back on one common piece of advice. When a close goes badly, teams often add a second approver "for control" on anything over some amount. If that second approval runs in sequence, the wait for those invoices roughly doubles in exactly the week when it hurts most. If you need two signatures above a band, route them in parallel.

## Pull three closes before you pick

For the last three month-end closes, export every invoice that was either approved in the final five business days before your AP cutoff or was still unapproved at cutoff. You want these fields:

```
invoice_id | vendor | amount | cost_center | received_date
approved_date | approver_chain (in order) | days_held_by_each_approver
times_rerouted | waiting_on_match_at_receipt (Y/N)
```

Then work out four numbers for each close:

```
A. % of stuck invoices whose longest hold was with the same 3 or fewer people
B. % of stuck invoices whose amount sits within 20% above a threshold boundary
C. % of stuck invoices rerouted at least once
D. % of stuck invoices that were waiting on receiving or PO match, not an approver
```

Here's how I'd read them.

If A is over half, look at why those people are in the chain. If they're there only because of the amount, move the threshold. If they're there because they own the budget, and the invoices waited while they were on the floor or out, name a delegate for each of them before you change anything else. A delegate named in advance in the matrix is the cheapest fix on this list, and it's different from an out-of-office reply someone remembers to set on the 29th.

If B clusters around one boundary, say lots of invoices between $25,000 and $30,000 waiting on the plant manager, move that boundary and leave the rest of the matrix alone.

If C is high, roughly a quarter or more, you have an ownership problem, and no threshold change will touch it. Restructure by cost center, starting with the categories that get rerouted most. For most manufacturers, freight and maintenance are the likely ones to check first.

If D is large, approval routing isn't your bottleneck. Receipts aren't being posted in the system until someone forces them, and the fix belongs with the receiving dock, not with the approval matrix.

[NEED: a Ledgerline customer example with before-and-after numbers, e.g. median days in approval queue during close week before and after moving to cost-center ownership, with permission to name them]

## The invoices you shouldn't chase

Some of the invoices in your export will have arrived with only a day or two left. Chasing approval on those is usually the wrong goal. The close needs the expense in the right period, and it doesn't need an approved invoice to get there. If goods were received and the PO is priced, accrue it and let the invoice go through normal approval in the next period.

Put a hard accrual cutoff on the close calendar, something like business day minus two, and stop chasing approvals on anything that arrives after it. Then look at how many invoices each close crossed that line. If the count keeps growing, the next conversation is with the vendors who bill on the 30th, and the approvers aren't the problem.

[LINK: Ledgerline close-week approval aging export, pre-built with the fields above]
