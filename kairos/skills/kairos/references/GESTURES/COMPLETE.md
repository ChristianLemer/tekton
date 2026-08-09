# COMPLETE

*"It's done."*

**Intention:** Signal what is done and trace it.

**When:** The human has completed a task or sub-task.

**Input:** Signal from the human + task concerned.

**Output:** JOURNAL.md updated (one line), backlog updated (task removed or progress updated).

**Sequence:**
1. The human signals what is done.
2. The guardian traces in JOURNAL.md: `{date} {partition emoji} {description}`.
3. Mark done in the reservoir (close issue, remove file, or update progress).
4. For worksites: update progress. For rhythms: note date and recalculate next due.

**Guardrails:** The journal is append-only — no modifications, no deletions. Completion is factual, not a judgment. **Rhythms do not complete the way one-offs do** — the occurrence is tracked, the rhythm persists.

**Source method:** Kairos.
