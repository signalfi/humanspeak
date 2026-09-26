# The $6,200 pump repair nobody owns

Picture an invoice for $6,200 from a hydraulics shop that rebuilt a pump on a stamping press. It's coded to Maintenance – Shared, a cost center that both the stamping plant and the assembly plant charge to. The stamping plant manager can approve up to $5,000, so the workflow sends the invoice up to the VP of Operations. In the last week of the month, the VP is in production reviews and splitting time between two sites. The assembly plant manager gets a notification and assumes stamping is handling it. Stamping's manager sees it leave his queue and assumes the VP has it.

Nobody in that chain was careless, because each of them did what the routing told them to do. The routing had two questions to answer: how big is this invoice, and whose is it? It answered the second one badly, and the result is an invoice sitting in limbo on the 28th with your close date on the 3rd.

When the chasing gets bad enough that you decide to fix it, you're usually choosing between two changes. You can re-cut the dollar thresholds that decide who has to sign, or you can restructure who owns each cost center. We build AP automation for mid-sized manufacturers at Ledgerline, and we have views on both. Still, your last three closes will tell you more about which one you need than we can.

## Why the last week is worse

Invoices don't arrive evenly across the month. Many vendors bill at month-end, and maintenance and freight invoices trail the work they cover. Receiving tends to catch up on paperwork right before inventory counts. So volume climbs in the same week your approvers are least available. Plant managers are on counts, operations leaders are in reviews, and the executives at the top of your threshold tiers are working on forecasts. A routing weakness that costs you a day in the second week costs more in the fourth, because every stuck invoice lands on someone who is already behind.

That's why the choice matters. Each option removes a different kind of friction.

Re-cutting thresholds works when your stalls sit with a small number of senior people and the invoices only reached them because of their amount. If the stamping manager's limit went from $5,000 to $10,000, the pump repair would never touch the VP's desk. You could also add a rule that routes PO-matched invoices within price and quantity tolerance to the requester's manager whatever the amount, which takes a lot of routine volume out of the executive tiers. This is a configuration change that you can make in an afternoon and reverse after one close if it goes wrong. The cost is a conversation with whoever owns your delegation-of-authority policy, and maybe your auditors.

We'd push back on one version of "tightening." After an audit finding, the reflex is often to lower limits so more invoices need senior sign-off. That puts your busiest people into the approval path during your busiest week. If the finding calls for more control, we'd get it from an after-the-fact review of a sample of approved invoices rather than from extra signatures ahead of the close.

Restructuring ownership works when the waiting is spread thin across many approvers and the invoices were bouncing around: rejected, recoded, reassigned, or charged to a shared cost center where two people each think the other one owns it. The fix is that every cost center gets exactly one named owner and one named delegate with the same authority. Shared cost centers either get split or get assigned to a single person. This is the harder change. It means negotiating with plant managers, it may touch your chart of accounts, and the GL team has to agree to it. We think it holds up longer than a threshold change does, but we wouldn't spend the political capital unless the data points there.

## Reading your last three closes

Pull every invoice that was still unapproved five business days before each of your last three close dates. For each one, fill in a row:

```
Invoice # | Amount | Cost center | Shared CC? (Y/N) | Invoice date |
Received in AP | Final approval date | Approver it waited on longest |
Days with that approver | Escalated by amount? (Y/N) | Rerouted or recoded? (Y/N)
```

[LINK: downloadable version of this tally sheet]
[NEED: name of the Ledgerline report or export that pre-fills these columns, if one exists]

Then read it with these rules:

If more than half of the total waiting days sit with three or fewer people, and most of those invoices escalated because of their amount, re-cut the thresholds. Start by counting the invoices that came in within about 25% above a tier boundary. Those are the cheapest ones to move down a tier, and the count tells you where to set the new limit.

If the waiting is spread across many approvers, and a large share of the stalled invoices were rerouted, recoded, or charged to a shared cost center, restructure ownership. Start with the shared cost centers, since that's where the "I thought you had it" problem lives.

If both patterns show up, we'd change thresholds first because you can reverse it within a single close. Leave the ownership work for the following quarter. If you change both at once, you won't know which one shortened your close, and you'll have a harder time defending either one the next time someone wants to tighten things again.

## When neither will help

Before you change anything, look at the gap between the invoice date and the date the invoice reached AP. Suppose the pump repair was dated the 9th and landed in your queue on the 27th because it sat in a maintenance supervisor's inbox for two and a half weeks. No threshold or ownership change fixes that. The approval was never the slow part. The fix is upstream: where vendors send their invoices, and whether receiving and maintenance forward them the day they arrive.

So take the ten invoices from your last close with the largest gap between invoice date and received date, and find out where each one was during that time. If most of them were sitting with someone outside AP, fix intake before you start renegotiating anyone's approval limits.
