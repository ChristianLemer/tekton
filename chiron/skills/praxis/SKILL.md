---
name: praxis
description: Workspaces that act — what one can do in a workspace designed by Genesis. The anatomy of a gesture (verb name / intention / when / input / output / sequence / safeguards / source method), the four forms of codified knowledge (grammar / method / gesture / automaton) discriminated by topology, ORIENT as the gesture-zero, the µ namespace (LOCAL for internal gestures, ADMIN for external, METHODS for copied methods), and Nushell as the shared automaton language between C and Si. Use when codifying actions in a workspace, designing a pipeline of gestures, deciding what belongs as a gesture vs an automaton, or thinking about how an operator enters and acts within a workspace.
---

# Praxis

*Workspaces that act.*

A grammar for operating inside workspaces designed with Genesis — what can be done there, how the infrastructure supports action, and how an operator enters.

Genesis designs the workspace. Praxis animates it.

---

## Founding Conviction

**Structure without action is inert.** A workspace that explains what is there but not what can be done forces the operator to guess. Action must be named, documented, and discoverable — with the same clarity as structure. A workspace animated by Praxis says *what can be done* as clearly as Genesis says *what is there*.

---

## Four Positions

Praxis takes an explicit stance on four tensions that run through its conventions:

**Prescribed core, emergent periphery.** The anatomy of a gesture, the nature × scope matrix, ORIENT, the neutrality test — that is the core, non-negotiable. Everything else emerges from need: the µ folders appear when there is something to put in them, automatons when there is something to automate. No template to fill. Unity is in the conventions, not in the form — two Praxis workspaces can look very different.

**The anatomy is Praxis, the gestures belong to their authors.** Praxis owns the frame (the eight-facet anatomy). Methods and workspaces own the gestures themselves. Praxis does not copy portable gestures into the consuming workspace — it recognises them by reference. No centralised catalogue of every gesture in the ecosystem.

**Designed for the centaur, functional without.** The C/Si tandem is the design intent. Nushell is chosen for co-readability. Code discipline serves collaboration. Si's operational capabilities are documented. But the neutrality test guarantees that every gesture works without Si — the centaur is the optimised case, not the only case.

**Document first, automate when the pattern stabilises.** The natural path: observe → document (gesture) → stabilise → automate (automaton). An automaton written too early freezes a decision that should remain fluid. The shift happens when judgment disappears. The reverse movement (automaton → gesture) happens when the context becomes more complex. Automation coverage stays partial — by design.

---

## I — The Four Forms of Codified Knowledge

*What the ecosystem produces, where it lives, how to tell them apart.*

The ecosystem produces four forms. The discriminating criterion is **topology**: if you can be "somewhere" in the form and advance — it is a method. If you apply it without traversing it — it is a grammar.

| Form | Question | Topology | Where it lives |
|------|----------|----------|----------------|
| **Grammar** | How to structure / collaborate? | No — you apply it | Ambient — in the agent, in the structure |
| **Method** | How to think / produce / practise? | Yes — levels, flow | Declared in the workspace's README |
| **Gesture** | What can we do here, now? | No — situated action | `µ. LOCAL/` and `µ. ADMIN/` |
| **Automaton** | Execute without judgment? | No — mechanical execution | `local/` and `admin/` |

Grammars (Genesis, Kentauros, Praxis) are ambient — you do not traverse them, you apply them everywhere. Methods (Organon, Elasis, Kairos) have a topology — you are somewhere in them, you follow a flow. Gestures are situated actions that require judgment. Automatons are scripts that execute mechanically.

The taxonomy is Praxis. The declaration of these forms in a workspace (README, µ namespace) is a Genesis convention.

---

## II — The Gesture

*What can be done — named, documented, executable.*

### Anatomy

A gesture is a named, repeatable, executable action that any competent operator can perform. Every gesture follows the same anatomy:

| Facet | Role |
|-------|------|
| **Name** (verb) | The action, as imperative. OBSERVE. FORGE. DELIVER. |
| **Intention** | What this gesture accomplishes — one line. |
| **When** | Trigger — what situation calls for this gesture. |
| **Input** | What must be present before starting. |
| **Output** | What exists when the gesture is complete. |
| **Sequence** | The steps — the heart of the gesture. |
| **Safeguards** | What to avoid, what not to confuse it with. |
| **Source method** | Which method this gesture comes from, if applicable. |

The name is always a verb — an imperative. The name is the action, not the concept.

### Neutrality

A well-written gesture is executable by C alone, Si alone, or both together. This is a design constraint.

