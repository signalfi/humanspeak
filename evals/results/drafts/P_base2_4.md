# Why Invoice Approvals Stall in the Last Week of the Month, and How to Reroute Them

It's the 26th. Your AP team has cleared intake, coded what it can, and pushed everything into approval. Then the queue stops moving. One hundred forty invoices sit with a plant manager who is on the floor trying to hit the month's shipment number. Another thirty wait on a purchasing lead who's out until Monday. By the 30th, you're booking accruals on invoices that were technically ready a week ago, and your close slips into day six or seven again.

If you're a controller at a mid-sized manufacturer, this pattern is familiar. It usually isn't caused by lazy approvers or a slow AP team. It's a routing design problem, and routing problems can be fixed.

[STAT NEEDED: Benchmark for average days-to-close or invoice approval cycle time at mid-market companies. Suggested sources: APQC Open Standards Benchmarking, Ardent Partners' State of ePayables. Cite the report name and year.]

## Why the last week is different

**Your approvers have a second job, and it peaks at month-end.** In a manufacturing business, the people approving invoices are rarely finance people. They're plant managers, maintenance supervisors, and purchasing leads. The last week of the month is when production, shipping, and inventory pressure all peak. Approving a $1,200 MRO invoice loses every time to a line that's down.

**Routing follows the org chart instead of risk.** Most approval workflows were built by asking "who owns this cost center?" and then applying that path to every invoice. The result is that a $300 PO-backed invoice for gloves travels the same chain as a $90,000 invoice for a capital repair. Approvers get buried in low-risk volume and stop looking closely at anything.

**Receiving lags create false exceptions.** This one is specific to manufacturing and it's often the biggest driver. Material arrives, gets used, and nobody posts the goods receipt in the ERP until later. The invoice fails three-way match, drops into an exception queue, and waits for someone to chase down the dock. At month-end, when receiving is slammed, the lag gets worse just when you can least afford it.

**Vendors bunch their invoices.** Many suppliers bill at month-end, so your intake spikes during the same week your approvers have the least time.

**There's no escalation path.** When an approver is out, the invoice waits. Few mid-sized companies have working delegation rules, and fewer have automatic escalation timers.

[QUOTE NEEDED: A controller or VP Finance at a manufacturer describing the month-end approval pileup in their own words. Ideally from a Ledgerline customer with written sign-off, or from an interview conducted for this piece.]

## What to change in your approval routing

### 1. Stop routing matched PO invoices to humans

If an invoice matches the PO and the receipt within tolerance, what is the approver actually approving? The purchase decision was already made when the PO was issued. Set a tolerance, such as 2% or a fixed dollar amount per line, and let matched invoices go straight to payment scheduling. For many manufacturers, this removes a large share of approval volume. Approvers are left with only the invoices that need judgment.

### 2. Tier routing by dollar amount and risk

For invoices that do need approval, build tiers. Here's one example structure:

- **Under $2,500, non-PO, recurring vendor:** one approver, the budget owner.
- **$2,500 to $25,000:** budget owner plus department head.
- **Over $25,000, new vendor, or bank detail change:** add controller review.

The exact thresholds matter less than having them. The goal is for the scrutiny an invoice receives to match its risk, rather than every invoice getting the same amount of attention.

### 3. Put an SLA on receiving, not just on AP

If receipt posting lags, your three-way match exceptions will keep piling up no matter how good your approval workflow is. Work with operations to set a posting standard, such as receipts entered within 24 hours of delivery. Then report on it. When plant leadership sees that unposted receipts are why their vendors are getting paid late, behavior changes quickly.

### 4. Add escalation timers and real delegation

Every approval step should have a clock. If an invoice sits for 48 hours, it reminds the approver. At 72 hours, it escalates to their manager or a designated backup. Require approvers to set delegates before PTO. This is basic, but most stalled invoices are simply waiting on someone who isn't there.

### 5. Move your approval cutoff earlier and accrue the rest

Set a hard approval deadline, such as two or three business days before month-end. Anything approved by then is booked from the invoice. Anything still pending is accrued from the PO or receipt. This separates your close timeline from your slowest approver. It also gives AP a predictable window instead of a scramble.

### 6. Give approvers context, not just a PDF

An approver who opens an invoice and sees the PO, the receipt, the budget remaining, and the last three invoices from that vendor can decide in seconds. An approver who sees only a scanned PDF has to go looking, and at month-end they'll put it off. Better context reduces approval time more than reminder emails do.

[QUOTE NEEDED: A finance leader on the impact of a specific routing change, such as auto-approving matched invoices or adding escalation timers. A concrete before-and-after number is ideal.]

## Measure the right things

You can't fix what you don't track. Three metrics tell you most of what you need:

- **Approval cycle time by approver.** Usually a handful of people account for most of the delay.
- **Exception rate by cause.** Separate receiving lags, price variances, and missing POs, because each has a different fix.
- **Percentage of invoices touched by a human.** This should fall over time.

[STAT NEEDED: Figure on cost or cycle-time difference between best-in-class and average AP organizations, or on the share of invoice exceptions caused by PO/receipt mismatches. Cite source and year.]

## Where software fits

You can make most of these changes with a spreadsheet and a firm memo, and you should start there. Automation makes them durable. Ledgerline applies tolerance-based matching, tiered routing, and escalation timers automatically. It also shows approvers the PO, receipt, and budget context alongside the invoice, so decisions take seconds instead of days.

The companies that close fastest haven't made their approvers work harder in the last week of the month. They've made sure most invoices never need an approver at all, and that the ones that do can't get stuck.

If your close keeps slipping because of approvals, [talk to Ledgerline](#) about auditing your current routing. We'll show you where invoices are waiting and why.
