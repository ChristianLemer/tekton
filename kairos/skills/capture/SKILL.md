---
name: capture
description: Capture a task into the Kairos backlog without friction. Identifies the partition and nature (one-off / rhythm / worksite), creates the task file in the right partition folder, asks if ambiguous (never guesses). Use when the user says "I have a task", "capture this", "/kairos:capture", or signals a task in passing.
---

# /kairos:capture

*"I have a task."*

The whole point is **friction-free input**. If capture is hard, the system loses to the back of an envelope. Three keystrokes max from intent to entry.

---

## Sequence

1. **The human signals the task** — rough, dictated, in passing. Accept any form. Don't make them format.

2. **Identify the partition.** Read PARTITIONS.md. Match by the task's domain. If unambiguous, proceed silently. If ambiguous, **ask once** — never guess.

3. **Identify the nature.**
   - **One-off** 📌 — single action, finite window
   - **Rhythm** 📊 🧹 🔧 🤝 — discipline, regularity is the goal (with sub-category: tracking / hygiene / maintenance / attention)
   - **Worksite** 🏗️ — single commitment with sub-tasks; the goal is to finish

   If unambiguous, proceed. If ambiguous, ask. *Especially* watch for: a "one-off" that smells like a worksite (multiple steps implied), or a "task" that's actually a rhythm (recurring by intent).

4. **Create the file** in the partition's backlog folder. Naming:
   ```
   [partition emoji] [nature emoji] Description.md
   [partition emoji] [nature emoji] PROJECT — Description.md   (if part of a project)
   ```
   Examples:
   - `💰 📌 File taxes.md`
   - `💪 📊 Weekly weigh-in.md`
   - `🏡 🏗️ Renovate bathroom.md`
   - `🧠 🏗️ HELIOS — Validate dataset.md`

   For worksites: **single document**, sub-tasks inside (linear → counted; non-linear → milestoned). Do not create a folder of separate task files.

5. **Confirm** — the file path, briefly. One line.

---

## Guardrails

- **No form.** No frontmatter required at capture time (other than what the TASK.md template prescribes — and even that should be minimal). Add structure later during Groom if needed.
- **Ask once if ambiguous, never guess.** Wrong partition / wrong nature pollutes the backlog and the journal.
- **Do not capture and allocate at the same time.** They are different cognitive modes. If the human asks "what should I do?" mid-capture, finish the capture, then switch to Allocate.
- **Worksites are single documents**, not folders.
- **Do not surface the task in today's allocation** unless explicitly asked. Capture goes to the backlog, not to the plan.

---

## When the workspace isn't ready

If `KAIROS/` doesn't exist, or PARTITIONS.md is missing, **do not silently scaffold**. Stop, name what's missing, ask the human if they want to walk SETUP.md before capturing. (A captured task with no valid partition is worse than no capture.)

---

*Source method: Kairos. See also: kairos-gestures (full catalogue), kairos (architecture).*
