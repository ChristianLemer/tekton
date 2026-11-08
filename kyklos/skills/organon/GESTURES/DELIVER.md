# DELIVER

Make the forged deliverable the accepted one.

**When:** ACCEPT has given a go decision.

**Input:** The working branch, accepted. `main`.

**Output:** `main` carries the new deliverable; a tag marks it as the previous state for the next ACCEPT.

**Sequence:**
1. Advance `main` to the accepted branch.
2. Tag that state — the name carries the deliverable and its version.

How history is shaped — linear or not — is the house's rule; the method asks only that `main` reach the accepted state and that a tag mark it. Nothing is copied and nothing is archived. The deliverable has one home; the VCS keeps every previous state reachable, and the tag is where the next ACCEPT starts its comparison.

**Guardrails:** DELIVER never executes without a preceding ACCEPT. DELIVER does not modify the artefact — it advances the accepted state. If something looks wrong at this stage, go back to ACCEPT. Never write on `main` directly: what reaches it, reaches it through this gesture.

**Source method:** Kyklos (common trunk).
