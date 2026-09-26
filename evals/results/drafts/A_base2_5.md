# Why Invoice Approvals Stall in the Last Week of the Month, and the Routing Change That Fixes It

It's the 27th. Close is scheduled for the fourth business day of next month. Your AP queue holds 140 invoices waiting on approval, and about 30 of them have been sitting for more than a week. You send a reminder to the plant manager, who is on the floor trying to get a shipment out. You message the maintenance supervisor, who says he doesn't recognize the vendor. The VP of operations has a $38,000 freight invoice he has been meaning to look at. None of these people are being careless. They are busy, and the invoices in front of them are not really theirs to judge.

Most controllers at mid-sized manufacturers know this week well. When they try to fix it, they usually reach for one of two levers. The first is to change the dollar thresholds that decide who must approve what. The second is to restructure approval ownership so invoices route by cost center instead of by amount. Both are reasonable. They solve different problems, and picking the wrong one can make the next close worse.

## Why the stall happens at month-end specifically

Four pressures converge in the last week.

**Invoice volume spikes.** Many vendors bill on a monthly cycle, and freight carriers, MRO suppliers, utilities, and contract labor agencies tend to send their invoices in the final days of the month. Your queue grows while your approvers' attention shrinks.

**Your approvers have their own month-end.** Plant managers are chasing shipment targets. Operations leaders are reviewing production numbers. Purchasing is closing out POs. Approving invoices is the task they can put off without an immediate consequence, so they put it off.

**Exceptions bounce.** An invoice that doesn't match its PO or receiving record, because of a short shipment, a price change, or a missing receipt, often goes back and forth between AP, purchasing, and receiving. Each handoff costs a day, and at month-end a day matters.

**Invoices land with people who can't evaluate them.** This one gets the least attention and does the most damage. When an approver opens an invoice and doesn't know what it's for, they don't reject it. They leave it alone, forward it, or ask someone else. The invoice sits.

The last pressure is the one your routing design controls, and it is where the threshold-versus-ownership decision comes in.

## What changing thresholds actually does

Dollar thresholds decide how many signatures an invoice needs and whose they are. Tightening them, meaning lower limits before an invoice escalates to a senior approver, adds control. Loosening them cuts the number of invoices that reach senior people.

Either way, thresholds change *how many* invoices reach an approver. They don't change *whether that approver understands the spend*. A threshold rule sends that $38,000 freight invoice to the VP of operations because of its size. The person who actually knows whether the load was expedited, whether the fuel surcharge is right, and whether it belongs to this month is the logistics coordinator. The VP will eventually ask the logistics coordinator, and that round trip is your stall.

Tightening thresholds in response to a stalled close usually makes this worse, because more invoices move up to the people with the least time and the least context.

## What cost-center ownership does

Routing by cost center means every invoice goes first to the person who owns the budget it hits: the maintenance manager for plant maintenance, the quality manager for lab supplies and calibration services, the logistics lead for inbound freight. Those people know the vendors, remember the orders, and have a reason to care, because the spend shows up in their numbers.

In most cases this is the right structural fix, because it attacks the recognition problem directly. An approver who knows the spend can clear an invoice in seconds. One who doesn't might take days.

Cost-center routing doesn't require you to give up dollar controls. Keep a single ceiling, such as a set amount above which the controller or CFO adds a second signature. Just stop letting the dollar amount decide who the *first* approver is.

## How to tell which problem you have

Before you redesign anything, pull approval timestamps for the last three month-ends and look at where invoices waited.

- If the waits cluster at one or two senior approvers across many cost centers, you have a threshold problem. Too much is escalating. Raise the limit or add a delegate at that tier.
- If the waits are spread across many approvers, and you see a lot of forwarding, reassignment, or "what is this?" comments, you have an ownership problem. Restructure by cost center.
- If the waits cluster on invoices with match exceptions, neither lever is the main issue. Fix the receiving and PO discipline first.

At most 200 to 500 person manufacturers, the second pattern dominates, even though the first one is what people complain about.

## Making the cost-center restructure work

A few design choices decide whether the new routing actually speeds up close.

**Name one owner and one backup per cost center.** The backup approves automatically after a set period, such as 48 hours, or whenever the owner is marked out. Month-end is when people take long weekends and plant visits, and without a backup, one absence stalls the queue.

**Let matched PO invoices skip human approval.** If an invoice matches its PO and receipt within a tolerance you set, the approval already happened when the PO was issued. Approving it again adds no control, only delay. That keeps approvers' attention on non-PO spend and exceptions, which is where their judgment is actually needed.

**Assign shared costs to one primary owner.** Utilities, facility services, and freight serving several plants shouldn't route to three approvers at once. Send them to one owner and split the cost with an allocation rule after approval.

**Hold approvers to a mid-month rhythm.** Publish an approval cutoff a few days before period end, and send weekly digests so invoices get cleared as they arrive instead of in a final-week pile.

**Review ownership quarterly.** Cost centers get reorganized, people change roles, and new vendors show up. Stale routing puts invoices back in front of people who don't recognize them.

## The decision

If your controllers are chasing senior executives who are buried under escalated invoices, adjust your thresholds. If they are chasing a wide range of approvers who don't know what they're looking at, and that is the usual case, restructure ownership by cost center and keep one dollar ceiling as your control. The last week of the month gets shorter when every invoice goes to someone who can say yes on sight.

Ledgerline's approval routing is built around cost-center ownership, automated backups, and match-based auto-approval, so finance teams can make this change without rebuilding their chart of accounts. If your close calendar keeps slipping in the final week, start by pulling your approval wait data. It will show you which lever to pull.
