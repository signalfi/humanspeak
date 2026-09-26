# Why Invoice Approvals Stall in the Last Week of the Month, and How to Reroute Them

Every controller knows the pattern. For three weeks, invoices move through approval at a reasonable pace. Then the calendar hits the 24th, and the queue fills up. Plant managers are buried in production reports, the VP of operations is traveling to a supplier, and a stack of invoices sits in someone's inbox waiting for a signature that won't come until the 2nd. Your team books accruals it didn't want to book, the close slips a day or two, and next month it happens again.

Most of this is caused by how approvals are routed, not by individual approvers being slow. The routing rules at many 200 to 500 person manufacturers were written when the company was smaller, then patched as it grew. They send too many invoices to too few people, in the wrong order, at the worst possible time.

[STAT NEEDED: A benchmark on invoice processing cycle time or month-end approval backlog, e.g., from APQC, IOFM, or Ardent Partners. Verify the figure and cite the source and year before publishing.]

## Why the last week is different

**Approvers batch their work.** A plant manager who approves invoices "when there's time" usually finds that time at the end of the month, when finance starts sending reminders. This happens to be when their own operational reporting peaks. The two deadlines collide, and approvals lose.

**Receiving lags behind invoicing.** In manufacturing, three-way match only works if goods receipts are posted promptly. On a busy dock, receipts often get entered in bulk. An invoice that arrives before its receipt is logged falls into exceptions. Those exceptions pile up precisely when the dock is busiest, which is often the end of the month.

**Serial chains multiply delay.** Many approval workflows route an invoice to a department head, then a plant manager, then a VP, one after another. If each person takes two days, a three-step chain takes six. That is tolerable on the 5th. On the 26th, it means the invoice misses the close.

**Thresholds haven't kept pace.** Approval limits set years ago, such as $5,000 requiring VP sign-off, now capture a large share of routine spend. Raw material prices, freight, and maintenance contracts have all risen, but the thresholds haven't. Senior approvers end up reviewing invoices that pose little risk.

**Nobody is covering for absent approvers.** When an approver is out, invoices wait. Delegation rules exist in most systems but are rarely configured. Even when they are, they are rarely kept current.

[QUOTE NEEDED: A controller or CFO at a mid-sized manufacturer describing the month-end approval crunch in their own words. Include name, title, company, and confirmed permission to publish.]

## What to change in your routing

You don't need to rebuild your approval policy from scratch. Most of the improvement comes from a handful of targeted changes.

### 1. Approve by exception, not by default

If an invoice matches its PO and receipt within tolerance, ask whether it needs human approval at all. The purchase was authorized when the PO was approved, and the receipt confirms delivery. Requiring a second sign-off on a clean match mostly adds delay. Auto-approving matched invoices within a defined price and quantity tolerance, for example 2% or $250, whichever is lower, frees approvers to focus on the invoices that actually need judgment.

### 2. Run approvals in parallel where you can

When an invoice needs both a budget owner and a technical reviewer, route to both at the same time instead of one after the other. Keep serial routing only where the order genuinely matters, such as when a second approver's decision depends on the first. This change alone can cut days off multi-step approvals.

### 3. Reset thresholds against current spend

Pull twelve months of invoice data and look at where your approval tiers fall. If a large share of invoices are hitting your highest tier, the tiers are probably miscalibrated. Set limits so senior approvers see the invoices that carry real financial or compliance risk, and so routine replenishment stays with the people closest to the spend. Review with your auditors to make sure segregation of duties remains intact.

### 4. Make delegation automatic and mandatory

Require every approver to have a named backup, and make delegation kick in automatically after a set period, such as 48 hours without action, or whenever an out-of-office flag is set. Don't rely on approvers remembering to hand off before a trip.

### 5. Escalate on a timer, not on a phone call

Build escalation into the workflow. An invoice untouched for three business days should notify the approver's manager automatically. That replaces the end-of-month scramble of AP clerks chasing signatures by email with a steady, impersonal nudge that runs all month.

### 6. Move your soft cutoff earlier

Set an internal approval deadline a few business days before the formal close, and publish it to approvers every month. Pair it with a daily digest instead of individual notifications, so approvers can clear their queue in one sitting.

### 7. Fix receiving at the source

Work with operations to get goods receipts posted the same day goods arrive. Mobile receiving at the dock, or a daily receiving cutoff, reduces the number of invoices that fall into match exceptions at month-end. This is often the single biggest lever for manufacturers, and it is outside AP's direct control, which is why it's worth raising with your COO.

[QUOTE NEEDED: A finance leader describing the results of a specific routing change, such as parallel approvals, auto-approval of matched invoices, or a receiving-discipline push. Include name, title, company, and confirmed permission.]

## Measure what's actually stuck

You can't fix what you don't see. Track invoice aging by approver and by routing step, not just in total. The pattern usually becomes clear within a month or two. A small number of approvers or steps typically account for most of the delay. Share those numbers with the people involved. Most approvers don't know how long invoices sit with them, and visibility alone often changes behavior.

[STAT NEEDED: A figure on the share of invoices requiring exception handling, or the cost difference between touchless and manually handled invoices. Verify and cite the source.]

It's also worth tracking how much of your month-end accrual is driven by invoices that were received but not approved. That number is a direct measure of the cost of approval delay. It is useful when making the case for routing changes to your CFO.

## Where automation fits

Everything above can be done with policy changes and a well-configured ERP. In practice, though, many mid-sized manufacturers find that their ERP's native workflow can't easily handle parallel routing, tolerance-based auto-approval, timed escalation, and mobile approvals together. That's the gap AP automation platforms like Ledgerline are built to fill. They sit alongside your ERP, apply the routing rules you define, and give you real-time visibility into where every invoice is waiting.

The tool matters less than the design, however. Start by mapping how invoices actually move through your approval chain today. Most controllers who do this find that a handful of rules written years ago account for most of the delay, and changing those rules is what shortens the close.
