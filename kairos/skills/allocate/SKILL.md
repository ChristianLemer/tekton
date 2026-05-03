---
name: allocate
description: Plan a period (day or week) for the Kairos workspace, respecting BALANCE and INFLECTIONS. Reads balance + inflections + backlog, integrates constraints first then desires, includes rhythms and worksite slices, flags conflicts, writes ALLOCATION.md. The morning ritual. Use when the user says "what should I do?", "allocate today", "plan the week", "/kairos:allocate".
---

# /kairos:allocate

*"What should I do?"*

The morning ritual (or Monday for the week). Plan a period that respects the balance the human declared and bends sensibly for today's inflections — without over-allocating.

---

## Sequence

1. **Read the layered system.**
   - **BALANCE.md** — effective values per partition (the target)
   - **INFLECTIONS.md** — regular inflections (always on) + one-time inflections (dated)

2. **Ask for current inflections.** "What's special about today/this week? Constraints, desires, things to avoid, things to make room for?" Add to INFLECTIONS.md as one-time inflections.

3. **Traverse the backlog by partition.** Read each partition folder. Identify:
   - Rhythms due (📊 🧹 🔧 🤝)
   - Eligible one-offs (📌 — within their window)
   - Active worksites (🏗️) and their next slice

4. **Integrate constraints first** (non-negotiable: meetings, deadlines, hard inflections).

5. **Apply desires and preferences** to bend the choice among eligible tasks. Desires don't override the balance — they choose *within* it.

6. **Include relevant worksite slices.** A worksite contributes one or two sub-tasks per period — not the whole worksite. Surface the next *meaningful* step, not just the next *atomic* one.

7. **Check the period for over-allocation.** If the plan exceeds realistic capacity, cut. **An unrealistic plan is worse than no plan.**

8. **Flag conflicts.** If an inflection strongly contradicts the balance ("today I want to skip Health entirely"), name it and let the human decide. Don't silently bend the system to please the moment.

9. **Write ALLOCATION.md.** Ephemeral rendering — overwrite or version it as the workspace prefers. Include partition tags so the period is readable cross-cuttingly.

10. **Show the X-Ray** if helpful — does today's allocation match the balance? Numbers inform; visuals make conscious.

---

## Guardrails

- **The plan is disposable. The system is permanent.** Never let attachment to today's plan justify bending the balance.
- **Constraints first, desires second.** A desire that overrides a constraint isn't a desire — it's a constraint mislabelled.
- **Don't over-allocate.** Capacity is a fact, not a target.
- **Flag conflicts; don't silence them.** A bent allocation is fine if the human chose it consciously; not if the guardian smoothed it away.
- **Allocate is not Capture.** If the human surfaces a new task during allocation, capture it (briefly) and then return to allocation — don't merge the modes.

---

## When patterns appear during allocation

If the same task has been deferred for several periods, surface it: "this has slid three weeks — re-decide?" Don't silently re-include. That's a Weekly Review concern leaking into Allocate, but the gentle nudge belongs here.

---

## When the workspace isn't ready

If BALANCE.md or INFLECTIONS.md is missing, do not synthesise. Walk back to SETUP — ask the human to calibrate before allocating. Allocation without a balance is just a to-do list.

---

*Source method: Kairos. See also: kairos-gestures (full catalogue), weekly-review (period closure), capture (entry, not planning).*
