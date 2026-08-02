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

## Five Positions

Praxis takes an explicit stance on five tensions that run through its conventions:

**Prescribed core, emergent periphery.** The gesture anatomy, the nature × scope matrix, ORIENT, the neutrality test — that is the core, non-negotiable. Everything else emerges from need: µ directories appear when there is something to put in them, automatons when there is something to automate. No template to fill in. Unity lies in the conventions, not in the form — two Praxis workspaces may look very different.

**The anatomy is Praxis, the gestures belong to their authors.** Praxis owns the frame (the eight-facet anatomy). Methods and workspaces own the gestures themselves. Organon defines OBSERVE. Tekton defines ASSESS. Praxis does not copy portable gestures into the workspace — it recognises them by reference. No centralised catalogue of every gesture in the ecosystem.

**Designed for the centaur, functional without.** The C/Si tandem is the design intent. Nushell is chosen for co-readability. Code discipline serves collaboration. Si's operational capabilities are documented. But the neutrality test guarantees that every gesture works without Si — the centaur is the optimised case, not the only case.

**Document first, automate when the pattern stabilises.** The natural path: observe → document (gesture) → stabilise → automate (automaton). An automaton written too early freezes a decision that should stay fluid. The switch happens when judgment disappears. The reverse move (automaton → gesture) happens when the context grows complex. Automation coverage stays partial — by design.

**Search before forging.** The *poros* (πόρος) — the passage, the resource found. Before forging, look for what exists: tools, patterns, solutions. Enquire, evaluate, integrate what is found when it answers the need. Do not build a bridge where a ford exists. At runtime, automatons probe the *poroi* (available external tools) and adapt to their presence or absence — the baseline always works, the poros enriches.

---

## I — The Four Forms of Codified Knowledge

*What the ecosystem produces, where it lives, how to tell them apart.*

The ecosystem produces four forms. The discriminating criterion is **topology**: if you can be "somewhere" inside the form and move forward — it is a method. If you apply it without traversing it — it is a grammar.

| Form | Question | Topology | Where it lives |
|-------|----------|-----------|-----------|
| **Grammar** | How to structure / collaborate? | No — you apply it | Ambient — in the agent, in the structure |
| **Method** | How to think / produce / practise? | Yes — levels, flows | Declared in the workspace README |
| **Gesture** | What can be done here, now? | No — a situated action | `µ. LOCAL/` and `µ. ADMIN/` |
| **Automaton** | Execute without judgment? | No — mechanical execution | `local/` and `admin/` |

Grammars (Genesis, Kentauros, Praxis) are ambient — you do not traverse them, you apply them everywhere. Methods (Organon, Elasis, Kairos) have a topology — you are somewhere inside, following a flow. Gestures are situated actions requiring judgment. Automatons are scripts that execute mechanically.

The taxonomy is Praxis. Declaring these forms in the workspace (README, µ namespace) is a Genesis convention.

---

## II — The Gesture

*What can be done — named, documented, executable.*

### Anatomy

A gesture is a named, repeatable action, executable by any competent operator. Every gesture follows the same anatomy:

| Facet | Role |
|---------|------|
| **Name** (verb) | The action, imperative. OBSERVE. FORGE. DELIVER. |
| **Intention** | What this gesture accomplishes — one line. |
| **When** | Trigger — which situation calls for this gesture. |
| **Input** | What must be present before starting. |
| **Output** | What exists once the gesture is complete. |
| **Sequence** | The steps — the heart of the gesture. |
| **Guardrails** | What to avoid, what not to confuse it with. |
| **Source method** | Which method this gesture comes from, if any. |

The name is always a verb — an imperative. The name is the action, not the concept.

### Neutrality

A well-written gesture is executable by C alone, Si alone, or both together. This is a design constraint.

The test: can an operator arriving cold in this workspace, reading only the gesture file and its prerequisites, execute it correctly? If yes — it is a gesture. If no — something is still implicit. A gesture only its author can execute is tacit knowledge, not a gesture.

### Distribution

Gestures are distributed across three places:

| Type | Where it lives | Owner | Example |
|------|-----------|-------------|---------|
| **Portable** | The method's deliverable (`GESTURES/`) | The method's author | OBSERVE in Organon |
| **Situated, internal** | The workspace's `µ. LOCAL/GESTURES/` | The workspace operator | ASSESS in Tekton |
| **Situated, external** | The workspace's `µ. ADMIN/GESTURES/` | The workspace operator | PUBLISH in Tekton |

Portable gestures are used by reference — never copied into the consuming workspace. Situated gestures coexist with the portable gestures of the method being followed.

