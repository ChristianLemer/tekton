# PLAYBOOK

*The Anabasis cycle as a gesture pipeline.*

---

## The Cycle

Anabasis gestures form a cycle with a production refinement module between Position and Forge. The output of each gesture is the input of the next.

```
OBSERVE → CONSOLIDATE → DISTILL → STRATEGIZE → TACTIZE → OPERATE → FORGE → (ACCEPT → DELIVER) → OBSERVE → ...
```

ACCEPT and DELIVER form a gate between the Forge and the Deliverable — ACCEPT is a judgment (tekhnē), DELIVER advances the accepted state (automaton). HARVEST can feed Fragments at any point.

**The gate, in practice.** The deliverable is written on a working branch; `main` holds the accepted state; the tag set by the last DELIVER holds the previous one. ACCEPT reads the diff between the branch and that tag — one comparison between two states, whatever the number of commits in between — and rereads the workshop. DELIVER advances `main` to the branch and sets the next tag; how history is shaped is the house's rule. Nothing is copied, nothing is archived: the VCS keeps every previous state reachable.

---

## States and Gates

| From | Gesture | To | Gate |
|------|---------|----|------|
| 0 (inputs) | OBSERVE | Fragments (1) | Which aspect does it speak to, and where does it belong? |
| Fragments (1) | CONSOLIDATE | Picture (2) | Are patterns becoming visible? |
| Picture (2) | DISTILL | Position (3) | Is the Picture solid enough to act on? |
| Position (3) | STRATEGIZE | Strategy (3a) | Is the Position established enough to plan? |
| Strategy (3a) | TACTIZE | Tactics (3b) | Is the strategy clear enough to define practices? |
| Tactics (3b) | OPERATE | Operational (3c) | Are practices stable enough to organise production? |
| Operational (3c) | FORGE | Forge (4) | Is the production setup ready? |
| Forge (4) | ACCEPT | go/no-go | Is the artefact ready for release? |
| go | DELIVER | Deliverable | (advance and tag — automatic after ACCEPT) |
| Forge (4) | — | 0 (inputs) | (automatic — forge produces results) |

Each gate is a judgment call, not a checklist. The operator decides when to advance.

---

## Entry Points

- **New project** — start at OBSERVE. What do you know? What have you seen?
- **Mature project, first deliverable** — start at STRATEGIZE if Position is already established.
- **Returning to a stalled project** — start at the lowest level with stale content.
- **Correction after feedback** — start at OBSERVE with the feedback as input.
- **A change born at one level** — enter at that level and descend to the Forge, without going round the whole cycle. Climb back only if what lies downstream shows the upstream no longer holds.
- **A change that comes from the container** — a moved folder, a renamed convention, nothing the project says — is maintenance, not a cycle: apply it to the levels and the product alike. The diff reads as a move; the next ACCEPT sees it as one.

---

## Rework Loops

Within a single pass:

- **FORGE reveals a gap in Operational** → return to OPERATE
- **OPERATE reveals unclear tactics** → return to TACTIZE
- **TACTIZE reveals a strategic ambiguity** → return to STRATEGIZE
- **STRATEGIZE reveals the Position is incomplete** → return to DISTILL
- **DISTILL reveals the Picture is incomplete** → return to CONSOLIDATE
- **CONSOLIDATE reveals missing observations** → return to OBSERVE
- **ACCEPT says no** → return to the level that should have carried the requirement — a lost trade-off is a Tactics gap, a missing stance a Position gap. Never patch the deliverable: the next regeneration erases the patch

The principle: go back to the level where the problem lives. Don't patch downstream.

---

## Bridges

Any new knowledge can challenge existing directives at any level — including Strategy, Tactics, and Operational directives. A recurring pattern that no longer works, a tooling choice that proved wrong: the revision happens at that level. This is a standing obligation, not a named gesture.

---

## Injection

The cycle is not a monologue. At each level, reviewing the output reveals things you didn't know you knew:

- Something jars → a fragment is missing, or a constraint was undocumented
- Something resonates → a deeper principle is at work, worth capturing

Capture it in directives (at the current level) or in fragments (upstream). Then regenerate. The process is not: specify then generate. It is: generate, review, inject, regenerate.

---

*The cycle self-corrects by walking.*
