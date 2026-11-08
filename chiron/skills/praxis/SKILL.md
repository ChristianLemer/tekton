---
name: praxis
description: 'Use when a recurring action deserves a name and a documented shape; when you must decide whether something is a gesture (judgment required) or an automaton (judgment gone) — the answer decides who executes it; when a pipeline of gestures is being laid out and their order matters; when an operator or an agent has to enter a workspace cold and act without a briefing; when a script is about to be written and should be co-readable rather than merely correct; and before forging anything at all — search before forging, look for the passage that already exists. Not where a file belongs — that is Genesis. Not the conduct of a conversation — that is Dialektikē: a Praxis gesture stays in the repository, a Dialektikē gesture exists only in the exchange.'
---
# Praxis

*Workspaces that act.*

Genesis designs the workspace — how to lay it out. Praxis animates it — how to act in it: gestures, the µ namespace, entering and asking, the automaton layer. A **grammar** by its own taxonomy — applied everywhere, never traversed. For any operator, C and/or Si.

**Structure without action is inert.** A workspace that explains what is there but not what can be done forces the operator to guess. A workspace animated by Praxis says *what can be done* as clearly as Genesis says *what is there*.

---

## Six Positions

Each is a choice, and the price it accepts.

1. **Prescribed core, emergent periphery.** Prescribed: the eight-facet anatomy, the nature × scope matrix, ORIENT, ASK, the neutrality test. Everything else — µ folders, automatons, recipes — appears when needed, never from a template. *Price:* two Praxis workspaces can look very different; unity lives in the conventions, not the shape.
2. **The anatomy is Praxis; gestures belong to their authors.** Methods own their portable gestures, workspaces their situated ones. Praxis owns only its own two — ORIENT and ASK, how one enters and how one asks — shared by every workspace. *Price:* no central catalogue of the ecosystem's gestures.
3. **Designed for the centaur, working without it.** Nushell, code discipline, Si's recipes exist for the C/Si tandem; the neutrality test guarantees every gesture runs without Si. *Price:* some parts matter less to a human alone — they are not diluted for that.
4. **Document first, automate when the pattern settles.** Observe → document (gesture) → stabilise → automate. An automaton written too early freezes a decision that should stay fluid; one that no longer copes becomes a gesture again. *Price:* automation coverage stays partial, by design.
5. **Search before forging.** Once the objective is set, look for what exists, evaluate, then integrate or forge what is missing — do not build a bridge where a ford exists. At runtime, probe what you consume and adapt to its absence. *Price:* dependence on tools you do not control; knowing what exists outside takes active watch.
6. **Orient inside, ask outside.** *Inside one reads, outside one asks.* Within the workspace, re-orient at every threshold; beyond its frontier, ask the other workspace's agent. *Price:* outside, you depend on the other agent's availability and thresholds — a detour, latency, an interpretation you don't control; inside, every threshold read weighs on the session's context.

---

## The Core

### Anatomy of a gesture

A **gesture** is a named, repeatable action that requires a present operator — one who reads, decides, adapts. Tekhnē, not mechanism. Every gesture, wherever it lives, has the same anatomy:

| Facet | Role |
|---|---|
| **Name** | A verb, imperative. OBSERVE. FORGE. ORIENT. |
| **Intention** | What it accomplishes — one line |
| **When** | The situation that calls for it |
| **Input** | What must be present before starting |
| **Output** | What exists when it is done |
| **Sequence** | The steps — the heart of the gesture |
| **Guardrails** | What to avoid, what not to confuse it with |
| **Source method** | Where it comes from, if anywhere |

**Neutrality.** A well-written gesture runs for C alone, Si alone, or both. *Test: can an operator arriving cold, reading only the gesture file and its prerequisites, execute it correctly?* If not, something is still implicit. A gesture only its author can run is tacit knowledge, not a gesture.

### Nature × scope

