# The approver column in your AP aging report

Most AP teams sort open invoices by vendor or by days past due. Try a different sort on the last Monday of the month. Sort the approval queue by current approver, and add a column for how many days each invoice has been waiting with that person. That one sort tells you something finance teams usually argue about on instinct. Either too many invoices are climbing to too few people, or nobody clearly owns them.

At a manufacturer with a few hundred people, both happen, and both get worse in the same week. Plant managers and maintenance leads approve a lot of spend, and at month-end they're doing cycle counts and pushing orders out the door. Vendors send invoices around the 25th because their own books are closing. Receipts for materials that arrived mid-month get posted late. When they do, a batch of invoices that were held on three-way match all release at once. An approver who handles a few invoices on a normal day suddenly has a stack. The ones they don't recognize wait the longest.

We build approval routing at Ledgerline, so we have opinions about both fixes. We'd rather you look at the queue before you pick one.

## Two ways to reroute

**Thresholds.** After a bad close, "tighten the thresholds" usually means sending more invoices up to a VP or the CFO so there's less exposure. We'd push back on that as a reflex. The people you add are the busiest people in the building that week, and you've just given them more work. The threshold change that helps the close goes the other direction, and only for low-risk invoices. Take a PO-backed invoice that was received and matched within tolerance under a limit you choose. It can approve on the match, or with a single approver. Senior sign-off stays in place for non-PO spend above a separate line.

Thresholds have real advantages. You can change them in a week: one policy memo and one configuration change, with no remapping. Auditors can read a limit table easily. They don't help with an invoice that nobody claims. A $900 freight bill that nobody recognizes will sit just as long under any dollar limit.

**Cost-center ownership.** Every cost center gets one named owner, one named delegate and a dollar limit. An invoice goes to whoever owns the code it's charged to, whatever the amount up to that limit. Above the limit, one more approver is added. This works best on the invoices that bounce around: maintenance and MRO supplies shared between lines, utilities split across plants, outside freight, and software subscriptions that three departments use and nobody budgeted for.

The cost comes up front. Coding has to be right when the invoice is entered. If AP clerks are guessing cost centers, you've built a faster route to the wrong person. Mapping owners takes real time, and the map goes stale every time someone leaves or a line gets reorganized. We think cost-center ownership doesn't work without the delegate. Without one, the stall just moves to whoever takes vacation in the last week of the month.

## Reading the sort

Take the invoices that have been with their current approver for more than three days on that Monday. Then look at who's holding them and why.

If more than half of them sit with three or fewer people, and those people hold them because of a dollar tier rather than because they own the spend, fix thresholds. Your routing is sending ordinary invoices to executives.

If the late invoices are spread thinly across many approvers, a lot of them have been forwarded or reassigned at least once, or they're parked in an AP inbox or with a default approver, fix ownership. Nobody on your approval matrix owns those invoices.

Sometimes the late invoices sit with a small group who are the right approvers because they do own the cost center. Say it's the maintenance manager at your second plant. Neither fix helps there. That person needs a delegate who can act during the last week, or a mid-month cutoff for approving routine recurring invoices before the rush.

If the picture is mixed, change thresholds first. It's cheaper and you can reverse it. Run the sort again at the next close and see what's left.

We'd run the sort for two closes before changing anything. One month can be skewed by a single vacation or one large capital purchase.

Here are the columns to pull. Most AP systems can export them, and a few you'll build in the spreadsheet:

- Invoice number, vendor, amount
- PO-backed or non-PO
- Cost center as coded
- Current approver
- Why that person is the approver: dollar tier, cost-center owner, forwarded, or default. If your system doesn't store a routing reason, work it out from your approval matrix.
- Date the invoice entered the current approver's queue
- Number of times reassigned
- Days in current queue as of the sort date

[LINK: Ledgerline approval-stall worksheet, spreadsheet template with these columns and the decision rules built in]

[NEED: one or two sentences on how Ledgerline handles this, such as whether it records routing reason and reassignment count, and whether it supports cost-center owners with delegates. Confirm against the product before publishing.]

## When the queue isn't the problem

Sometimes the sort comes back short. The approval queue is manageable, but the close still slips. Then look at invoices that haven't reached an approver yet. Invoices held on match exceptions don't appear in anyone's approval queue. They wait for receiving to post a receipt, or for purchasing to fix a price variance against the PO. Changing approval routing won't touch them. Their owner is on the receiving dock or in purchasing, not in finance.

So before you change thresholds or redraw cost centers, count the invoices in match exception on that last Monday. Compare that with the count at mid-month. If the number more than doubles in the last week, your stall starts with when receipts get posted. The first conversation to have is with whoever runs receiving at each plant.
