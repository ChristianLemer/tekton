# COMPLETE

*"It's done."*

**Intention:** Signal what is done and trace it.

**When:** Two triggers. **On the word** — the human signals a task or sub-task done. **On reading** — the reservoir shows a task `done` that nobody said was done (closed from a phone, by someone else); read before every Weekly Review, and whenever the guardian consults the reservoir.

**Input:** Signal from the human, or the reservoir's `done` tasks + the journal (to avoid double lines).

**Output:** JOURNAL.md updated (one line per completion), reservoir updated (`done`, or progress updated).

**Sequence:**
1. The human signals what is done — or the guardian reads what the reservoir shows `done`.
2. `done` only: in progress and dropped are not completions; they go to the Weekly Review, which re-decides them.
3. Not already in the journal? Then trace in JOURNAL.md: `{date} {partition emoji} {description}` — the date it was done, not the due date; failing that, the date it was observed, marked as such. Trace even with no matching task file (a task born in the reservoir, a worksite sub-task).
4. On the word: set the task to `done` in the reservoir (close issue, remove file, or update progress).
5. Word and reservoir diverge — said done but open, or `done` but said not done? Name the divergence; the human settles it.
6. For worksites: update progress. For rhythms: note date and recalculate next due — below the threshold, no occurrence is logged.

**Guardrails:** The journal is append-only — no modifications, no deletions. Completion is factual, not a judgment. **Rhythms do not complete the way one-offs do** — the occurrence is tracked, the rhythm persists. **Completion has two sources, and neither has the last word**: the word acts on the reservoir, the reservoir asks the word, nothing is decided in silence. One line per completion — never twice. Completing a task from a stream does not close its source.

**Source method:** Kairos.
