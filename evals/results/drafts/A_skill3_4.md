# Who owns the freight invoice on day 28?

Picture a $6,400 freight invoice. The carrier moved finished goods out of two plants, so purchasing coded the PO to a shared logistics cost center. That cost center's listed budget owner was a plant manager who moved to another site in the spring. The invoice arrives on the 22nd and goes to him. He forwards it to the other plant's manager, since most of the loads were hers. She sees it's over the $5,000 line and sends it up to the operations director. The director sends it back to AP asking which plant it belongs to. It gets approved on the 3rd of the next month, two days after the close was supposed to be finished.

No one in that chain was careless, and the threshold did its job by sending a $6,400 invoice to a director. The invoice sat for eleven days because four people each had a reasonable case that it belonged to someone else.

We build approval routing at Ledgerline, and this is the distinction we'd want a controller to make before changing any rules. When month-end approvals drag, the usual choice is between tightening the dollar thresholds and restructuring who owns approval by cost center. The two changes solve different problems. If you pick the wrong one, you add a rule and the close date stays where it was.

The last week of the month is hard for reasons neither lever touches. Vendors bill at month-end, so volume peaks just as your approvers get busy. Plant managers and department heads are running cycle counts and writing variance explanations for you. Approving invoices turns into something they do in a batch when they have a free hour, and any invoice they aren't sure about drops to the bottom of that batch. That's why the stalls you chase are rarely the big, obvious invoices. They're the ambiguous ones.

## Pull the last three closes before changing anything

We'd look at the data before touching a single threshold. For every invoice that was approved after the 20th, or was still pending at close, over your last three month-ends, pull:

```
invoice_id | vendor | amount | cost_center | shared_cost_center (Y/N)
threshold_tier_hit | first_approver | final_approver
approvers_in_chain (count) | forwards_or_reassignments (count)
date_routed | date_approved | days_waiting
waiting_on_receipt_or_match_exception (Y/N)
```

If you run AP in Ledgerline, the approval history export has the forwarding chain for each invoice [NEED: confirm export name and field labels]. In other systems, check the audit log. The approval report often shows only the final approver, and the final approver is the least useful field here. A spreadsheet version with the pivots already built is at [LINK: Ledgerline approval-aging template].

Build two pivots. One shows average days waiting by final approver. The other counts forwards by cost center. Between them they'll tell you which lever to pull.

## Reading the result

**If most late invoices were forwarded at least once, and the forwards cluster in a few cost centers, restructure ownership.** These are usually shared cost centers, ones touched by a recent reorg, or capital project codes that outlived the project. Tightening thresholds here would add an approval step to invoices that are already stuck on the question of whose they are.

We'd give each cost center exactly one named approver and one named delegate. For shared cost centers, we'd pick a single owner and let accounting handle the allocation after approval. Splitting approval across plants sounds fairer, but it sets up the exact handoff that stalled the freight invoice. The one-owner rule has a cost: that owner will sometimes approve spend that mostly belongs to someone else, and they need to be comfortable with that. We think it's worth it. Ownership also needs a trigger for review. Tie it to your HR system or your org-change checklist so a transfer or departure prompts a reassignment, and don't wait for an annual cleanup.

**If late invoices went straight to the right person with no forwards and just sat there, look at the tier.** If they're piling up with your top-tier approvers and most are small compared with that tier's limit, your thresholds are pushing too much upward. The fix is to raise the lower-tier limits so plant managers can clear more on their own. That loosens thresholds, which is the opposite of the change you were considering. It deserves an honest conversation with whoever owns internal controls. Our view is that a $7,000 invoice for recurring maintenance on a service contract that's already approved doesn't need a VP's eyes.

**If the invoices waiting on top-tier approvers are genuinely large, neither change helps.** Those approvals belong on a calendar. Put large recurring invoices in front of the approver before the 25th, get estimates from vendors so you can accrue, or book a standing 30-minute approval slot with the two or three people who hold the big numbers during close week.

**Tighten thresholds when the reason is control.** Good reasons include an audit finding, a spend category that has grown faster than anyone expected, or a vendor-fraud scare. We think this should be presented internally as a control decision, with the slower approvals it brings stated up front. It shouldn't be sold as a way to close faster, because it won't do that. If you're going to tighten, do it mid-quarter so the new routing has a couple of normal month-ends to settle in before year-end.

## When the approval queue isn't the problem

Check the last column of the extract before you change anything. Some invoices show as "pending approval" when the approver is really waiting on receiving to confirm the goods arrived, or on someone to resolve a price or quantity mismatch on a three-way match. If a meaningful share of your late invoices have that flag set, thresholds and ownership are both beside the point. The hold-up is at the dock or in purchasing, and the next conversation is with the receiving supervisor about how quickly receipts get entered during the last week of the month.