The test: an operator arriving cold in this workspace, reading only the gesture file and its prerequisites, can they execute it correctly? If yes — it is a gesture. If no — something is still implicit. A gesture only its author can execute is tacit knowledge, not a gesture.

### Distribution

Gestures are distributed across three locations:

| Type | Where it lives | Owner | Example |
|------|----------------|-------|---------|
| **Portable** | Method's deliverable (`GESTURES/`) | The method's author | OBSERVE in Organon |
| **Internal situated** | `µ. LOCAL/GESTURES/` of the workspace | The workspace operator | ASSESS in Tekton |
| **External situated** | `µ. ADMIN/GESTURES/` of the workspace | The workspace operator | PUBLISH in Tekton |

Portable gestures are used by reference — no copy in the consuming workspace. Situated gestures coexist with the portable gestures of the followed method.

### Pipeline

When gestures are independent — each invocable without the others — a README in `GESTURES/` listing them is enough.

When gestures form a sequence — output of one = input of the next, with decision gates — a `PLAYBOOK.md` appears. The PLAYBOOK makes the pipeline visible: states, gates, entry points, recovery loops. Organon is the example: twelve gestures forming a cycle with gates between each transition.

The criterion is **sequentiality with gates**, not the number of gestures.

### What it is not

A gesture is not a **Kentauros protocol** (dialogical — governs the exchange between intelligences). A gesture is not an **automaton** (mechanical — executes without judgment). A gesture is not a **method** (topological — defines levels and flows). A gesture requires tekhnē — judgment, adaptation, reading of the situation. It can *invoke* automatons in its sequence, but it does not reduce to them.

---

## III — The Operational Infrastructure

*Where gestures and scripts live — the nature × scope matrix.*

### Two Axes

Two axes structure all operational infrastructure:

**Nature** — tekhnē (judgment required) vs automaton (mechanical execution). A gesture documents an action that requires adaptation and decision. An automaton executes mechanically. The two collaborate: a gesture can invoke an automaton in its sequence.

**Scope** — internal (closed circuit, result inside the workspace) vs external (crosses a frontier, affects other workspaces). One must be admin to touch the outside.

### The Matrix

| | Tekhnē (documented gestures) | Automaton (executable scripts) |
|---|---|---|
| **Internal scope** | µ. LOCAL/ | local/ |
| **External scope** | µ. ADMIN/ | admin/ |

A gesture in µ. LOCAL/ can invoke a script from `local/`. A gesture in µ. ADMIN/ can invoke a script from `admin/`. The gesture adds judgment — the automaton executes.

### The µ Namespace

Three folders share the µ prefix, each answering a question:

| Folder | Question | Presence |
|--------|----------|----------|
| µ. LOCAL/ | What internal gestures can be executed here? | When internal gestures are codified |
| µ. ADMIN/ | What gestures affect the outside? | When the workspace publishes or propagates |
| µ. METHODS/ | What methods are copied locally? | Only when methods are copied (maturity marker) |

Each folder appears when the need exists — not before. The namespace is not a template to fill. A workspace without codified gestures has no µ. LOCAL/. A workspace that does not publish has no µ. ADMIN/.

The Unicode collation places `µ.` folders after `z.` — content first, infrastructure after.

### Internal Structure of µ. LOCAL/ and µ. ADMIN/

Both follow the same structure:

```
µ. LOCAL/  (or µ. ADMIN/)
├── README.md           → which gestures exist, start here
├── PLAYBOOK.md         → optional: pipeline, states, gates
├── GESTURES/
│   ├── README.md       → list and description of each gesture
│   └── {GESTURE}.md    → one file per gesture, verb as name
└── templates/          → artefacts consumed by the gestures
```

Files in `GESTURES/` are UPPERCASE — it is an interface, not a workspace.

### Method Declaration

Methods followed by reference are declared in the README using Genesis links — not in a physical folder. `µ. METHODS/` only appears when methods are copied locally (Genesis convention: link or copy). The shift from reference to copy is a conscious act.

---

## IV — Orientation

*How an operator enters the workspace.*

### ORIENT — The Gesture-Zero

ORIENT precedes all other gestures. It is the sequence by which an operator passes from "I have a filesystem" to "I know where I am and what I can do."

**Sequence:**