### Pipeline

When gestures are independent — each invocable without the others — a README in `GESTURES/` listing them is enough.

When gestures form a sequence — the output of one is the input of the next, with decision gates — a `PLAYBOOK.md` appears. The PLAYBOOK makes the pipeline visible: states, gates, entry points, recovery loops. Organon is the example: twelve gestures forming a cycle with gates between each transition.

The criterion is **sequentiality with gates**, not the number of gestures.

### What it is not

A gesture is not a **Kentauros protocol** (dialogical — it governs the exchange between intelligences). A gesture is not an **automaton** (mechanical — it executes without judgment). A gesture is not a **method** (topological — it defines levels and flows). A gesture requires *tekhnē* — judgment, adaptation, reading the situation. It may *invoke* automatons within its sequence, but it does not reduce to them.

---

## III — The Operational Infrastructure

*Where gestures and scripts live — the nature × scope matrix.*

### Two Axes

Two axes structure the whole operational infrastructure:

**Nature** — *tekhnē* (judgment required) vs automaton (mechanical execution). A gesture documents an action requiring adaptation and decision. An automaton executes mechanically. The two collaborate: a gesture may invoke an automaton within its sequence.

**Scope** — internal (closed circuit, the result stays in the workspace) vs external (crosses a boundary, affects other workspaces). Touching the outside requires admin.

### The Matrix

| | Tekhnē (documented gestures) | Automaton (executable scripts) |
|---|---|---|
| **Internal scope** | µ. LOCAL/ | local/ |
| **External scope** | µ. ADMIN/ | admin/ |

A gesture in µ. LOCAL/ may invoke a script from `local/`. A gesture in µ. ADMIN/ may invoke a script from `admin/`. The gesture adds judgment — the automaton executes.

### The µ Namespace

Three directories share the µ prefix, each answering one question:

| Directory | Question | Presence |
|---------|----------|----------|
| µ. LOCAL/ | Which internal gestures can be executed here? | When internal gestures are codified |
| µ. ADMIN/ | Which gestures affect the outside? | When the workspace publishes or propagates |
| µ. METHODS/ | Which methods are copied locally? | Only when methods are copied (maturity marker) |

Each directory appears when the need exists — not before. The namespace is not a template to fill in. A workspace with no codified gestures has no µ. LOCAL/. A workspace that does not publish has no µ. ADMIN/.

Unicode collation places `µ.` directories after `z.` — content first, infrastructure second.

### Internal Structure of µ. LOCAL/ and µ. ADMIN/

Both follow the same structure:

```
µ. LOCAL/  (or µ. ADMIN/)
├── README.md           → which gestures exist, start here
├── PLAYBOOK.md         → optional: pipeline, states, gates
├── GESTURES/
│   ├── README.md       → list and description of each gesture
│   └── {GESTURE}.md    → one file per gesture, verb as name
└── templates/          → artifacts consumed by the gestures
```

Files in `GESTURES/` are UPPERCASE — this is an interface, not a workspace.

### Method Declaration

Methods followed by reference are declared in the README with Genesis links — not in a physical directory. `µ. METHODS/` appears only when methods are copied locally (Genesis convention: link or copy). Moving from reference to copy is a conscious act.

---

## IV — Orientation

*How an operator enters the workspace.*

### ORIENT — the gesture-zero

ORIENT precedes every other gesture. It is the sequence by which an operator moves from "I have a filesystem" to "I know where I am and what I can do".

**Sequence:**

