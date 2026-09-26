# Why Invoice Approvals Stall in Close Week, and the Routing Change That Fixes It

It's the 27th. The close calendar says AP cutoff is the 29th, and you have a stack of invoices sitting in someone's approval queue. The plant manager is in the middle of a cycle count. The maintenance supervisor forwarded three invoices to someone who forwarded them back. The VP of operations has eleven items waiting because they're over $25,000, and he's traveling to a customer site. You spend the afternoon sending reminder emails and walking the floor with a printout.

Most controllers at mid-sized manufacturers know this week well. The usual fix is to adjust the dollar thresholds that decide who approves what. Before you do that, find out whether thresholds are actually causing the stall. Often the cause is ownership.

## Why approvals pile up at month end

Several pressures converge in the last week of the month, and they compound.

**Invoice volume spikes.** Many vendors bill at month end. Freight carriers, MRO suppliers, contract labor agencies, and utilities often send invoices in batches. Receiving paperwork from the dock also tends to catch up late in the month, so invoices that were waiting on a receipt suddenly become approvable at the same time.

**Your approvers have their own close work.** The people approving invoices in a manufacturing company are rarely finance people. They're plant managers, maintenance leads, purchasing managers, and engineering heads. In close week they're doing inventory counts, reconciling scrap, reviewing WIP, and hitting shipment targets. Approving a $3,400 invoice for hydraulic fittings isn't their priority.

**Senior approvers become a single point of failure.** A tiered threshold structure routes every large invoice to a small number of executives. Those executives are the least available people in the building at month end.

**Ownership is unclear for shared costs.** Who approves the forklift lease that serves two plants? The janitorial contract? The ERP consultant who worked with both finance and operations? When an invoice doesn't clearly belong to one person, it bounces. Every forward adds a day.

**Exceptions go to people who can't resolve them.** An invoice with a price variance against the PO often lands with an approver who has no idea why the price changed. Purchasing knows, but purchasing isn't in the route.

## Two levers, two different problems

When approvals stall, controllers generally reach for one of two changes.

**Tightening dollar thresholds** means redrawing the tiers: changing the amounts at which an invoice escalates to a department head, a VP, or the CFO. You might raise the lower tier so supervisors can approve more on their own, or reduce the number of tiers so fewer invoices need two signatures. Threshold changes control *how much volume reaches each level*.

**Restructuring approval ownership by cost center** means that each cost center has a named owner who approves its invoices, with a named backup, whatever the approver's title. Ownership changes control *whether an invoice reaches the right person the first time*.

These fix different problems. Threshold changes help when the queue is concentrated at the top. Ownership changes help when invoices are wandering.

## Diagnose before you change anything

Pull the approval history for your last three closes. For every invoice that was still unapproved three days before cutoff, record:

- Who held it when the delay occurred
- The invoice amount
- How many times it was forwarded or reassigned
- Whether it had a PO match exception

Then look at where the delay clusters.

If most stuck invoices sat with two or three senior approvers, were above your upper thresholds, and were never forwarded, you have a **threshold problem**. Your tiers are sending too much to too few people.

If stuck invoices were spread across many approvers, were forwarded more than once, or sat with someone who replied "not mine," you have an **ownership problem**. Changing thresholds will just move the confusion to a different level of the org chart.

In our experience working with manufacturers in the 200–500 employee range, the second pattern is more common, and it's the one that threshold adjustments don't touch.

## The recommendation: restructure by cost center, then tune thresholds on top

For most mid-sized manufacturers, the better primary change is to make cost center ownership the foundation of routing and treat dollar thresholds as a secondary control layered on top. In practice:

**1. Assign every cost center a primary approver and a named delegate.** The delegate should be someone who is realistically available at month end. During close week, set automatic escalation to the delegate if an invoice sits for 48 hours.

**2. Set default splits for shared costs.** Decide once, in writing, how recurring shared invoices are allocated and who owns the approval. The forklift lease goes 60/40 between Plant 1 and Plant 2, and Plant 1's manager approves. Nobody has to negotiate it in the last week of the month.

**3. Take matched PO invoices out of human approval.** If an invoice matches the PO and receipt within tolerance, the approval already happened when the PO was issued. Requiring a second signature adds delay without adding control. For many manufacturers, this step alone removes a large share of close-week volume.

**4. Route exceptions to the person who can resolve them.** Price variances go to purchasing. Quantity variances go to receiving. The cost center owner only sees the invoice once the exception is cleared.

**5. Only then, revisit thresholds.** With routine and matched invoices handled, you can see which large, non-PO invoices really need executive review. That list is usually short enough to handle with one scheduled review meeting instead of a week of chasing.

Cost center routing depends on accurate GL coding when the invoice is captured. If your AP team routinely guesses at coding, fix that first, or the new routing will send invoices confidently to the wrong owner.

## Separate "closing the books" from "approving the invoice"

One more change takes pressure off the whole week. You don't need every invoice approved to close. If goods were received or services were performed in the period, you can accrue for them based on receipts and known commitments, then reverse the accrual when the invoice is approved. Many finance teams chase approvals because they treat approval as a prerequisite for close. A clear accrual policy for unapproved invoices past cutoff turns the approval deadline into an AP deadline, not a close deadline.

## Where software fits

Ledgerline automates the mechanics described above: three-way matching that posts clean invoices without manual approval, cost center routing with delegates and time-based escalation, exception routing to purchasing or receiving, and a close-week view showing where every invoice is sitting. Software doesn't decide who owns which cost center, though. That decision is yours, and it's worth making before the next close.

Start with the diagnosis. Three months of approval history will tell you which problem you actually have.
