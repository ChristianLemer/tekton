---
name: anabasis
description: 'Use when you are building something — a method, a document, a system, a deliverable — and the path to production needs structure of its own; when tooling decisions, deployment, or recurring practices have to be settled before materialising anything; when the project carries enough complexity that a Position alone does not tell you how to build. The knowledge side is assumed settled: you know what you are doing, the question is how to produce it well. Not when the project is small and the knowledge well understood — that is Elasis, and the refinement would cost more than it returns. Not when the understanding itself needs work before a stance can be taken — that is Organon.'
---
# Anabasis

*The ascent from thinking to action.*

A method for projects where production needs structure. The middle profile of the Kyklos family: the common trunk, plus a production refinement module that deploys Position into Strategy, Tactics and Operational before the Forge.

The name means "journey upward" (ἀνάβασις).

---

## Core Principle

**Same truth, different depth, different audience.**

| Layer | Audience | Purpose |
|-------|----------|---------|
| Fragments | Self, sparring partners | Think one aspect through |
| Picture | Team, direct manager | Build shared understanding |
| Position | Leadership, cross-functional | Enable decision and action |

Each is true. None replaces the others. Moving between them is translation, not dilution.

---

## The Cycle

```mermaid
flowchart TD
    F["4 · Forge"] -->|produces| Zero["0 · (inputs)"]
    Zero -->|OBSERVE| Fr["1 · Fragments"]
    Fr -->|CONSOLIDATE| P["2 · Picture"]
    P -->|DISTILL| Pos["3 · Position"]
    Pos -->|STRATEGIZE| S["3a · Strategy"]
    S -->|TACTIZE| T["3b · Tactics"]
    T -->|OPERATE| O["3c · Operational"]
    O -->|FORGE| F
    F -.->|ACCEPT| G{"go?"}
    G -->|DELIVER| D(["main — accepted"])
```

| # | Level | Pole | Role |
|---|-------|------|------|
| 0 | *(parallel input folders)* | Experience | Raw input — lived, received, observed |
| 1 | Fragments | — | Reflect on one aspect — views with their conditions |
| 2 | Picture | Knowledge | Consolidate into patterns |
| 3 | Position | — | Frame for action (+ directives) |
| 3a | Strategy | — | Orientations for a specific objective |
| 3b | Tactics | — | Repeatable patterns, concrete moves |
| 3c | Operational | — | Tooling, deployment, production conditions |
| 4 | Forge | Experience | Materialise, act on the world |

Two poles: **Forge/inputs** (experience) and **Picture** (knowledge). Two interfaces: **Fragments** and **Position**. One refinement module: **Strategy → Tactics → Operational**, between decision and materialisation. Two artifacts: **Knowledge** (Picture) and **Executable** (Forge).

The cycle: `4 → 0 → 1 → 2 → 3 → 3a → 3b → 3c → 4`

---

## Inside the Project

Anabasis describes the inside of the folder it is given — a piece of a corpus, a project filed in a zone, or, when the project lives alone, the zone where its workspace produces. It does not name what contains it.

```
<the folder you are given>/
├── 0. References/ · 0. Result/  ← inputs, outside the sequence
├── 1. Fragments/
├── 2. Picture/
├── 3. Position/
├── 3a. Strategy/
├── 3b. Tactics/
├── 3c. Operational/
└── 4. Forge/
    ├── CHOICES.md …   ← Forge directives
    └── <PRODUCT>/     ← the product, written by FORGE on a working branch
```

The levels lie flat, numbered as a sequence; the product lives at the Forge, the last step. The deliverable is not a folder but a state: what `main` holds of `4. Forge/<PRODUCT>/`. Level 0 holds parallel folders, all numbered 0, one per kind of input: `0. Result/` (what the forge produced in the world), `0. References/` (external sources, borrowed knowledge), `0. Communication/` (what is shared with others), `0. Dialogs/` (conversations, interviews), `0. Survey/` (structured enquiry). Create only those you need.

**Communication** is not a level: `0. Communication/` draws from any level as the audience requires — Fragments, Picture, or Position.

**Around the cycle, Genesis.** The folder explains itself — README, INTENTION — as Genesis says; what you discard goes to the excluded zones of the workspace; names and marks follow its conventions. Local gestures follow Praxis. A project that lives alone becomes a Genesis workspace and lays this sequence out in the zone where it produces.

---

## The Levels

**Input Zone (0).** Raw material, held as it came. Not a working phase but an inbox. This is where the situated lives — dated, tied to its case.

**Fragments (1).** A space of reflection on one aspect. The mind does not think a problem whole: it cuts it up and works one aspect at a time. A fragment is that aspect, and the place where one's view of it is refined — several principles, even several doctrines, one per case or competing ones set against each other. Its unit is the aspect, not the conclusion. It is a view, not a science: one follows a school.

A fragment is high-level and carries its **conditions of applicability** — *when A, then X*. That is why it has no date and tells no story: the situated case stays in level 0, grounding the fragment without appearing in it. What depends on the moment or the place belongs elsewhere — a record of what happened (level 0), a *how* (Tactics, Operational), a decision for our situation (Position). A local doctrine that has lost its conditions has become a Position. Good fragments have minimal coupling: autonomous nodes, few edges.

**Picture (2).** Patterns consolidated from fragments — what recurs, what conflicts, what connects. It maps; it does not choose. A **Knowledge Artifact** — shareable and usable on its own.

