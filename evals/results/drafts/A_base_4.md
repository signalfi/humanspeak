# Why Invoice Approvals Stall in the Last Week of the Month, and the Routing Change That Fixes It

It's the 27th. Your close calendar says AP cutoff is the 29th. The approval queue holds a few hundred invoices, and a big share of them are waiting on a plant manager who is walking the floor for a shipment push, a maintenance supervisor who hasn't opened email since Tuesday, and a VP of operations who approves everything over $10,000 and is traveling.

You'll spend the next three days sending reminders, walking to people's desks, and deciding which invoices to accrue. Next month it will happen again.

Most controllers see two ways out. One is to adjust the dollar thresholds that decide who has to approve what. The other is to restructure approval ownership around cost centers. Both can help, but they fix different problems. Picking the wrong one means a quarter of rework and a close that stays the same.

## Why the last week is different

Approvals don't stall at month-end because people get lazier. They stall because several pressures land at once.

**Invoice volume bunches up.** Many vendors bill at period end. Receiving catches up on paperwork. Buyers close out POs. Your queue may double in the same week it has the least time to clear.

**Your approvers have their own close.** In manufacturing, the people who approve spend are often the same people chasing month-end shipments, running cycle counts, and reporting production numbers. An invoice approval is the easiest thing for them to push to tomorrow.

**Routing points to people, not roles.** When an invoice is assigned to "Dave" instead of "Plant 2 maintenance approver," it waits for Dave. If Dave is on the floor, on vacation, or no longer with the company, nothing moves.

**Serial chains multiply the waiting.** Every sequential step adds a queue. If an invoice goes from buyer to department head to plant manager to finance, the delay at each stop adds up. In close week, the stops are slow.

**Some spend belongs to no one.** Freight, utilities, MRO supplies, and shared services often cover several departments. Invoices for them get routed to a default approver who doesn't feel responsible for them, or they bounce between people who each think someone else should decide.

**Split invoices wait on the slowest approver.** A multi-line invoice charged to three cost centers can't post until the last of three people acts.

## Run this diagnostic before you choose

Don't pick a fix based on which approvers annoy you most. Look at the data from your last three closes.

1. Pull every invoice that was still pending approval five business days before AP cutoff.
2. Tag each one with its dollar amount, its cost center (or centers), its current approver, and whether it was PO-backed.
3. Sort two ways: once by dollar band, once by approver or cost center.

Then look for the pattern.

If the stuck invoices **cluster in high-dollar bands and wait on a handful of senior approvers**, you have a threshold problem. Too much is going up the ladder.

If the stuck invoices are **spread across dollar bands but concentrated in particular cost centers, in unowned spend categories, or with specific people**, you have an ownership problem. No threshold change will fix it, because the amount isn't what's holding these invoices up.

At most 200–500 person manufacturers, the second pattern is the common one. It's still worth checking your own numbers, because the fix should match what you find.

## Why threshold changes often disappoint

Raising thresholds so fewer invoices reach senior leaders feels like the quick win. It's one configuration change and one conversation with the CFO. Sometimes it's the right move.

But thresholds only move volume between tiers. If the $2,000 MRO invoice was stuck because it was routed to someone who didn't recognize the purchase, a higher VP limit does nothing for it. Tightening thresholds in the other direction, so more invoices need higher approval for control reasons, usually makes close week worse.

Thresholds answer the question "how much scrutiny does this amount deserve?" Stalls usually come from a different question: "whose decision is this, and are they available?"

## How to restructure ownership by cost center

If your diagnostic points to ownership, here is what the restructure looks like in practice.

**Give every cost center a named primary and a named delegate.** Route invoices to the role, and let the system find whoever is in it. When the primary hasn't acted within a set window, the delegate gets the invoice automatically, with no email to you.

**Assign owners to orphan spend.** Freight, utilities, facility services, and shared MRO each need a single accountable approver, even if the cost is later allocated across departments. Allocation is an accounting step. Approval is a decision, and one person should own it.

**Stop re-approving what was already approved.** If an invoice matches a PO and receipt within your tolerance, the spending decision happened when the PO was issued. Let clean three-way matches post without a second approval, and send only the exceptions to people. This is often the largest single reduction in queue volume.

**Route split invoices in parallel.** Each cost center owner approves their own lines at the same time, instead of waiting for the previous person.

**Shorten escalation clocks during close week.** A 72-hour window may be fine mid-month. For the last five business days, move to 24 hours before an invoice escalates to the delegate.

**Tell approvers the deadline in the request.** "Needed by the 28th for month-end close" gets faster action than a generic reminder.

## Where thresholds still belong

Cost center ownership doesn't replace dollar limits. It puts them in the right place. Once each invoice goes to the person who understands the spend, you add thresholds on top. For example, a cost center owner approves up to a set amount, and anything above it also goes to the plant manager or VP.

Build ownership first, then set the limits. If you do it the other way around, you end up with carefully tuned thresholds routing invoices to the wrong people.

## What changes at close

When routing follows ownership, close week changes. You spend less time chasing individuals and more time reviewing the few invoices that are actually exceptions. Accruals become a choice you make about specific items, not a catch-all for whatever didn't get approved.

Ledgerline builds this kind of routing for mid-sized manufacturers: role-based approvers, automatic delegation, parallel line-level approval, and touchless posting for matched invoices. Whatever tool you use, start with the diagnostic. Your last three closes will show you which fix you need.
