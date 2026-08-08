---
name: "anabasis"
description: "The ascent from thinking to action — the middle profile of the Kyklos family. The same cycle as Elasis with one refinement module: Position is deployed through Strategy (orientations for an objective), Tactics (repeatable moves) and Operational (tooling, format, deployment) before reaching the Forge. Each level has its own granularity; mixing them produces colliding decisions. No knowledge refinement — Fragments consolidate straight into the Picture. Use when building something (a method, a document, a system) whose production path needs structure of its own, when tooling or deployment must be settled before materialising, or when a Position alone does not tell you how to build. Not when the project is small and the knowledge well understood (Elasis), and not when the understanding itself needs work before a stance can be taken (Organon)."
---

# Anabasis

*The ascent from thinking to action.*

A method for projects where production needs structure. Same cycle as Elasis, with a refinement module that deploys Position into Strategy, Tactics, and Operational before the Forge.

Anabasis is the middle profile of the Kyklos family. It adds production refinement to the common trunk.

The name means "journey upward" (ἀνάβασις).

---

## Core Principle

**Same truth, different depth, different audience.**

A project contains multiple renderings of the same understanding:

| Layer | Audience | Purpose |
|-------|----------|---------|
| Fragments | Self, sparring partners | Preserve evidence, enable thinking |
| Picture | Team, direct manager | Build shared understanding |
| Position | Leadership, cross-functional | Enable decision and action |

Each is true. None replaces the others. Moving between them is translation, not dilution.

---

## The Cycle

Every Kyklos method is a cycle. Anabasis adds a production refinement module between Position and Forge — three levels that deploy intent into progressively concrete form before materialising.

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
    G -->|DELIVER| D(["6. Deliverable"])