| | Tekhnē (gestures) | Automaton (scripts) |
|---|---|---|
| **Internal** — stays in the workspace | `µ. LOCAL/` | `local/` |
| **External** — crosses a frontier | `µ. ADMIN/` | `admin/` |

A gesture may invoke the scripts of its row: the gesture judges, the automaton executes. The frame is fixed; its folders appear one by one.

### ORIENT — crossing a threshold

There is no single entry point but **thresholds**: the README for the human, `AGENTS.md` for the agent — what serves the agent only, starting with the method to load. Each refers to the README, the hub. Where the agent is launched, its threshold is **received** — the harness loads it, no gesture. Going down, nothing is received: crossing into a folder handed to a method means **reading** its threshold — an act, so it can be omitted. From threshold to threshold the grammars stay; the method changes. One descends progressively without launching a new agent.

- **Intention** — discover a workspace, or the folder one descends into, and become operational.
- **When** — arriving somewhere unknown or long unvisited; at every threshold crossed into a folder handed to a method.
- **Input** — a Genesis folder and its thresholds.
- **Output** — the operator knows what this folder is, which method it follows — loaded — and which gestures are available. Ready for a task.
- **Sequence** — 1. The agent's threshold, received or read: is the method it declares loaded? If not, say so and stop. 2. Read the README. 3. If it points to codified gestures (`µ. LOCAL/`, `µ. ADMIN/`), read them. 4. Ask for the task.
- **Guardrails** — Follow the thresholds, never scan: `find` and `ls -R` are not orientation tools. Crossing a threshold is reading, not moving — the working directory stays put. If the declared method cannot load, launch the agent where the work is. An undeclared neighbouring root is not a threshold; it is another workspace. A familiar operator skips to the task — a gesture, not a ritual.
- **Source method** — Genesis: orientation consumes the structure Genesis creates.

ORIENT is gesture zero, and the way back when context is lost. If it fails, the threshold is at fault, not the operator.

### ASK — beyond the frontier

At the frontier the relation inverts. One does not cross another workspace's threshold: one addresses its agent, which orients at home and hands back a result already processed by its own method. One stays home. Not a variant of ORIENT — a gesture of its own, and a frequent one.

- **Intention** — obtain what another workspace holds, without entering it.
- **When** — the need lies beyond the frontier: a neighbouring root, a repository alongside, another space that explains itself.
- **Input** — the need, with the context the other side needs to understand it. A reachable agent there.
- **Output** — a result processed on the other side, in a form consumable at home.
- **Sequence** — 1. Recognise the need is outside — not a threshold of this workspace. 2. Phrase the need, not the path: what and why, never where to find it over there. 3. Address it to the other workspace's agent. 4. Receive and check: does it answer? If not, ask again — do not go and look.
- **Guardrails** — Do not read for yourself what the other agent knows how to find: you would read a place without its thresholds. Depend on the workspace, not its interior — it can reorganise without breaking the request. With no reachable agent, ask the operator; do not inspect.
- **Source method** — Genesis: one does not point into another workspace, one asks it.

Conducting the exchange once open is Dialektikē; how the other agent is reached is the tool of the moment.

---

## Four Forms of Codified Knowledge

The criterion is **topology**: can one be *somewhere* in it?

| Form | Topology | Where it lives |
|---|---|---|
| **Grammar** | No — applied everywhere | Carried by the operator |
| **Method** | Yes — levels, flows, traversed | Declared by the place, at both thresholds |
| **Gesture** | No — a situated action with judgment | `µ. LOCAL/`, `µ. ADMIN/` |
| **Automaton** | No — mechanical execution | `local/`, `admin/` |

A grammar travels with the operator. A method is learnt by crossing the threshold of the place that declares it. The taxonomy is Praxis; declaring the forms in a workspace is Genesis.

## Where Gestures Live

| Kind | Where | Owner |
|---|---|---|
| **Portable** | The method's deliverable (`GESTURES/`) | The method's author |
| **Situated, internal** | `µ. LOCAL/GESTURES/` | The workspace operator |
| **Situated, external** | `µ. ADMIN/GESTURES/` | The workspace operator |

