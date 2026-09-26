# Why Invoice Approvals Stall in the Last Week of the Month, and the Routing Change That Fixes It

It's the 27th. You have a close calendar that says AP cuts off in two days, and your approval queue shows more open invoices than you'd like. You've already emailed the maintenance supervisor at Plant 2 twice. The VP of Operations is at a supplier visit. Someone in purchasing replied "not sure this one's mine" and forwarded it to someone who hasn't opened it.

Most controllers at 200–500 person manufacturers know this week well. The usual fix is to chase harder or tweak the approval matrix. Before changing anything, though, it's worth being precise about why the queue backs up, because the two most common fixes address different problems.

## The stall has three causes, and only one is volume

**Invoices arrive in waves.** Freight carriers, contract labor agencies, utilities, and many raw material suppliers bill on or near month-end. You can nudge vendors toward earlier billing, but you mostly can't control this.

**Approvers work in batches.** A plant manager treats approvals as something to clear when prompted, and the prompt is usually finance chasing at month-end. So the first time many invoices get looked at is the same week everything else is due. The queue isn't slow all month. It sits untouched and then compresses.

**Ownership is ambiguous.** This is the one that does the most damage and gets the least attention. MRO supplies used across two lines, a freight bill covering shipments from three plants, a software subscription that engineering and quality both use, a repair invoice for equipment nobody's sure is capital or expense. These invoices don't sit because an approver is slow. They sit because the person holding them isn't sure they have the authority to approve, so they forward, reply-all, or wait for someone else to act.

The first cause is mostly outside your control. The second and third are routing problems, and they point to different fixes.

## Diagnose it from your own approval log

Before you pick a fix, pull the approval history for your last three closes and look only at invoices approved in the final five business days. For each one, note two things: how long it sat with its final approver, and how many times it was reassigned or forwarded before approval.

You'll usually see one of two patterns.

- **Long waits, few handoffs.** Invoices went to the right person and sat there. That's an attention or capacity problem, often concentrated in one or two senior approvers.
- **Many handoffs, short individual waits.** Invoices bounced between people before landing with someone willing to approve. That's an ownership problem.

Also count how many stalled invoices crossed into a higher dollar tier and picked up an additional required approver. That tells you how much of the delay your thresholds are creating.

## Option one: change the dollar thresholds

Threshold changes come in two directions, and it's worth being clear which one you mean.

*Tightening* means lowering the dollar level at which a senior approver has to sign, so more invoices need a VP or CFO. This is usually a control response, after an audit comment or a spending surprise. For close speed, it works against you: it adds invoices to the busiest, most-traveled approvers' queues, and it does so during the week they're least available. If you have a genuine control gap, tighten. Don't expect it to speed up the close.

*Loosening at the low end* helps more. Letting PO-backed invoices that match receipt and price within tolerance, under a set dollar amount, clear without manual approval takes routine volume out of the queue entirely.

The limitation of any threshold change is that it alters *how many* signatures an invoice needs, not *whose*. If your log shows invoices bouncing between people, adjusting dollar levels won't change that. The freight bill still doesn't know which plant it belongs to.

## Option two: restructure approval ownership by cost center

Here, every cost center gets a named owner and a named delegate. Invoices route based on the cost center captured at intake, from the PO or from AP's coding, rather than based on who requested the purchase or which vendor sent it.

Three design choices make this work in a manufacturing environment:

1. **Assign shared costs to one owner.** Decide that the Plant 2 maintenance supervisor owns MRO for Plant 2, full stop. If the cost later gets split across lines or plants, do that as a GL allocation after approval, not by routing the invoice through everyone who shares the cost.
2. **Make delegation automatic.** When an owner is out of office or on the floor for a line changeover, invoices go to the delegate without anyone having to notice and reassign.
3. **Run required approvals in parallel, not in sequence,** where your controls allow it, so a senior sign-off doesn't wait on a department sign-off that's already clearly going to happen.

This isn't free. You need a current cost center map, AP has to code accurately at intake, and someone has to keep owners and delegates updated when people change roles. On the control side, dollar-based authority limits don't go away. They sit as a second layer on top of ownership, which is what your auditors will want to see.

## Which to do first

For most mid-sized manufacturers, the approval log shows more bouncing than sitting, and the invoices that bounce are exactly the shared, cross-plant, cross-department costs that stack up at month-end. In that case, restructure ownership first. It removes the "is this mine?" delay, which no amount of chasing fixes, and it gives you clean routing to tune thresholds against later.

If your log instead shows invoices going straight to the right person and waiting there, concentrated with one or two executives, start with thresholds. Loosen at the low end for matched PO invoices so those approvers see fewer, more meaningful items. Tighten only if you have a specific control reason, and accept that it will cost you some close time.

## What to change before your next close

- Pull the last three closes' approval history and sort stalled invoices into "sat" versus "bounced."
- List the ten spend categories that bounced most, usually freight, MRO, contract labor, and shared software, and name one owner for each.
- Set a delegate for every approver who spends significant time on the plant floor or traveling.
- Move cost splitting out of the approval chain and into post-approval allocation.
- Add a weekly approval window mid-month so month-end isn't the first time invoices get seen, and set an automatic escalation to the delegate after 48 hours.

None of this requires new headcount. It requires deciding, before the 27th, who owns each invoice.

*Ledgerline routes invoices by cost center, handles delegation and escalation automatically, and keeps dollar-based authority limits in place as a control layer, so you can make these changes in configuration rather than in email.*