```

| # | Level | Pole | Role |
|---|-------|------|------|
| 0 | *(parallel input folders)* | Experience | Raw input — lived, received, observed |
| 1 | Fragments | — | Observe, name, keep |
| 2 | Picture | Knowledge | Consolidate into patterns |
| 3 | Position | — | Frame for action (+ directives) |
| 3a | Strategy | — | Orientations for a specific objective |
| 3b | Tactics | — | Repeatable patterns, concrete moves |
| 3c | Operational | — | Tooling, deployment, production conditions |
| 4 | Forge | Experience | Materialise, act on the world |

Two poles: **Forge/inputs** (experience) and **Picture** (knowledge).
Two interfaces: **Fragments** (between experience and knowledge) and **Position** (between knowledge and action).
One refinement module: **Strategy → Tactics → Operational** (between decision and materialisation).
Two artifacts: **Knowledge Artifact** (output of Picture) and **Executable Artifact** (output of Forge).

The cycle: `4 → 0 → 1 → 2 → 3 → 3a → 3b → 3c → 4`

---

## Project Structure

```
Project/
├── README.md
├── INTENTION.md
├── REQUESTS.md
├── 1. Workshop/
│   ├── 0. Communication/
│   ├── 0. References/
│   ├── 1. Fragments/
│   ├── 2. Picture/
│   ├── 3. Position/
│   ├── 3a. Strategy/
│   ├── 3b. Tactics/
│   ├── 3c. Operational/
│   └── 4. Forge/
├── 6. Deliverable/
├── 7. Attic/
├── 8. Purgatory/
├── 9. The Void/
├── local/
└── µ. LOCAL/
```

Level 0 can have multiple parallel folders — create what you need. See CHOICES (Kyklos .. CHOICES) for the full catalogue.

Gestures are documented in `µ. LOCAL/` — see Praxis (Tekton .. Praxis .. PRAXIS) for the infrastructure conventions.

---

## The Levels

### Input Zone (0)

Raw material of different types, held in parallel folders all numbered 0. Results from previous forge cycles, external references, communications, dialogues, surveys — each in its own folder. Not every project needs all of them.

Level 0 is not a working phase. It is an inbox — what enters the cycle before any observation has been made.

### Fragments (1)

Observations named and kept. Specific, grounded, tied to context. A fragment says: "I noticed this, it matters, here's why."

A good fragment is a module with minimal coupling — an autonomous unit of reasoning. Graph-theoretic analogy: fragments are nodes, dependencies are edges. Good fragmentation minimises inter-fragment edges.

### Picture (2)

Patterns consolidated from fragments. The Picture is honest synthesis — what recurs, what conflicts, what connects. It is the knowledge pole of the cycle.

The Picture does not choose. It maps. Choices belong to Position.

The Picture is a **Knowledge Artifact** — it can be shared, referenced, and used independently of the rest of the cycle.

### Position (3)

Where choices are made. Given the patterns mapped by the Picture, Position picks a stance — what we do, what we reject, what we accept as trade-off.

Position carries **context** — lateral forces that shape decisions without participating in them: choices, constraints, beliefs. These are implemented as directives (Genesis convention).

Position is the interface between knowledge and action. It translates understanding into intent.

### Strategy (3a)

Translates Position into orientations for a specific objective. Still abstract, but aimed. Strategy says: "given our stance, here is the plan."

### Tactics (3b)

Habitual responses. Repeatable patterns that implement strategy without re-deciding each time. Tactics says: "when this happens, do that."

### Operational (3c)

Organises production. Tooling choices, deployment conditions, format requirements, generation scripts. Operational says: "here is how we make it."

The Operational level prepares the Forge. It does not forge — it equips.

### Forge (4)

Where intent becomes artefact. The Forge materialises — it acts on the world, produces the deliverable, generates results.

The Forge includes **UAT** — review against the previous deliverable before delivery. What is forged is tested before it replaces what exists.

The output is an **Executable Artifact** — something that works, that can be deployed, used, applied.

In Anabasis, the Forge takes its input from the Operational level, not directly from Position. The three refinement levels translate the *what* (Position) into the *how* (Operational) before the Forge transforms.

---

## Gestures

Anabasis defines ten gestures. The seven trunk gestures are shared with all Kyklos profiles. Three additional gestures belong to the production refinement module.

Each follows the Praxis anatomy (Tekton .. Praxis .. PRAXIS). The gesture files live in `µ. LOCAL/GESTURES/`. The PLAYBOOK describes their sequencing.

### Trunk gestures (shared with Elasis and Organon)

| Gesture | Transition | Nature |
|---------|-----------|--------|
| OBSERVE | 0 → Fragments | Name an experience worth keeping |
| CONSOLIDATE | Fragments → Picture | Reveal the patterns |
| DISTILL | Picture → Position | Frame for action |
| FORGE | Operational → Forge | Materialise |
| ACCEPT | Forge → go/no-go | Review against the previous deliverable |
| DELIVER | Forge → Deliverable | Install the new, keep the previous recoverable |
| HARVEST | (external) → Fragments | Import from another project |

### Production refinement gestures

| Gesture | Transition | Nature |
|---------|-----------|--------|
| STRATEGIZE | Position → Strategy | Plan how to achieve it |
| TACTIZE | Strategy → Tactics | Define recurring practices |
| OPERATE | Tactics → Operational | Organise production |

Each production gesture begins by prospecting what already exists at its level of abstraction — approaches, tools, infrastructure, or components — so that only the delta needs to be created.

---

## Communication

Communication (`0. Communication/`) is one of the parallel input folders. It draws from any level as needed — slides, messages, pitches, status updates. Zero means "outside the sequence."

Communication is not a level in the cycle. It is an output channel that exists alongside the cycle. What you communicate may come from Fragments (raw evidence), Picture (shared understanding), or Position (actionable stance) — depending on the audience.

---

## Directives

At each level, **directives** can influence the work without participating in it. They are lateral forces — scope boundaries, constraints, preferences — that shape judgment without being the judgment.

Directives are UPPERCASE files inside the level's folder. They are typed on two axes — source and binding force:

| Directive | Source | Force | What it says |
|-----------|--------|-------|--------------|
| FRAME | — | Structural | "Here is the perimeter" |
| CONSTRAINTS | External | **Strong** | "You must respect this — imposed from outside" |
| CHOICES | Internal | **Strong** | "We decided this — it must be respected" |
| CONSIDERATIONS | External | **Medium** | "Here is the terrain — take it into account" |
| CONVICTIONS | Internal | **Medium** | "We believe this deeply — it influences but does not prescribe" |
| TEMPERED | Experience | **Strong** | "Practice has confirmed this" |

Directives survive regeneration. If the work at a level is rewritten, directives remain — they are the memory of what was learned along the way.

---

## Bridges

New knowledge can challenge existing directives at any level. This is the natural consequence of the cycle — every pass through OBSERVE → CONSOLIDATE → DISTILL is an opportunity to confront what was previously decided.

In Anabasis, the production refinement levels also carry directives. A fragment that challenges a Tactical directive (a recurring pattern that no longer works) or an Operational directive (a tooling choice that proved wrong) triggers revision at that level. The cycle self-corrects by walking.

---

## Injection

The cycle is not a monologue. At each level, reviewing the output reveals things you didn't know you knew:

- Something jars → a fragment is missing, or a constraint was undocumented
- Something resonates → a deeper principle is at work, worth capturing

Capture it in directives (at the current level) or in fragments (upstream). Then regenerate. By iteration, the output converges toward what is right.

The process is not: specify then generate. It is: generate, review, inject, regenerate.

---

## Input Channels

A project needs visible entry points for feedback. **REQUESTS.md** receives suggestions, critiques, and demands from any operator at any level. It feeds the project without contaminating work in progress.

A request is a living item. Open items need attention. Resolved items are either elevated (into a fragment, a deliverable, a README, a CHANGELOG) or deleted. The request is not the memory — the artefact it produced is.

---

## Excluded Zones

Three zones with a retention gradient:

| # | Zone | Purpose | Contract |
|---|------|---------|----------|
| 7 | **Attic** | Archived/historical | Preserved for reference, not for active work |
| 8 | **Purgatory** | Superseded content | Consultable for rollback, cleanable periodically |
| 9 | **Void** | Discarded content | May be wiped without notification |

The contract applies to any operator — human or AI. No one should read, search, cite, or rely on content in excluded zones, but anyone can use them as destinations when moving content out of active areas.

---

## How to Use

### Starting a Project

1. Create the folder structure (or deploy the template)
2. Write **INTENTION.md** at the root — why does this project exist?
3. Start with **Fragments/** — what do you observe? What matters?
4. Move to **Picture/** when fragments reveal patterns worth consolidating
5. Move to **Position/** when you need to frame for action
6. Add **Strategy/**, **Tactics/**, **Operational/** as the project matures
7. Not every project needs all refinement levels immediately. Start where you are.

### Maintaining a Project

- When reality changes, update from the bottom: Fragments first, then let changes propagate through the cycle.
- When Position drifts from Picture, reconcile — don't let them diverge silently.
- Date your fragments. Your future self will thank you.
- Use directives to capture what you learn along the way — they are your lateral memory.

### Producing the Deliverable

FORGE generates the artefact in `4. Forge/`. ACCEPT compares it with the current version in `6. Deliverable/` — what changed, what was lost, what was gained. If satisfied, DELIVER installs the new one, making sure the previous state remains recoverable. Do not write directly in `6. Deliverable/` — forge first, accept, then deliver.

How recoverability is obtained is an Operational choice, not a method one — see the PLAYBOOK.

The deliverable also carries an **`ABOUT`** — what it is about, and when it serves. What leaves the workshop arrives bare: none of what surrounded it there crosses with it. Self-sufficiency stated negatively — nothing external required — is not enough; owing nothing to your workshop is not the same as being able to introduce yourself. FORGE writes it, ACCEPT reviews it.

### AI as Partner

Work at Fragments and Picture level with AI. It can hold complexity, challenge reasoning, and help refine understanding — without political cost.

Once Picture is solid, DISTILL to Position for human audiences. The AI becomes a space where depth is safe.

### Feedback

If you apply this method, **feed back your learnings**:
- What **worked** — confirmations, reinforcements
- What **failed** — invalidations, corrections needed
- What's **missing** — situations not anticipated

This feedback feeds Kyklos. The field is always right.

---

## When to Use Anabasis

Use Anabasis when:
- Building something — a method, a document, a system, a deliverable
- The production path needs structure (tooling decisions, deployment, recurring practices)
- The project has enough complexity that Position alone doesn't guide materialisation

When the project is small and the knowledge well understood, consider Elasis (no refinement modules). When the knowledge itself needs refinement (angles, confrontation), consider Organon (adds knowledge refinement).

---

## Kyklos Family

Anabasis is the middle profile of **Kyklos** (κύκλος) — the unified cycle of learning and production.

Three profiles share the same trunk and the same core gestures. They differ in how much refinement is applied between the trunk levels:

| Profile | Knowledge refinement | Production refinement |
|---------|--------------------|--------------------|
| **Elasis** | — | — |
| **Anabasis** | — | Strategy → Tactics → Operational |
| **Organon** | Sketch → Angles → enriched Picture | Strategy → Tactics → Operational |

All three are cycles. All three produce and learn. The question is: where does the project need more refinement?

See also: Elasis (Kyklos .. ELASIS), Organon (Kyklos .. ORGANON).

---

## Dependencies

Anabasis depends on:
- **Genesis** (Tekton .. Genesis .. GENESIS) — workspace design conventions
- **Praxis** (Tekton .. Praxis .. PRAXIS) — gesture anatomy, µ namespace, orientation

---

*The ascent continues.*
