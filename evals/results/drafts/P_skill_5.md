# Approval routes are drawn for the middle of the month

Every approval route in an AP system is a guess about who will be at a desk, with time to spare, when an invoice lands. Someone drew those routes during the ERP implementation, probably on a quiet Tuesday, and they encode what that Tuesday looked like. The plant manager answers email between shift meetings. The VP of operations signs anything over $25,000 within a day or two.

For about three weeks a month, that guess holds. In the last week it fails, and at nearly every manufacturer we work with at Ledgerline it fails the same way. Invoice volume climbs because suppliers bill at their own month-end, and receiving clerks who batch goods receipts push a pile through at once. [NEED: statistic on the share of monthly invoice volume that arrives in the final five business days, from Ledgerline customer data or a citable benchmark source.] At the same time, approvers have less time. The plant manager is running cycle counts. The ops director is writing the production variance explanation you asked him for. The buyer who owns price-variance exceptions is chasing next month's steel.

So the queue grows at the moment the people who clear it are busiest with your close. Nobody is being careless. The route was never drawn for that week.

[NEED: quote from a controller or CFO at a 200–500 person manufacturer describing month-end approvals from their side. Name, title, company, and permission to publish.]

We think most finance teams read this as a discipline problem and answer it with reminder emails. Reminders help a little. They can't change the math of a three-step serial chain: at one day per step, it takes three days at best, and the last week of the month doesn't have many three-day windows left.

## Find out whose desk it is

Before you touch any routing, look at your last three closes. You want every invoice approved after your AP cutoff, or accrued because it wasn't approved in time, and for each one, the approver who held it longest. Most AP systems and ERPs can export approval history with timestamps. If yours can't, the audit trail on the invoice record usually has it.

```
Late-approval pull (last 3 closes)
Filter:  invoices received in the last 7 calendar days of the month
         AND final approval after [your cutoff date/time]
Columns: invoice #, vendor, amount, PO-matched (Y/N),
         match exception (Y/N + type), each approver in chain,
         hours each approver held it
Pivot 1: sum of amount and count of invoices, by longest-holding approver
Pivot 2: count of invoices, by exception type
```

[LINK: Ledgerline month-end routing worksheet with this pull pre-built for common ERPs]

The pivots tell you which problem you have, and each one has a different fix.

If more than half the late dollars sat with three or fewer people, you have an ownership problem. Those people won't be less busy next month-end, so give each of them a scheduled delegate for the last five business days, set up ahead of every close. Out-of-office rules don't cover this. They fire when someone is away, and your plant manager is at his desk, buried in count sheets.

If the late invoices are spread thinly across many approvers, look at your thresholds, and at what gets routed for approval in the first place. Plenty of manufacturers still send PO-matched MRO invoices under a few thousand dollars to a department head, even though the PO was already approved and the goods already received. Those invoices can auto-approve inside a price and quantity tolerance you set, so people only see the exceptions.

If pivot 2 shows that most late invoices were match exceptions, your bottleneck is receiving. An invoice can't clear three-way match until a goods receipt exists, and a dock that posts receipts in Friday batches will produce a month-end pile-up that no routing change can fix. Take that one to the plant manager.

[NEED: statistic from Ledgerline customer data or a public source, such as median approval cycle time for serial versus parallel routes, or the share of late month-end invoices that are match exceptions.]

## Routing changes worth making before the next close

A few changes pay off whatever the pivots say.

Run approvals in parallel when the approvers aren't checking each other's work. A cost-center owner confirming the spend and a project manager confirming the charge code don't need to go one after the other. Running them side by side turns a three-day chain into a one-day chain.

Shorten escalation timers for the last week only. A 72-hour timer is fine on the 10th. On the 27th it means the invoice escalates after your cutoff. Cut it to 24 hours, and escalate sideways to a named backup instead of upward to someone even busier.

Review any dollar threshold nobody has touched since implementation. Input costs have risen a lot in five years, so a $10,000 threshold set in 2020 catches far more routine invoices now than it was meant to.

[NEED: quote from a finance leader about a specific routing change they made and what it did to close timing. Ideally a Ledgerline customer, attributed and approved.]

The habit we'd push back on hardest is chasing every straggler to approval before close. For a PO-matched invoice with a posted receipt, you already know the liability. Accrue it from the PO and receipt, close the books, and let the approval finish next week. Some controllers resist this because it means reversing accruals, and some auditors will want the policy in writing. Those costs are real, and we think they're worth paying. Otherwise you hold the close for a signature that confirms what the receipt already told you.

None of this helps when the invoice itself arrives late. If a supplier emails PDFs to a buyer's personal inbox, or bills on the 3rd for goods shipped on the 29th, nothing in your approval setup will fix it. If your pull shows a cluster of those, the first call goes to the vendor, and purchasing should make it.