1. **Read the README** — the hub. It declares what this workspace is, which grammars and methods it follows, which projects exist, and where the gestures live.
2. If the README points to **µ. LOCAL/** and/or **µ. ADMIN/** — read them. Discover the available gestures and their scopes.
3. **Ask for the task.**

That is all. Everything is discovered from the README.

### Constraints

Follow the index, never scan recursively. `find` and `ls -R` are not orientation tools. The README is the only entry point — an operator who reads only the README knows everything they need.

A familiar operator can skip to step 3. ORIENT is a gesture, not a ritual. But when the context is lost — new session, new operator, significant time elapsed — ORIENT is the recovery path.

### Agent Bootstrap

An agent (Si) enters the ecosystem in two steps:

1. **Load Kentauros** — the collaboration grammar. How it collaborates, not where it works.
2. **ORIENT** — read the README. Discover the workspace.

Kentauros says: *read the README.* Genesis guarantees: *the README is a self-sufficient hub.* Praxis points to µ. LOCAL/ and µ. ADMIN/ in it. The README is the interface between the three worlds.

If orientation fails, the README is at fault — not the operator.

---

## V — The Automaton Layer

*The shared technical ground — how scripts are built.*

### Founding Principle

Kentauros lays down the principle: an automaton has value only if it is accessible to both partners — C and Si. A script only C can write is captive knowledge. A script Si produces and C cannot inspect is a black box. What one produces, the other must be able to read, execute, modify.

### Nushell as the Primary Language

Nushell is the primary choice for automatons:

- **Native structured data** — typed pipelines, tables, records
- **Readable by C and Si** — explicit syntax, close to structured thought
- **Modular** — module system (`mod.nu`, `use local`)
- **Cross-platform** — macOS, Linux, Windows

Python complements for complex computation (Polars, pandas, ML). The criterion: filesystem, pipeline, structured transformation → Nushell. Computation, data science → Python.

### Conventions

**Entry point:** `mod.nu` in each folder. Usage: `use local` or `use admin` from the workspace root.

```
Workspace/
├── local/          → internal automatons
│   ├── mod.nu
│   └── deliver.nu
├── admin/          → external automatons
│   ├── mod.nu
│   └── publish.nu
└── ...
```

**Dry-run by default** for admin automatons (external scope). `--force (-f)` to execute. Local automatons can be more permissive — their scope is contained.

### Code Discipline

Scripts deserve the same discipline as any codebase: modularisation (small functions, one responsibility per command), readability (clear naming, comments where intent is not obvious), tests (especially for batch or admin operations), shared libraries (extract reusable patterns rather than duplicating).

Si is co-author of automatons. The shared ground requires that what Si produces be readable and maintainable by C, and vice versa.

---

## Activable Capabilities

Like Genesis, Praxis has optional capabilities that activate when the need manifests:

- **Si's operational capabilities** — tooled recipes Si uses natively with its tools (Obsidian URI, Mermaid, inline SVG, Chrome MCP patterns). Activable when Si operates the workspace. The catalogue grows with practice.
- **Formalised pipeline** — a PLAYBOOK appears when gestures form a sequence with gates. Not every workspace needs one.

---

## What Praxis Does Not Prescribe

- **Workspace structure** — that is Genesis
- **Collaboration protocol** — that is Kentauros
- **Concrete gestures** — they belong to the methods and the workspaces
- **Content** — Praxis structures action, not thought
- **Exhaustive automation** — partial coverage is a choice, not a defect

---

## The Test

A competent operator — C or Si — arrives in the workspace. Can they:

- Know the methods and grammars in play — from the README
- Know the available gestures and their scopes — from µ. LOCAL/ and µ. ADMIN/
- Execute a gesture correctly — from the gesture file alone
- Know the available automatons — from the README or µ

If yes — the workspace is animated by Praxis.

---

## Relation to Genesis

Genesis designs the workspace — *what it contains*. Praxis animates the workspace — *what can be done in it*. The two are independent in their evolution: Genesis can add structural conventions without impact on Praxis. Praxis can refine the gesture anatomy without impact on Genesis. The README is the interface contract.

A workspace can follow Genesis without Praxis — no codified gestures, but a readable structure. A workspace cannot follow Praxis without Genesis — the README as hub, naming conventions, exclusion zones, all of that is Genesis.

The boundary: Genesis lays down the **structural** conventions (what is there). Praxis lays down the **operational** conventions (what can be done).

---

## Characteristics

A workspace animated by Praxis tends to have:

- **README as entry door** — declares everything, points to µ. LOCAL/ and µ. ADMIN/
- **Documented gestures** — codified in µ. LOCAL/ and µ. ADMIN/, any operator can execute
- **Companion automatons** — scripts in local/ and admin/, invoked by gestures
- **Emergent µ namespace** — infrastructure separated from content, grows from need
- **Index-based orientation** — follow the README, never scan recursively
- **Shared technical ground** — Nushell, code discipline, C/Si co-maintenance
- **Two-step bootstrap** — load Kentauros, read the README

---

*Genesis designs the workspace. Praxis animates it.*
