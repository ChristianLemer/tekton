# ACCEPT

Confront the forged deliverable with what came before and with what the workshop required.

**When:** The Forge has produced a deliverable ready for release, on its working branch.

**Input:** The deliverable on the working branch. The previous deliverable — the last tag on `main`. The workshop — Position, and the levels that deploy it where the profile has them.

**Output:** Go/no-go decision. On a no-go, the level to correct.

**Sequence:**
1. Diff the branch against the last tag — one comparison between two states, whatever the number of commits in between. What changed? What was lost? What was gained? Is anything broken or accidentally degraded?
2. Reread the workshop. Does the deliverable render what it required? The previous deliverable cannot vouch for what it never contained: a requirement born in this cycle leaves no trace in the tag, only in the workshop.
3. Does the `ABOUT` still hold — what this version is about, when it serves, and, if it has neighbours, when it does not and who takes over?
4. If satisfied — proceed to DELIVER.
5. If not — name the level that should have carried the requirement, and return there.

**Guardrails:** ACCEPT is a review, not a rubber stamp — and both faces are necessary: the tag catches regressions, the workshop catches omissions. A defect in the deliverable is a defect of transmission: a level held the requirement and did not pass it on, or never held it. Correct that level, then reforge — never the deliverable itself, since the next regeneration erases the patch. ACCEPT does not modify the artefact — it accepts or rejects.

**Source method:** Kyklos (common trunk).
