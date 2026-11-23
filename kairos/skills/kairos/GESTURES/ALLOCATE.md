# ALLOCATE

*"What should I do?"*

**Intention:** Plan a period respecting the balance and inflections.

**When:** Start of period (morning for the day, Monday for the week).

**Input:** BALANCE.md, INFLECTIONS.md, backlog.

**Output:** ALLOCATION.md — ephemeral plan for the period. Allocated tasks set to `allocated` in the reservoir. Immature tasks named, not allocated.

**Sequence:**
1. Read BALANCE.md (effective values) and INFLECTIONS.md.
2. Ask for current inflections: desires, preferences, constraints.
3. Traverse the backlog by partition.
4. **Maturity gate** — for each candidate: would one know what to do opening it cold, away from context? If not, it is not allocated: say so, offer to clarify it now (one sentence often does), or send it to Groom.
5. Integrate constraints (non-negotiable) first.
6. Desires and preferences bend the choice among eligible tasks.
7. Include rhythms and relevant worksite slices — rhythms below the threshold as a period review, never as one line per occurrence.
8. If an inflection strongly contradicts the balance, flag it — the human decides.
9. Write ALLOCATION.md, and set the allocated tasks to `allocated` in the reservoir.

**Guardrails:** The allocation is an ephemeral rendering, not a promise. The plan is disposable — the system is permanent. Do not over-allocate: an unrealistic plan is worse than no plan. **An immature task allocated falsifies the signal** — it slides, and the slide reads as poor execution when it was poor clarity. Never drop a task from the plan silently: the gate opens through clarification, not insistence. Regenerating the plan rewrites the `allocated` state; it does not repair a document.

**Source method:** Kairos.