Portable gestures are used **by reference**, never copied, alongside situated ones. Independent gestures need only a `GESTURES/README.md`. When they form a sequence — one's output the next's input, with decisions between — a `PLAYBOOK.md` shows states, gates, entry points, loops. The criterion is **sequentiality with gates**, not count.

**What a gesture is not.** Not a Kentauros protocol — those govern the exchange between intelligences; a gesture acts on a ground. Not an automaton — it needs judgment, though it may invoke one. Not a method — a method defines a topology; a gesture is a verb within it.

## The µ Namespace

Methodological infrastructure — neither domain nor deliverable. Sorted after `z.`: content first.

| Folder | Question | Present when |
|---|---|---|
| `µ. LOCAL/` | Which gestures run here, closed-circuit? | Internal gestures are codified |
| `µ. ADMIN/` | Which gestures affect the outside? | The workspace publishes or propagates |
| `µ. METHODS/` | Which methods are held as local copies? | Methods are copied — a conscious act |

```
µ. LOCAL/  (µ. ADMIN/ alike)
├── README.md        which gestures, start here
├── PLAYBOOK.md      optional: pipeline, states, gates
├── GESTURES/
│   ├── README.md    list, one line each
│   └── {GESTURE}.md one per gesture, UPPERCASE — an interface
└── templates/       artefacts the gestures consume
```

Nothing is created speculatively.

## The Automaton Layer

An automaton is worth something only if both partners can read, run and modify it (Kentauros). **Nushell** is the main language — structured, explicit, modular, cross-platform; Python for heavy computation. Entry point `mod.nu`, used as `use local` / `use admin`. **Dry-run by default** for `admin/`, `--force` to execute. Recurring script shapes earn a named model.

**Poros.** Gestures and automatons consume what the workspace does not forge — a CLI, an MCP server, an API. A *poros* (πόρος) is found, probed, optional; its absence, *aporia*, triggers the baseline, not a failure — the familiar probe-and-adapt of progressive enhancement, capability probing, `command -v`. The operator does the same for itself: **once per session**, outside ORIENT, it probes its machine — real tools, real shell, present CLIs — and treats absence as reduced scope. The report is recomputed, never engraved. Praxis gives the probe its form; the persona decides to mobilise it.

**Si's recipes** — small tooled techniques, not a fifth form, lost between sessions unless captured.

## What Praxis Does Not Prescribe

- **Structure** — Genesis: the partition, naming, the thresholds themselves.
- **Collaboration** — Kentauros.
- **The bootstrap** — the agent's persona; Praxis gives orientation and probe their form, not their mobilisation.
- **The exchange** — Dialektikē, once ASK has opened it.
- **Content** — gestures and scripts belong to methods and workspaces; automation stays partial.

## The Test

An operator arriving cold, reading from the thresholds — README for the human, `AGENTS.md` for the agent — can:

- name the method at play, and have it loaded;
- know the available gestures — from `µ. LOCAL/`, `µ. ADMIN/`;
- execute a gesture correctly — from its file alone;
- know the automatons — from the README or µ;
- know where the workspace ends, and whom to ask beyond.

## Relation to Genesis

Genesis lays down the **structural** conventions — what is there; Praxis the **operational** ones — what can be done. The **thresholds** are their interface: Genesis lays them down and says one does not point into another workspace; Praxis says how they are crossed (ORIENT) and how one asks beyond (ASK). Genesis without Praxis is a readable workspace; Praxis without Genesis is impossible. They evolve independently.

## References

| File | Content |
|---|---|
| `references/automaton.md` | Nushell conventions, code discipline, recurring shapes, poros and probe mechanics |
| `references/recipes.md` | Si's operational recipes |
| `lexicon.md` | Multilingual correspondences |

---

*Genesis designs the workspace. Praxis animates it.*
