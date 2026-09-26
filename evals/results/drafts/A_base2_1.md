# Why Invoice Approvals Stall in the Last Week of the Month (and What to Change in Your Routing)

Every controller at a mid-sized manufacturer knows the pattern. Around the 24th, the AP queue starts to swell. By the 27th you're sending the second round of "just need your sign-off" emails to a plant manager who is on the floor trying to get a customer order out the door. By the 30th you're deciding which invoices to accrue because they won't be approved in time, and the close slips a day or two into the next month.

It's easy to blame the approvers. But the stall is usually built into how approvals are routed, and routing is something finance controls. When teams decide to fix it, they tend to argue about two options: tighten the dollar thresholds that determine who has to approve what, or restructure approval ownership around cost centers. They solve different problems, so it helps to understand where the delay comes from before choosing.

## Where the Last-Week Stall Actually Comes From

**Invoice volume bunches at month end.** Many suppliers bill on a monthly cycle, so freight carriers, MRO distributors, utilities, staffing agencies, and contract maintenance vendors all send invoices in the same window. Your approvers get most of their month's approval requests in the same week their own work peaks.

**Senior approvers are the busiest people that week.** Month end is when the plant manager is pushing shipments to hit revenue, the operations director is reviewing output, and the VP is preparing for the monthly business review. If your routing sends everything above a modest dollar amount to these people, the invoices wait on the least available approvers at the least convenient time.

**Nobody is sure whose invoice it is.** This cause gets the least attention. A maintenance invoice for work on a shared compressor could belong to production, facilities, or engineering. A freight bill covering both inbound raw materials and outbound finished goods touches several budgets. When an invoice's owner is unclear, it goes to whoever's name is on the PO, or to an AP clerk's best guess. The recipient often assumes it isn't theirs and leaves it alone.

**Exceptions are mixed in with approvals.** An invoice with a price variance against the PO, or one waiting on a receiving record, isn't really an approval problem. It's a matching problem. When those sit in the same queue as clean invoices, approvers open them, can't resolve them, and move on. The whole queue then looks stuck.

## Option One: Tighten the Dollar Thresholds

Threshold changes appeal because they're quick. You edit the approval matrix and the change takes effect immediately.

The trouble is that thresholds exist to control risk, and they don't do much for throughput. Tightening them usually means requiring senior sign-off at lower amounts, which sends more invoices to the people who are hardest to reach in the last week. You get more control and a slower close.

Going the other way, raising the limits so that more invoices can be approved at lower levels or skip approval, does reduce volume at the top. It is worth doing for one category in particular: **PO-backed invoices that pass a three-way match within tolerance.** If the purchase was approved when the PO was issued, and receiving confirms the goods arrived at the agreed price, a second human approval mostly repeats work already done. Many manufacturers find that a large share of their invoice volume falls into this category.

Still, thresholds can't solve the ownership problem. An invoice worth $3,000 with no clear owner will stall whether your limit is $2,500 or $10,000.

## Option Two: Restructure Ownership by Cost Center

Routing by cost center means every invoice goes to the person who owns the budget it hits, instead of to whoever sits at a particular level on the approval matrix. Each cost center gets a named owner and a named delegate. Dollar thresholds still apply, but only as an escalation layer: above a certain amount, the cost center owner's approval is followed by a second approval from a more senior person.

This addresses the causes above more directly:

- Approval load spreads across more people, so a few senior managers aren't carrying the month-end volume alone.
- The person approving is the person who knows whether the work was done, which makes approvals faster and more accurate.
- A required delegate means an approver's vacation or a busy week on the floor doesn't stop the invoice.
- Shared costs get handled on purpose. You decide once, in advance, that compressor maintenance belongs to facilities, instead of having AP decide under pressure on the 28th.

The cost is setup work. You need a clean cost center structure, agreement from department heads that they own their budgets' invoices, and a coding step that assigns each invoice to a cost center before it routes. For non-PO invoices, that coding is where the real effort lies.

## Which Should You Do?

For most 200–500 person manufacturers, restructure ownership by cost center first, and change thresholds in one targeted place.

Look at your own data before committing. Pull approval timestamps from your last three closes and find where invoices sat longest:

- If aging clusters around three or four senior approvers, you have a load problem. Raising thresholds for matched PO invoices will give quick relief.
- If aging is spread across many people and many invoices were reassigned or forwarded before approval, you have an ownership problem. Threshold changes won't fix that.
- If a large share of stalled invoices had a match exception, you have a process problem. Neither routing change will help until exceptions go to a separate queue handled by purchasing or AP.

Most controllers who run this analysis find all three at once, with ownership as the largest.

## Practical Changes for the Next Close

1. **Auto-approve clean three-way matches** within a defined price and quantity tolerance, with no additional sign-off.
2. **Assign every cost center an owner and a mandatory delegate,** and route non-PO invoices by cost center.
3. **Write down ownership rules for shared costs** such as freight, utilities, and plant-wide maintenance.
4. **Send match exceptions to a separate queue** owned by purchasing or AP, not to budget approvers.
5. **Set an approval cutoff three business days before close,** and escalate automatically to the delegate after 48 hours without action.
6. **Keep dollar thresholds as escalation steps** above the cost center owner, not as the main routing logic.

Ledgerline supports cost center routing with delegates, tolerance-based auto-approval for matched invoices, and separate exception queues, so these changes can be configured without rebuilding your approval matrix by hand. But the most important step doesn't depend on any software: decide who owns each dollar before the month ends, not during the last week.
