---
name: kairos-gestures
description: The nine Kairos gestures — Capture, Groom, Allocate, Calibrate, Complete, Let-go, Review, Introspect, Weekly Review. Each follows the Praxis anatomy (intention, when, input, output, sequence, guardrails, source). Includes the breathing pattern (which gestures fire morning, daily, end-of-week, on-change, periodically) and the human-initiated vs guardian-initiated split. Use when operating any specific gesture, deciding which gesture applies to a situation, or onboarding to the Kairos guardian role.
---

# Kairos Gestures

*Nine gestures, one guardian.*

Each gesture follows the Praxis anatomy: **name / intention / when / input / output / sequence / guardrails / source method**. The full per-file specs live in the deployed corpus at `Poiesis .. KAIROS .. GESTURES`. This skill is the operational reference — read when you need to *do* a gesture or decide which one fits.

---

## The catalogue

| Gesture                         | Trigger phrase                | One-line                                        |
| ------------------------------- | ----------------------------- | ----------------------------------------------- |
| [Capture](#capture)             | "I have a task."              | Add to backlog without friction                 |
| [Groom](#groom)                 | "Let's do a grooming."        | Walk the backlog to produce clarity             |
| [Allocate](#allocate)           | "What should I do?"           | Plan a period respecting balance + inflections  |
| [Calibrate](#calibrate)         | "Something has changed."      | Adjust the balance to context                   |
| [Complete](#complete)           | "It's done."                  | Signal what is done and trace it                |
| [Let go](#let-go)               | "This is no longer relevant." | Consciously abandon a task                      |
| [Review](#review)               | "How is my balance?"          | Measure the gap between target and reality      |
| [Introspect](#introspect)       | "Help me understand."         | Understand the patterns behind lingering tasks  |
| [Weekly Review](#weekly-review) | "Let's close the week."       | Close the period, re-decide each undone item    |

---

## Breathing

| Moment                 | Gestures                                          |
| ---------------------- | ------------------------------------------------- |
| Morning                | **Allocate**                                      |
| During the day         | **Capture**, **Complete**                         |
| End of week            | **Weekly Review**                                 |
| When something changes | **Calibrate**                                     |
| Periodically           | **Review**, **Groom**, **Introspect**, **Let go** |

The system breathes at the human's rhythm, not the other way around.

---

## Human-initiated vs guardian-initiated — the split

**Human-initiated, on schedule** — these have dedicated slash-commands:
- `/kairos:capture` — friction-free input, the whole point
- `/kairos:allocate` — the morning ritual
- `/kairos:weekly-review` — the period closure

**Guardian-initiated, on signal** — surface these when context warrants; do not wait:
- **Calibrate** when something *changed* (new constraint, life shift, broken rhythm pattern)
- **Let go** when something *no longer fits* (lingering with no progress, drift in relevance)
- **Introspect** when something *lingers* (repeated deferral, avoided partition)
- **Groom** periodically when the backlog ages
- **Review** periodically when the balance feels off
- **Complete** the moment the human signals "done"

Slash commands are for gestures the human initiates on schedule. The catalogue is for gestures the guardian initiates on signal. **Cross the line both ways carefully** — pushing too much breaks the human's rhythm; surfacing too little turns the guardian into a passive recorder.

---

## The gestures

### Capture

> *"I have a task."*

**Intention:** Add a task to the backlog without friction.
**When:** The human signals a task — rough, dictated, in passing.
**Input:** Free expression from the human.
**Output:** Task file in the partition subfolder, named `[partition] [nature] Description.md` or `[partition] [nature] PROJECT — Description.md`.
**Sequence:**
1. The human signals the task.
2. The guardian identifies the partition and nature (one-off / rhythm / worksite).
3. The guardian creates the file in the right place. For worksites: single document, sub-tasks inside.
4. The guardian confirms.

**Guardrails:** No form, no friction. If the partition or nature is ambiguous, **ask — don't guess**. **Do not capture and allocate at the same time** — they are different gestures with different cognitive modes.

---

### Groom

> *"Let's do a grooming."*

**Intention:** Walk the backlog to produce clarity. Spot mutations.
**When:** Periodically — the backlog ages, things drift, mutations accumulate silently.
**Input:** All backlog folders.
**Output:** A walked, mutation-aware backlog. Possibly: re-named tasks, mutated natures, suggested let-gos.
**Sequence:**
1. Traverse backlog by partition.
2. For each task, check: is the nature still right? (one-off lingering → maybe worksite; rhythm broken → signal by category; worksite stalled → re-scope or let-go)
3. Surface mutations to the human. Do not unilaterally mutate.
4. Suggest let-gos for tasks that have lost relevance.
5. Re-name where naming has drifted from convention.

**Guardrails:** Grooming is broader than Weekly Review and less frequent. It does *not* re-decide the period (that's Weekly Review). It does *not* clean the journal (append-only). Mutations are surfaced for the human to confirm — never silent.

---

### Allocate

> *"What should I do?"*

**Intention:** Plan a period (day or week) respecting the balance and inflections.
**When:** Start of period — morning for the day, Monday for the week.
**Input:** BALANCE.md, INFLECTIONS.md, backlog.
**Output:** ALLOCATION.md — ephemeral plan for the period.
**Sequence:**
1. Read BALANCE.md (effective values) and INFLECTIONS.md.
2. Ask for current inflections: desires, preferences, constraints of the moment.
3. Traverse backlog by partition.
4. Integrate constraints first (non-negotiable).
5. Desires and preferences bend the choice among eligible tasks.
6. Include rhythms and relevant worksite slices.
7. If an inflection strongly contradicts the balance, **flag it** — the human decides.
8. Write ALLOCATION.md.

**Guardrails:** The allocation is an ephemeral rendering, not a promise. **The plan is disposable; the system is permanent.** Do not over-allocate — an unrealistic plan is worse than no plan.

---

### Calibrate

> *"Something has changed."*

**Intention:** Adjust the balance to context.
**When:** A situation shifts — new constraint, life event, role change, broken rhythm pattern that won't resolve.
**Input:** CALIBRATION.md, the change being signalled.
**Output:** Updated CALIBRATION.md (new fragment with date and named impact), updated BALANCE.md (effective values re-derived), updated X-Ray.
**Sequence:**
1. The human (or guardian) signals the change.
2. Add a dated fragment to CALIBRATION.md describing the situation and its expected impact.
3. Re-derive effective values in BALANCE.md.
4. Re-render the X-Ray.
5. Confirm with the human that the new calibration matches their intent.

**Guardrails:** **Calibration precedes balance, never the other way.** Never modify BALANCE.md directly. Fragments are dated — they have a beginning, sometimes an end.

---

### Complete

> *"It's done."*

**Intention:** Signal what is done and trace it.
**When:** The human signals completion of a task.
**Input:** The task file, the human's confirmation.
**Output:** Task removed from backlog, entry appended to JOURNAL.md.
**Sequence:**
1. The human signals "done" — the task ID, name, or rough reference.
2. The guardian identifies the task file.
3. Append a journal entry (date, partition, nature, task name, optional notes).
4. Remove the task file from the backlog (for one-offs and worksites). For rhythms, mark the occurrence; the rhythm continues.
5. Confirm.

**Guardrails:** Journal is **append-only** — never modified retroactively. Rhythms don't "complete" in the same way one-offs do — track the occurrence, the rhythm persists.

---

### Let go

> *"This is no longer relevant."*

**Intention:** Consciously abandon a task.
**When:** A task has lost relevance — the context shifted, the cost outweighs the value, the desire is gone.
**Input:** The task file, the human's confirmation, the *reason*.
**Output:** Task removed from backlog. Optional: journal entry with the let-go reason (useful for Introspect later).
**Sequence:**
1. The human signals (or the guardian surfaces) a candidate let-go.
2. Confirm the reason — *why* matters more than *that*.
3. Optionally journal the let-go (especially if there's a pattern).
4. Remove the task file.

**Guardrails:** **Letting go is a gesture, not a failure.** Naming the reason transforms abandonment into decision. If the same task gets let-go and re-captured cyclically — that's a pattern for Introspect.

---

### Review

> *"How is my balance?"*

**Intention:** Measure the gap between target and reality.
**When:** Periodically. The human wants to *see*, not yet to *act*.
**Input:** BALANCE.md (target), JOURNAL.md (reality over the relevant period).
**Output:** A rendering — table, X-Ray, or visualisation — showing target vs effective.
**Sequence:**
1. Aggregate journal entries over the period (week, month, quarter).
2. Compute effective time/effort distribution per partition.
3. Render against BALANCE.md target.
4. Flag deviations without prescribing.
5. Suggest deeper gestures if pattern is strong: Introspect, Calibrate, Groom.

**Guardrails:** Review **observes**; it does not clean. Do not modify BALANCE.md from a Review (that's Calibrate). Do not re-decide tasks (that's Weekly Review). **Numbers inform; visuals make conscious.**

---

### Introspect

> *"Help me understand."*

**Intention:** Understand the patterns behind lingering tasks, repeated deferrals, systematically avoided partitions.
**When:** A pattern surfaces (during Review, Weekly Review, or Groom) that the human wants to understand before acting.
**Input:** JOURNAL.md, backlog history, allocation history, let-go history.
**Output:** A reading of the pattern — hypothesis, not verdict. Possibly: a proposed inflection (regular or one-time), a calibration suggestion, a let-go suggestion.
**Sequence:**
1. Identify the pattern (lingering task, avoided partition, broken rhythm, repeated let-go-then-recapture).
2. Read the surrounding context (journal, fragments, inflections).
3. Surface a hypothesis — what might the pattern signal?
4. Propose an action: inflection, calibration, let-go, conversation.
5. The human reflects, validates or rejects.

**Guardrails:** **Hypothesis, not verdict.** The guardian observes patterns; the human owns interpretation. Do not pathologise — patterns often have legitimate causes (life phases, seasons, energy cycles).

---

### Weekly Review

> *"Let's close the week."*

**Intention:** Close the period, re-decide each undone item, detect patterns.
**When:** End of period — typically weekly. **The only gesture *expected* at a specific moment.**
**Input:** ALLOCATION.md (the plan), JOURNAL.md (the reality), BALANCE.md, INFLECTIONS.md, backlog.
**Output:** Cleaned allocation (every undone item re-decided), inflections updated if patterns detected.
**Sequence:**
1. Compare ALLOCATION.md with JOURNAL.md — what was done, what wasn't?
2. For each undone item, the human re-decides:
   - **Slide** — consciously defer to next period
   - **Postpone** — return to backlog without deadline
   - **Let go** — abandon
3. The guardian looks for recurring patterns: repeated deferrals, systematically avoided partitions, worksites that never progress.
4. If a pattern is detected → propose an inflection (one-time or regular) or a calibration.
5. The human validates or rejects.
6. Clean ALLOCATION.md.

**Guardrails:** The weekly review **does not judge** — it observes and prompts re-decision. The journal is unchanged (append-only). **Do not confuse with Review** (which observes the gap without cleaning) or **Groom** (which is broader, less frequent, covers the whole backlog). The weekly review is the period closure gesture — it transforms the mirror into action.

---

*Source method: Kairos. The guardian holds these alive.*
