# The Last-Week Pileup: Why Invoice Approvals Stall at Month-End, and How to Reroute Them

Every controller knows the pattern. For three weeks, invoices move through approvals at a reasonable pace. Then the calendar hits the 24th or 25th, and the queue swells. Plant managers are buried in production reports, the purchasing lead is chasing a late shipment, and a stack of vendor invoices sits in someone's inbox waiting for a click that won't come until you walk over and ask for it.

By the time those invoices are approved, you're three days into close, booking accruals you'd rather not book and explaining variances you'd rather not explain.

This isn't a people problem. It's a routing problem. Most mid-sized manufacturers route approvals in a way that collides with the month-end workload of the approvers themselves.

[STAT NEEDED: Share of monthly invoice volume that arrives or is approved in the final week of the month. Suggested sources: Ardent Partners "State of ePayables," APQC accounts payable benchmarks, or Ledgerline's anonymized customer data.]

## Why the last week is different

**Your approvers have their own close.** In a 200–500 person manufacturer, invoice approvers are rarely finance people. They're plant managers, maintenance supervisors, and purchasing leads. Month-end is when they reconcile production numbers, finalize inventory counts, and answer questions from the controller about their cost centers. Approving a $4,000 MRO invoice becomes the lowest priority task on the most crowded day of their month.

**Receiving lags behind invoicing.** A vendor emails an invoice the day it ships. The goods arrive, but the receiving clerk doesn't post the receipt until the dock clears. Without a goods receipt, the three-way match fails and the invoice drops into an exceptions queue. Early in the month those exceptions trickle in. At month-end, when shipments peak and the dock is busiest, they arrive in bulk.

**Sequential routing multiplies delays.** Many approval workflows require a department head, then a plant manager, then a VP for anything above a modest threshold. Each step adds a day or two of waiting. Three sequential approvers, each taking two days at month-end, turn a one-click decision into a week-long delay.

**Thresholds were set years ago.** The $1,000 threshold that made sense when the company had 80 employees now sends hundreds of routine invoices to senior approvers who have no information that would change the decision.

**Nobody owns the backup.** When an approver is on vacation, at a supplier audit, or out sick, invoices wait. Delegation rules either don't exist or were configured once and never updated.

[QUOTE NEEDED: A controller or CFO at a mid-sized manufacturer describing their own month-end approval backlog. The ideal quote names a specific cause, such as plant managers on the floor or receiving lag. Source from a customer interview with written approval to publish.]

## What to change in your routing

The fix isn't to nag approvers harder. It's to route fewer invoices to people, and to route the rest so they don't collide with month-end.

### 1. Let clean matches approve themselves

If a PO-backed invoice matches the purchase order and the goods receipt within tolerance, a human approval adds cost without adding control. The approval already happened when the PO was issued. Configure touchless approval for matched invoices and set tolerances that reflect reality, such as ±2% or a fixed dollar amount for freight and minor price variance. This single change typically removes the largest block of routine invoices from approvers' queues.

[STAT NEEDED: Touchless or straight-through processing rates, comparing best-in-class and average AP teams. Ardent Partners and APQC both publish versions of this benchmark. Verify the current year's figure.]

### 2. Rebuild thresholds around risk

Pull twelve months of invoice data and look at where approvers actually rejected or changed invoices. You'll likely find that rejections cluster in a few categories, such as non-PO services, new vendors, and capital items. Rejections are rare for recurring supplies. Set approval requirements by category and vendor risk, not only by dollar amount. A recurring $8,000 resin invoice from a ten-year supplier needs less scrutiny than a $2,500 invoice from a consultant you onboarded last week.

### 3. Go parallel where you can

If an invoice needs both an operational approval and a budget approval, send it to both people at once instead of in sequence. Parallel routing cuts elapsed time roughly in proportion to the number of steps it replaces, and it costs you no control.

### 4. Make delegation automatic

Require every approver to have a named backup, and set escalation timers. For example, if an invoice sits unapproved for 48 hours, it routes to the backup. In the final five business days of the month, shorten the timer to 24 hours. Review delegation assignments quarterly, and whenever someone changes roles.

### 5. Fix receiving before you fix approvals

Many "approval" delays are really receiving delays. Work with operations to set a same-day posting standard for goods receipts, and give receiving clerks a simple way to post from the dock, such as a tablet or scanner, instead of batching at shift end. Track receipt-posting lag as a metric alongside invoice aging.

[QUOTE NEEDED: A finance or operations leader on the link between receiving discipline and AP close speed. A Ledgerline customer or an industry practitioner would work. Confirm attribution and permission.]

### 6. Move the approver to the invoice

Plant managers aren't at their desks. If approving an invoice means logging into the ERP from an office PC, it won't happen during a busy week. Mobile approval, with the PO, receipt, and invoice image on one screen, turns a trip to the office into a 20-second task on the floor.

### 7. Shift the cadence, not just the deadline

Set a mid-month approval checkpoint. Around the 15th, AP reviews everything aging past five days and clears it before month-end pressure builds. Publish a close calendar with a firm approval cutoff, such as three business days before month-end, so approvers know the date in advance.

## Measure what's actually stalling

You can't fix what you don't see. Track these three numbers monthly:

- **Approval cycle time by approver.** You'll often find that two or three people account for most of the delay.
- **Exception rate by cause.** Separate price mismatch, quantity mismatch, and missing receipt, because each has a different owner.
- **Invoices approved after period cutoff.** This is the number that drives your accruals and your close timeline.

Share approver-level cycle times with department heads. Most approvers aren't ignoring invoices on purpose, and seeing their own numbers tends to change their behavior quickly.

## The payoff

Closing faster is only part of the benefit. When approvals flow evenly through the month, your accruals shrink, your vendor relationships improve because payments are on time and discounts are captured, and your AP team spends the last week of the month on analysis instead of on chasing people.

[STAT NEEDED: A benchmark linking AP automation or approval routing to days-to-close or cost per invoice. Cite the source and year.]

Ledgerline was built for exactly this problem at mid-sized manufacturers. It provides three-way matching with configurable tolerances, category- and risk-based routing, parallel approvals, automatic delegation and escalation, and mobile approval designed for people who spend their day on the plant floor. If your last week of the month looks like the one described above, we'd be glad to show you what your approval flow could look like.

---

*Editor's note: I've left bracketed placeholders instead of inventing quotes and statistics. Made-up quotes attributed to finance leaders, or unsourced numbers, would undermine credibility with controllers and could create legal exposure for Ledgerline. Each placeholder suggests a likely source. Customer interviews and Ledgerline's own anonymized data are the fastest options if you need to publish today.*