**Position (3).** Where choices are made. Position is **situated**: it looks at our situation, recognises which conditions are ours, and decides — what we do, what we reject, what we accept as trade-off. It carries **context** as directives: choices, constraints, beliefs.

**Strategy (3a).** "Given our stance, here is the plan" — orientations for a specific objective, still abstract but aimed. It is where the artefact's language is declared, when its readers are not the workshop's.

**Tactics (3b).** "When this happens, do that" — repeatable patterns that implement strategy without re-deciding each time.

**Operational (3c).** "Here is how we make it" — tooling, deployment, format, the composition of the deliverable. It equips the Forge; it does not forge.

**Forge (4).** Where intent becomes an **Executable Artifact**. FORGE writes the product itself, in `4. Forge/<PRODUCT>/`, on a working branch, taking its input from Operational: the three refinement levels translate the *what* into the *how* before the Forge transforms.

---

## Gestures

Ten gestures, each following the Praxis anatomy (Tekton .. Praxis .. PRAXIS), in `GESTURES/` beside this document. The PLAYBOOK sequences them.

| Gesture | Transition | Nature |
|---------|-----------|--------|
| OBSERVE | 0 → Fragments | Draw from an experience a view on one aspect |
| CONSOLIDATE | Fragments → Picture | Reveal the patterns |
| DISTILL | Picture → Position | Frame for action |
| STRATEGIZE | Position → Strategy | Plan how to achieve it |
| TACTIZE | Strategy → Tactics | Define recurring practices |
| OPERATE | Tactics → Operational | Organise production |
| FORGE | Operational → Forge | Materialise |
| ACCEPT | Forge → go/no-go | Confront with the previous deliverable and with the workshop |
| DELIVER | Forge → Deliverable | The accepted state advances; a tag marks it |
| HARVEST | (external) → Fragments | Import from another project |

STRATEGIZE, TACTIZE, OPERATE are production refinement, each prospecting what exists at its level so that only the delta is created. The rest is the trunk every Kyklos profile shares.

---

## Directives

At each level, **directives** shape judgment without being the judgment. They are UPPERCASE files inside the level's folder, typed by source and force:

| Directive | Source | Force | What it says |
|-----------|--------|-------|--------------|
| FRAME | — | Structural | "Here is the perimeter" |
| CONSTRAINTS | External | **Strong** | "You must respect this — imposed from outside" |
| CHOICES | Internal | **Strong** | "We decided this — it must be respected" |
| CONSIDERATIONS | External | **Medium** | "Here is the terrain — take it into account" |
| CONVICTIONS | Internal | **Medium** | "We believe this deeply — it influences but does not prescribe" |
| TEMPERED | Experience | **Strong** | "Practice has confirmed this" |

Directives survive regeneration: they are the memory of what was learned along the way. When new knowledge contradicts one — at any level, Tactics and Operational included — it is revisited.

---

## Producing the Deliverable

The product has one home: `4. Forge/<PRODUCT>/`, beside the Forge directives. FORGE writes it on a working branch, never on the accepted one; `main` holds the accepted state — the deliverable — and the tag of the last DELIVER the previous one.

ACCEPT confronts the branch on two faces: the last tag, which catches regressions, and the workshop — Position, Strategy, Tactics, Operational — which catches omissions, since the previous deliverable cannot vouch for what it never contained. If satisfied, DELIVER advances `main` to the accepted branch and tags it; how history is shaped is the house's rule, not the method's. The PLAYBOOK carries the practice.

The deliverable carries an **`ABOUT`**: what it is about, when it serves, and — when it has neighbours — when it does not, and who takes over. What leaves the workshop arrives bare; owing nothing to your workshop is not the same as being able to introduce yourself. FORGE writes it, ACCEPT reviews it.

---

## How to Use

**Starting.** Lay the levels out in the folder you are given, and let it say why the project exists (INTENTION, per Genesis). Start with Fragments. Move to the Picture when they reveal patterns, to Position when you need to frame for action. Add Strategy, Tactics, Operational as the project matures — not every project needs them at once. FORGE, then ACCEPT and DELIVER.

**Maintaining.** When reality changes, update from the bottom and let changes propagate. When Position drifts from Picture, reconcile. Capture what you learn in directives. The PLAYBOOK carries the dynamics — bridges, injection, where a change enters.

**AI as partner.** Work Fragments and Picture with AI: depth without political cost. DISTILL for human audiences.

**Feedback.** If you apply this method, feed back what worked, what failed, what is missing — through the project's input channel (Genesis). The field is always right.

---

## When to Use Anabasis

When building something — a method, a document, a system — whose production path needs structure: tooling decisions, deployment, recurring practices. When the project is complex enough that Position alone does not guide materialisation.

Not when the project is small and the knowledge well understood — that is **Elasis**, the trunk alone. Not when the understanding itself needs refinement before a stance can be taken — that is **Organon**, which adds knowledge refinement. All three share the trunk and its gestures; they differ in how much refinement sits between its levels.

---

## Dependencies

- **Genesis** (Tekton .. Genesis .. GENESIS) — workspace design conventions, and everything around the cycle: partition, excluded zones, the files a folder explains itself with, the input channel
- **Praxis** (Tekton .. Praxis .. PRAXIS) — gesture anatomy, µ namespace, orientation
- **A version control system** — a branch for the work in progress, a reference for the accepted state, a diff between the two. Any VCS gives these three; the gate (ACCEPT, DELIVER) is defined on them

---

*The ascent continues.*
