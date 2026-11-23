# FORGE

Materialise intent into artefact.

**When:** Position is established and the project needs a deliverable — or the current deliverable needs updating.

**Input:** Position in `3. Position/` (and its directives). Forge directives in `4. Forge/`. Previous deliverable — `4. Forge/<PRODUCT>/` at the last tag (consulted, not imposed).

**Output:** The product in `4. Forge/<PRODUCT>/`, on the working branch.

**Sequence:**
1. Prospect: what existing components, patterns, or solutions can be assembled? What building blocks are available — so that only the delta needs to be forged?
2. Reread Position and its directives.
3. Reread Forge directives (tooling, format, constraints).
4. Consult the previous deliverable — what exists? What must not regress?
5. Generate the artefact — composing found components, forging only what is missing.
6. Write the `ABOUT` — what the deliverable is about, when it serves, and, when it has neighbours, when it does not and who takes over. Forged with the artefact by whoever just made it.
7. Review: does the artefact faithfully express the Position? Does it regress from the previous deliverable?
8. Iterate until satisfied.

The `ABOUT` is forged, never generated from the body: extracting the first sentence yields a paraphrase, not a presentation. It says what it is about and when it serves — the second is the one that gets forgotten, and the one that decides use. When neighbouring deliverables serve nearby cases, it also draws the boundary: when not, and who takes over. Without it, each piece claims every nearby case. The name is not repeated; it is the deliverable's own directory name.

**Guardrails:** The Forge transforms — it does not decide. If a decision is needed, go back to Position. The previous deliverable is a reference, not a constraint — it protects against accidental regression but does not prevent intentional change. Write on a working branch, never on the accepted one — the branch is the forge. What is forged reaches `main` only through ACCEPT and DELIVER.

**Source method:** Kyklos (common trunk).
