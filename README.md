# Tekton

*Methods for working with an AI as a partner, packaged as Claude Code plugins.*

Tekton is a corpus of methods about how a human and an AI work together — how to hold a conversation between two intelligences, how to structure a workspace so that opening the folder is enough to start, how to name what can be done there, how to make a document readable at a glance. Each method travels as a plugin: install it, and the agent operates by it.

**A personal project.** Built on my own time, at home, out of my own curiosity. Nothing here belongs to any employer, and nothing here is anyone's product. Published because methods are worth more shared than kept — take what is useful.

---

## Install

```
/plugin marketplace add ChristianLemer/tekton
/plugin install chiron@tekton
```

Then start a new session. Chiron introduces itself and asks what you are working on.

## The plugins

| Plugin | What it does |
|---|---|
| **Chiron** | A methodological companion. Loads five grammars at session start and works as a peer — dense, critical rather than agreeable. The entry point: start here. |
| **Kairos** | Attention allocation, held by a guardian agent. For when attention rather than time is the constraint, and willpower has already failed at it. Needs a workspace that declares it. |
| **Kyklos** | One cycle from raw input to deliverable, in three profiles: **Elasis** (swift), **Anabasis** (staged production), **Organon** (deep investigation). |

### The grammars Chiron carries

| Grammar | |
|---|---|
| **Kentauros** | The collaboration protocol — postures, the founding triangle, what the partners owe each other. |
| **Genesis** | Workspaces that explain themselves — naming, partition, README as hub. |
| **Praxis** | Workspaces that act — the anatomy of a gesture, what belongs as a gesture and what as an automaton. |
| **Aisthesis** | Readability — density, rhythm, when prose beats a table. |
| **Dialektikē** | Conducting the exchange — clarify, split, distill, follow up, and above all consolidate. |

Each is also a skill you can read on its own: `/chiron:genesis`.

## Two channels

Every plugin is listed twice — once tracking `main`, once tracking `beta`.

| Install | Channel |
|---|---|
| `chiron@tekton` | stable — tracks `main` |
| `chiron-beta@tekton` | ahead of stable — tracks `beta` |

One marketplace serves both; pick the entry, not the marketplace. **Install one or the other, never both** — a plugin and its Beta twin carry the same components, so having both installed collides.

A channel only moves when a plugin's `version` changes. That is deliberate: a push without a version bump delivers nothing.

## Where this comes from

The plugins here are packaged output, not the place the methods are written. They are derived from a private authoring repository and regenerated rather than edited — each carries an `INVENTORY.md` declaring what it holds, in what order, and what was deliberately left out. If a package and its inventory disagree, the inventory is the one to trust.

## License

MIT — see [LICENSE](LICENSE). Use it, change it, ship it; keep the copyright notice so people can tell where it came from.

---

*τέκτων — the craftsman who builds.*