1. **Read the README** — the hub. It declares what this workspace is, which grammars and methods it follows, which projects exist, and where the gestures live.
2. If the README points to **µ. LOCAL/** and/or **µ. ADMIN/** — read them. Discover the available gestures and their scopes.
3. **Ask for the task.**

That is all. Everything is discovered from the README.

### Constraints

Follow the index, never scan recursively. `find` and `ls -R` are not orientation tools. The README is the only entry point — an operator who reads only the README knows everything they need.

A familiar operator may jump to step 3. ORIENT is a gesture, not a ritual. But when context is lost — new session, new operator, significant time elapsed — ORIENT is the recovery path.

### Agent Bootstrap

An agent (Si) enters the ecosystem in two steps:

1. **Load Kentauros** — the collaboration grammar. How it collaborates, not where it works.
2. **ORIENT** — read the README. Discover the workspace.

Kentauros says: *read the README.* Genesis guarantees: *the README is a self-sufficient hub.* Praxis points from there to µ. LOCAL/ and µ. ADMIN/. The README is the interface between the three worlds.

If orientation fails, the README is at fault — not the operator.

---

## V — The Automaton Layer

*The shared technical ground — how scripts are built.*

### Founding Principle

Kentauros states the principle: an automaton only has value if it is accessible to both partners — C and Si. A script only C can write is captive knowledge. A script Si produces and C cannot inspect is a black box. What one produces, the other must be able to read, run, and modify.

### Nushell as the Primary Language

Nushell is the primary choice for automatons:

- **Native structured data** — typed pipelines, tables, records
- **Readable by C and Si** — explicit syntax, close to structured thought
- **Modular** — module system (`mod.nu`, `use local`)
- **Cross-platform** — macOS, Linux, Windows

Python complements it for complex computation (Polars, pandas, ML). The criterion: filesystem, pipeline, structured transformation → Nushell. Computation, data science → Python.

### Conventions

**Entry point:** `mod.nu` in each directory. Usage: `use local` or `use admin` from the root.

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

**Dry-run by default** for admin automatons (external scope). `--force (-f)` to execute. Local automatons may be more permissive — their scope is confined.

### Code Discipline

Scripts deserve the same discipline as any codebase: modularisation (small functions, one responsibility per command), readability (clear naming, comments where the intention is not obvious), tests (especially for batch or admin operations), shared libraries (extract reusable patterns rather than duplicate).

Si is a co-author of automatons. Common ground presupposes that what Si produces is readable and maintainable by C, and vice versa. See references/automaton for the detailed conventions.

### Poroi — Optional External Dependencies

An automaton may consume tools it does not control — *poroi* (πόροι). An MCP server, a CLI, an external API. These resources are found, not forged. They may be absent.

The discipline: declare the poroi, probe them at launch, and handle absence (*aporia*) with a fallback to baseline operation. Absence is not an error — it is a state that narrows the scope.

The mechanism is well known: progressive enhancement (enrich if available), capability probing (MCP `tools/list`), `command -v` (Unix). What Praxis prescribes: name it, make it explicit, do not crash when an external tool is missing.

---

## Activable Capabilities

Like Genesis, Praxis has optional capabilities that activate when the need appears:

- **Si's operational capabilities** — tooled recipes Si uses natively with its own tools (Obsidian URIs, Mermaid, inline SVG, Chrome MCP patterns). Activable when Si operates the workspace. The catalogue grows with practice. See references/recipes.
- **Formalised pipeline** — a PLAYBOOK appears when gestures form a sequence with gates. Not every workspace needs one.

---

## What Praxis Does Not Prescribe

- **The workspace structure** — that is Genesis
- **The collaboration protocol** — that is Kentauros
- **Concrete gestures** — they belong to methods and workspaces
- **Content** — Praxis structures action, not thought
- **Exhaustive automation** — partial coverage is a choice, not a defect

---

## The Test

A competent operator — C or Si — arrives in the workspace. Can they:

- Know which methods and grammars are in play — from the README
- Know the available gestures and their scopes — from µ. LOCAL/ and µ. ADMIN/
- Execute a gesture correctly — from the gesture file alone
- Know the available automatons — from the README or µ

If yes — the workspace is animated by Praxis.

---

## Relation to Genesis

Genesis designs the workspace — *what it contains*. Praxis animates the workspace — *what can be done in it*. The two evolve independently: Genesis can add structural conventions without affecting Praxis. Praxis can refine the gesture anatomy without affecting Genesis. The README is the interface contract.

A workspace can follow Genesis without Praxis — no codified gestures, but a readable structure. A workspace cannot follow Praxis without Genesis — the README as hub, the naming conventions, the excluded zones, all of that is Genesis.

The boundary: Genesis lays down the **structural** conventions (what is there). Praxis lays down the **operational** conventions (what can be done).

---

## Characteristics

A workspace animated by Praxis tends to have:

- **README as the front door** — declares everything, points to µ. LOCAL/ and µ. ADMIN/
- **Documented gestures** — codified in µ. LOCAL/ and µ. ADMIN/, executable by any operator
- **Companion automatons** — scripts in local/ and admin/, invoked by the gestures
- **An emergent µ namespace** — infrastructure separated from content, growing from need
- **Orientation by index** — follow the README, never scan recursively
- **Shared technical ground** — Nushell, code discipline, C/Si co-maintenance
- **Two-step bootstrap** — load Kentauros, read the README

---

## References

| File | Content |
|---------|---------|
| lexicon | Terminology correspondences |
| references/automaton | Detailed Nushell conventions, code discipline, patterns |
| references/recipes | Si's operational capabilities, tooled recipes |

---

*Genesis designs the workspace. Praxis animates it.*
