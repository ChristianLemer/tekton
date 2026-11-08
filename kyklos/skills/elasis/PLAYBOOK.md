# PLAYBOOK

*The Elasis cycle as a gesture pipeline.*

---

## The Cycle

Elasis gestures form a cycle. The output of each gesture is the input of the next. The cycle has no fixed starting point — enter where the project is.

```
OBSERVE → CONSOLIDATE → DISTILL → FORGE → (ACCEPT → DELIVER) → OBSERVE → ...
```

ACCEPT and DELIVER form a gate between the Forge and the Deliverable — they do not feed back into the cycle directly. ACCEPT is a judgment (tekhnē); DELIVER advances the accepted state (automaton). The cycle continues regardless of whether a deliverable is installed.

**The gate, in practice.** The deliverable is written on a working branch; `main` holds the accepted state; the tag set by the last DELIVER holds the previous one. ACCEPT reads the diff between the branch and that tag — one comparison between two states, whatever the number of commits in between — and rereads the workshop. DELIVER advances `main` to the branch and sets the next tag; how history is shaped is the house's rule. Nothing is copied, nothing is archived: the VCS keeps every previous state reachable.

HARVEST can feed Fragments at any point — it is not part of the cycle sequence.

---

## States and Gates

| From | Gesture | To | Gate |
|------|---------|----|------|
| 0 (inputs) | OBSERVE | Fragments (1) | Which aspect does it speak to, and where does it belong? |
| Fragments (1) | CONSOLIDATE | Picture (2) | Are patterns becoming visible? |
| Picture (2) | DISTILL | Position (3) | Is the Picture solid enough to act on? |
| Position (3) | FORGE | Forge (4) | Is the Position established? |
| Forge (4) | ACCEPT | go/no-go | Is the artefact ready for release? |
| go | DELIVER | Deliverable | (advance and tag — automatic after ACCEPT) |
| Forge (4) | — | 0 (inputs) | (automatic — forge produces results) |

Each gate is a judgment call, not a checklist. The operator decides when to advance.

---

## Entry Points

- **New project** — start at OBSERVE. What do you know? What have you seen?
- **Returning to a stalled project** — start at the lowest level with stale content. If Fragments are outdated, OBSERVE. If Picture has drifted, CONSOLIDATE.
- **Correction after feedback** — start at OBSERVE with the feedback as input.
- **A change born at one level** — enter at that level and descend to the Forge, without going round the whole cycle. Climb back only if what lies downstream shows the upstream no longer holds.
- **A change that comes from the container** — a moved folder, a renamed convention, nothing the project says — is maintenance, not a cycle: apply it to the levels and the product alike. The diff reads as a move; the next ACCEPT sees it as one.

---

## Rework Loops

The cycle is naturally a rework loop — each pass refines. But within a single pass:

- **FORGE reveals a gap in Position** → return to DISTILL
- **DISTILL reveals the Picture is incomplete** → return to CONSOLIDATE
- **CONSOLIDATE reveals missing observations** → return to OBSERVE
- **ACCEPT says no** → return to the level that should have carried the requirement — a lost trade-off is a Tactics gap, a missing stance a Position gap. Never patch the deliverable: the next regeneration erases the patch

The principle: go back to the level where the problem lives. Don't patch downstream.

---

## Bridges

Any new knowledge (fragment, pattern, insight) can challenge existing directives at any level. This is not a named gesture — it is a standing obligation. When the cycle reveals that a directive no longer holds, revise it.

---

## Injection

The cycle is not a monologue. At each level, reviewing the output reveals things you didn't know you knew:

- Something jars → a fragment is missing, or a constraint was undocumented
- Something resonates → a deeper principle is at work, worth capturing

Capture it in directives (at the current level) or in fragments (upstream). Then regenerate. The process is not: specify then generate. It is: generate, review, inject, regenerate.

---

*The cycle self-corrects by walking.*
