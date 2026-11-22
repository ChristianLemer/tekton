# The automaton layer

*A shared technical ground — how scripts are built, by whom, with what.*

Loaded on demand from `PRAXIS.md`. The principle is Kentauros; the implementation is Praxis.

---

## The founding principle

An automaton is worth something only if both partners — C and Si — can reach it. A script only C can write, that Si can neither read nor modify, is **captive knowledge**. A script Si produces that C cannot inspect is a **black box**. Whatever one produces, the other must be able to read, run and modify.

The µ namespace says where automatons live (`local/`, `admin/`) and their scope. This file says how they are built so that both can work on them.

## Language

**Nushell** is the main language:

- **Native structured data** — typed pipelines, tables, records; no ad hoc string parsing.
- **Readable by C and Si** — explicit syntax, close to structured thought; less implicit than bash.
- **Modular** — a module system (`mod.nu`, `use local`); an automaton is not a monolith.
- **Cross-platform** — macOS, Linux, Windows.

**Python** complements it for heavy data work — dataframes, computation, ML. **bash** is a universal fallback, less readable, less structured.

Dividing line: filesystem, pipelines, structured transformation → Nushell. Computation, data science, ML → Python. The line is sometimes blurred; the tendency is clear.

Nushell is a centaur choice: without Si, bash would do for most automatons. It is chosen for co-readability.

## Conventions

**Entry point:** a `mod.nu` in each folder. Used as `use local` or `use admin` from the workspace root.

```
<workspace>/
├── local/          internal automatons
│   ├── mod.nu      entry point
│   └── validate.nu
├── admin/          external automatons
│   ├── mod.nu      entry point
│   └── publish.nu
└── ...
```

**Dry-run by default** for `admin/` (external scope); `--force` (`-f`) to execute. `local/` can be more permissive — its scope is confined. Even automated, an admin action keeps a human checkpoint.

## Code discipline

Scripts in `local/` and `admin/` are code and deserve a codebase's discipline:

- **Modularisation** — small functions, one responsibility per command.
- **Readability** — clear names, comments where intent is not obvious. The other partner must be able to read and modify.
- **Tests** — validate behaviour, above all for batch and admin operations.
- **Shared libraries** — when a pattern is reusable across workspaces, extract it rather than duplicate it.

A well-structured script documents itself; an opaque one needs a companion gesture to be usable. Discipline is what lets an automaton stand without one.

## Si as author

Si can write Nushell — a strength of the tandem — but quality varies. The common ground assumes that what Si produces is readable and maintainable by C, and the reverse. Hence style conventions and explicit modularisation.

## Recurring shapes

When a script shape recurs from one automaton to another, it earns a named model rather than being reinvented. Two general shapes hold:

- **Discover, validate, execute** — find paths by convention instead of hard-coding them, check prerequisites, then act; each step a distinct function.
- **Show, confirm, execute** — for external scope: display what will happen, ask for confirmation, act. The shape of dry-run by default.

A model is worth only as long as the practice it describes exists. A shape tied to a method's mechanism belongs to that method and falls with its mechanism; it is not a general shape.

## Gesture or automaton

A gesture becomes a candidate for automation when judgment disappears — the sequence has turned mechanical, the safeguards are stable. An automaton becomes a gesture again when the context grows too complex for it. Automating too early freezes decisions that should stay fluid. Si lowers the cost of automating, which moves the line; it does not remove it.

## Poros — what the automaton does not forge

Automatons are forged; they consume what is found — a sync tool, an MCP server, a CLI, Si itself.

| Form | Nature | |
|---|---|---|
| Gesture | Judgment required | πρᾶξις |
| Automaton | Mechanical execution | αὐτόματον |
| **Poros** | **External resource — discoverable, optional** | **πόρος** |

A poros does not execute: one probes it and takes hold of it. It sits outside the nature × scope matrix, invoked from any of its four cells.

**Vocabulary.** *Poros* — the found resource. *Aporia* (ἀπορία) — its absence. *Probe* — the check for it. *Baseline* — how things run without it.

**Mechanism — probe-and-adapt.** A well-written automaton:

1. **declares** its poroi;
2. **probes** them before relying on them;
3. on aporia, **falls back** to the baseline — reduced scope, not failure.

Known elsewhere as progressive enhancement (web), capability probing (MCP handshake, tool listing), the `pcall` require pattern (Lua), `command -v` (Unix), fallback chains (agent frameworks).

**The operator's own probe.** What an automaton does for its poroi, the operator does for itself. An agent entering does not yet know what it works with — which backend and so which tools it really has, which shell actually runs its commands, which CLIs are present. A cold operator's traps are often environmental, not structural: invisible until they break. So it probes, and treats absence as reduced scope.

- **Once per session**, not at each threshold — the machine does not change when a threshold is crossed. It is not part of ORIENT.
- **Recomputed, not engraved** — a true report for this machine, now. Written into a doc or a memory, it drifts out of sync.
- Praxis gives the probe its form; the agent's persona decides to mobilise it.

**The discipline.** Before forging, search: look for what exists, inform yourself outside rather than guess from what you know, evaluate (does it answer? at what cost? what dependency?), then integrate the found or forge anew.

## Not settled here

Where tools shared across workspaces live — a common Nushell library, reusable shapes — is an open question, outside this deliverable.
