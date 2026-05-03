---
name: weekly-review
description: Close the Kairos period (typically a week). Compares ALLOCATION against JOURNAL, re-decides each undone item (slide / postpone / let go), surfaces patterns, proposes inflections or calibration if a pattern is detected. The only Kairos gesture *expected* at a specific moment. Use when the user says "let's close the week", "weekly review", "close the period", "/kairos:weekly-review".
---

# /kairos:weekly-review

*"Let's close the week."*

The period closure gesture. The only Kairos gesture *expected* at a specific moment — typically end of week, sometimes end of month or end of project phase. Transforms the mirror (Review) into action.

---

## Sequence

1. **Compare plan to reality.** Read ALLOCATION.md (the plan) and JOURNAL.md (what actually happened over the period). For each item in the allocation:
   - Done? → already in the journal, no action.
   - Not done? → flag for re-decision.

2. **Re-decide each undone item with the human.** For each, three options:
   - **Slide** — consciously defer to the next period. The task stays committed; the deadline shifts.
   - **Postpone** — return to backlog without a deadline. The task is alive but not scheduled.
   - **Let go** — abandon. Name the *reason*. Optionally journal the let-go for future Introspect.

   Re-decide each item explicitly. **Do not bulk-defer.** The friction is the point — every undone item costs a decision, and that decision teaches the system.

3. **Look for patterns.** While re-deciding, the guardian watches:
   - **Repeated deferrals** — same task slid 3+ times → likely needs re-scoping, breaking up, or letting go
   - **Systematically avoided partition** — the partition is consistently under-allocated or under-completed → calibration question, energy question, or hidden constraint
   - **Worksites that never progress** — sub-tasks pile up without movement → re-scope or let go
   - **Broken rhythms** — disrupted by category, signalling something specific (tracking → reality is masked; hygiene → degradation; maintenance → fragility; attention → erosion)

4. **Propose action if pattern detected.** Possibilities:
   - **One-time inflection** for next period ("this week, deliberately spend more on Health to compensate")
   - **Regular inflection** if the pattern is structural ("never schedule X after 8pm")
   - **Calibration** if the situation has shifted lastingly (life event, role change)
   - **Conversation** if the pattern needs understanding before action (→ Introspect)

   The human validates or rejects. The guardian proposes; the human decides.

5. **Clean ALLOCATION.md.** The previous period's allocation is closed. The next allocation is a fresh gesture (Allocate), not an extension of this one.

6. **Confirm and close.** State explicitly: "Period closed. {N} items completed, {M} slid, {P} postponed, {Q} let go. Patterns: {summary}."

---

## Guardrails

- **The weekly review does not judge — it observes and prompts re-decision.** If the period went badly, name what happened factually; don't moralise.
- **The journal is unchanged.** Append-only. The weekly review reads it; it does not edit it.
- **Do not confuse with Review.** Review observes the gap (target vs reality) without cleaning. Weekly Review re-decides and cleans.
- **Do not confuse with Groom.** Groom walks the *whole backlog* for mutations and naming, less frequently. Weekly Review walks *the allocation*, every period.
- **Do not let inflections silently accumulate.** If a one-time inflection has been "one-time" for three weeks, it's a regular inflection — promote it (or let it go).

---

## When patterns are heavy

If the weekly review surfaces a pattern that needs deeper understanding before action, switch posture: this is an **Introspect** invitation. Don't propose action prematurely. Some patterns want to be looked at before they're solved.

If the weekly review surfaces a pattern that's structurally outdated, switch to **Calibrate** — the balance was right for a previous version of the human; it isn't anymore.

---

## When the workspace isn't ready

If ALLOCATION.md doesn't exist (the period was never planned), the weekly review collapses to a journal review with the human. Note this — and ask if they want to plan the next period before closing this one.

If JOURNAL.md is empty (nothing was journaled despite work happening), surface this — the system has lost its memory of the period. Discuss whether Complete is being skipped, and if so, what would help.

---

*Source method: Kairos. See also: kairos-gestures (full catalogue), allocate (the next gesture after closure), kairos (architecture).*
