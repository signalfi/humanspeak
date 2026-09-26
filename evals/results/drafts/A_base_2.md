# Why Invoice Approvals Stall in Close Week, and What to Change in Your Routing

By the 26th, the pattern is predictable. The AP queue that looked manageable on the 15th now holds a few hundred invoices. The plant manager is on the floor running a physical count. The maintenance supervisor who owns half the MRO spend hasn't opened the approval email since Tuesday. You're walking the building with a printed list, asking people to click "approve" on things they should have cleared two weeks ago.

Most controllers at mid-sized manufacturers know this week well. When they try to fix it, the first idea is usually to adjust dollar thresholds: raise the limits, cut the number of approval steps, and let more invoices through with fewer signatures. That can help. In most cases, though, it isn't where the time is being lost. Before you redraw your approval matrix, find out where invoices are actually waiting.

## Why the last week is where everything piles up

Month-end congestion comes from a few forces that overlap in manufacturing.

**Approvers work in batches.** Few department heads treat invoice approval as a daily task. They let the queue build and clear it when someone reminds them, and the loudest reminder arrives when finance starts chasing at month-end. The workflow may be continuous, but people use it once a month.

**Your approvers are busiest that same week.** Operations leaders are pushing shipments out the door to hit monthly revenue, preparing for cycle counts, and dealing with whatever broke on the line. Close week lands on their worst week too.

**Receiving lags invoicing.** A supplier invoice can arrive before the goods receipt is posted in the ERP. The three-way match fails, the invoice drops into an exception queue, and it sits until someone in receiving catches up. At month-end, receiving is catching up on everything at once.

**Invoices go to the wrong person.** This cause does the most damage and gets the least attention. A non-PO invoice for a compressor repair goes to the plant manager, who forwards it to maintenance, who says it belongs to facilities, who is on vacation. Each handoff costs a day or more, and none of it shows up as an approval delay. It shows up as an invoice that is technically "in workflow" and belongs to nobody.

## The two levers, and what each one fixes

When controllers sit down to redesign approvals, the choice usually comes down to two options.

**Tightening dollar thresholds** means redrawing the bands that decide who must sign. For example, you might let invoices under $2,500 against an approved PO clear on a successful match with no human approval. Or you might raise the limit at which the CFO or GM gets pulled in. This cuts the number of approvals and shortens chains for large invoices, and you can usually make the change in an afternoon.

**Restructuring ownership by cost center** means every cost center has one named approver and one named delegate. Invoices route by the cost center on the PO or GL coding, not by department, vendor, or whoever handled it last time. The owner is accountable for everything under their limit, and escalation only happens above it.

The two options fix different problems. Threshold changes reduce **volume at the top of the chain**. Cost-center ownership removes **ambiguity in the middle**. If your stalls come from invoices waiting in a VP's inbox, thresholds will help. If they come from invoices bouncing between people who each believe someone else owns them, changing thresholds does nothing, because a misrouted $800 invoice is just as stuck as a misrouted $80,000 one.

## Diagnose before you decide

Pull approval history for your last three closes. Most AP systems, and many ERPs, can export timestamps for each routing step. For every invoice approved in the final five business days, look at three things:

1. **Where the longest wait occurred.** Was it at the final approver level, or earlier?
2. **How many times it was reassigned or forwarded.** Any invoice touched by more than two approvers before sign-off points to an ownership problem.
3. **Whether it sat in an exception queue.** Match failures and missing receipts are a separate issue from approvals, and they need their own fix.

At most manufacturers in the 200–500 employee range, the pattern is clear once it's laid out. A small share of invoices wait on senior sign-off. A much larger share wander: non-PO spend, shared-service costs, repairs, and anything coded to a cost center whose owner changed after a reorg and never got updated in the system.

## The recommendation: fix ownership first, then tune thresholds within it

If you can only take on one project before next quarter, restructure by cost center. It addresses the cause of most month-end stalls, and it makes later threshold changes safer, because every invoice that clears automatically still has a clear owner if a question comes up.

A practical version looks like this:

- **Assign one primary and one delegate to every active cost center**, and review the list whenever someone changes roles. Ownership records go stale faster than anyone expects.
- **Give each owner an explicit approval limit.** Escalation should happen only above that limit, not by default.
- **Route match exceptions to receiving or purchasing, not to the approver.** A missing goods receipt isn't a budget decision, so don't make the budget owner wait on it.
- **Set a default route for non-PO invoices** based on GL account, so nothing lands in a general inbox.
- **Set an internal approval cutoff several days before close**, with automatic escalation to the delegate after a set number of days. Make the delegate's role real, not ceremonial.

Once ownership is clean, look at thresholds. Auto-approving small, fully matched PO invoices is a sensible next step. You'll be making that change on a routing structure you trust.

## One more reminder: close doesn't require every invoice to be approved

You don't need a fully cleared queue to close the books. Received-not-invoiced and invoiced-not-approved balances can be accrued. If your cost-center owners confirm receipt and coding, you can book the liability and let the formal approval follow. Many controllers hold the close open for approvals they could safely accrue. Separating "is this a valid liability" from "has it been formally signed off" can save days on its own.

Chasing approvers through close week doesn't mean your team isn't working hard enough. It means your routing sends invoices to people who don't know they own them, at the moment they're least able to respond. Fix who owns what, and the rest of the matrix gets much simpler.

*Ledgerline helps manufacturing finance teams route invoices by cost center, flag match exceptions to the right team, and see exactly where approvals are waiting before close week arrives.*
