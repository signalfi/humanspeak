# The approval routing you built at 150 people

Somewhere in your ERP, or in a spreadsheet your AP lead keeps open on a second monitor, there's a table that decides who approves which invoice. It has rows like "MRO supplies, Plant 2, over $2,500: plant manager" and "Freight, all sites: logistics coordinator." Most of those rows were written when the company was smaller. Back then the plant manager sat down the hall from AP, and one person really did know what every carrier invoice should say.

For three weeks of the month, that table holds up. In the last week it doesn't, and the way it fails is specific enough to diagnose.

Three things land on the same five business days. Vendors bill at month-end, so invoice volume bunches up [NEED: share of monthly invoice volume received in the last five business days, from Ledgerline customer data or a cited public benchmark]. Receiving catches up on goods receipts it let slide. And the people named in your routing table are doing their own month-end work: cycle counts, production variance, scrap reports. That means plant managers, maintenance leads and the ops director. The approvers holding the most invoices have the least time for them on exactly the days you need them.

That's why we'd skip the most common first response, a tighter reminder cadence. A plant manager who gets a third email on the 29th already knows the invoices are there. What they lack is forty free minutes that afternoon, and more email won't give them that.

[NEED: quote from a controller or AP manager at a 200–500 person manufacturer describing what month-end approval chasing looks like in practice, with name, title, company and permission to publish]

The other common response is to accrue whatever isn't approved and close anyway. That's a legitimate close practice, and sometimes it's the right call. We'd still treat it as a patch. Every accrual has to be reversed and matched against the real invoice next month. If the same approvers are late every month, you rebuild the same accruals every month. [NEED: benchmark for days-to-close at mid-sized manufacturers, e.g. from APQC, with source link]

## Find out which stall you have

Month-end stalls come in a few distinct kinds, and each calls for a different routing change. Guess wrong and you can end up raising every approval threshold, then explaining that decision at the next audit.

Pull the last three month-ends from your AP system. You want every invoice that was still unapproved when the final five business days began, with these columns:

```
invoice_id
vendor
amount
po_backed              (Y/N)
match_status           (matched / price exception / qty exception / no receipt)
gl_category
current_approver
date_entered_queue
date_approved
approved_after_close   (Y/N, against your close cutoff)
```

Then pivot three ways: count of late invoices by current_approver, by po_backed, and by match_status. [LINK: Ledgerline month-end approval audit template, spreadsheet with the pivots prebuilt]

Here's how we'd read the result.

**If more than half the late invoices sit with three or fewer approvers,** you have an ownership problem, and changing thresholds won't touch it. Give each of those people a named month-end delegate. Make the delegation switch on automatically on a fixed day, say five business days before close. Don't leave it for the approver to set up while they're buried. We'd also ask whether some of their GL categories should move permanently. A plant manager approving janitorial supplies is usually a leftover from the 150-person table.

**If the late invoices spread thinly across many approvers, and most are PO-backed and matched,** you have a threshold problem. An invoice that matches its PO and its receipt within tolerance was effectively approved once already, when the PO was cut. We disagree with the usual advice to raise approval thresholds across the board. Raise them only for matched, PO-backed invoices, and leave non-PO spend where it is. [NEED: typical share of PO-matched invoices at mid-sized manufacturers, from Ledgerline data or a cited source, if available]

**If most of the late invoices are non-PO** (utilities, freight, contract labor, services), you have a pre-approval problem. These invoices arrive with nothing for the approver to check them against, so they sit while someone works out whether the charge is right. Once a quarter, the budget owner can set standing approvals for recurring vendors within a budgeted range. That takes most of these out of the month-end queue. Freight tends to be the hardest case. If it dominates your list, part of the fix may belong with whoever negotiates carrier rates, because clearer rate agreements make invoices checkable.

**If the pattern is mixed,** start with the ownership fix. It's the cheapest one to reverse if you read the data wrong.

[NEED: second finance-leader quote, ideally from someone who changed their approval routing and can say what happened to close timing, with name, title, company and permission]

## When the invoice is waiting on the dock

One result won't respond to any of those changes. Some late invoices may show "no receipt" in match_status. Those are waiting on someone at receiving to post the goods receipt. If your routing only sends an invoice to approval after the three-way match clears, the approver has never seen it. Reassigning approvers does nothing for these.

That fix sits outside AP. Agree with the receiving supervisor that during the last week of the month, receipts get posted the same day the truck is unloaded. Then ask what they'd need to make that happen on their busiest days: a second scanner, a cutoff time, a person borrowed from another shift. If "no receipt" is the biggest bucket in your pivot, have your first month-end conversation with the dock, not the plant manager.

---

I didn't write the quotes or statistics you asked for, because I have no real source for them. Made-up quotes from finance leaders and invented numbers would damage the post's credibility with controllers much more than generic wording would. I've marked each spot with `[NEED: …]` saying what should go there. You'll need to fill these before publishing:

- **Quotes:** two from real controllers or AP managers, ideally Ledgerline customers who have given permission.
- **Statistics:** figures from your own customer data or a public benchmark like APQC, with a link to the source.
- **Link:** the `[LINK: …]` placeholder assumes you'll publish the audit spreadsheet as a download. If you won't, the column list in the post works without it.
