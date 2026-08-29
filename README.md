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

For GitHub Copilot CLI, use the same marketplace and plugin names:

```
copilot plugin marketplace add ChristianLemer/tekton
copilot plugin install chiron@tekton
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

Stable is published from `main` as the `tekton` marketplace; beta from `beta` as `tekton-beta`.

Two marketplaces rather than two entries in one, because a catalogue's plugin paths are relative to its own checkout — one catalogue cannot reach across a branch. The object source that can, `git-subdir`, is Claude Code only; Copilot CLI does not know it. Relative paths are the single form both clients read, so two branch-scoped catalogues is not a preference but the only portable shape. Do not reintroduce `git-subdir` here.

```
/plugin marketplace add ChristianLemer/tekton              # stable
/plugin marketplace add ChristianLemer/tekton#beta         # beta
```

Both clients accept the `#ref` suffix and record the branch — `copilot plugin marketplace add` takes it too, though its `--help` does not say so.

### Telling which channel you are on

The plugin is named `chiron` in both catalogues, so the channel is not in the plugin name. It is legible in three other places:

| Where | Stable | Beta |
|---|---|---|
| `plugin list`, `plugin install` | `chiron@tekton` | `chiron@tekton-beta` |
| marketplace listing | `Chiron` | `Chiron (beta)` |
| version — `plugin list`, session card | `0.0.8` | `0.0.8-beta` |

The version suffix is the one that reaches inside a running session: Chiron's activation card prints `plugin v…`, so the card names its own channel. A package carries the suffix only while it is genuinely ahead — no suffix on `beta` means that plugin is identical to its stable twin and the channel has nothing extra to offer for it.

`-beta` is a fixed token, not a counter. A second beta pass moves the patch number (`0.0.8-beta` → `0.0.9-beta`), because the patch number was already the counter and a package needs exactly one. Stable then skips the number beta consumed, which is what skipping means.

**Install one channel or the other, never both.** A plugin and its twin carry the same components under the same `chiron:` namespace; enabled together they collide.

### Two rules that stay silent when broken

**A channel only moves when a plugin's `version` changes.** The clients resolve by version, not by commit: a push without a bump delivers nothing.

**Promotion is three gestures and only two of them announce themselves.** Move the content onto `main`; restore main's catalogue (`jj restore --from main .claude-plugin/marketplace.json` — main's is authoritative, the diverging `name`, display names and descriptions are not meant to merge); drop the prerelease suffix from every version. Forget the third and stable ships a package announcing itself as beta. `verify channel` catches exactly that.

### Migrating off the old beta entries

Until now one catalogue on `main` carried six entries and the channel lived in the plugin name (`chiron-beta@tekton`). Those entries are gone. An install of one is orphaned — it survives on a stale marketplace cache and breaks at the next refresh:

```
/plugin uninstall chiron-beta@tekton
/plugin marketplace add ChristianLemer/tekton#beta
/plugin install chiron@tekton-beta
```

```
copilot plugin uninstall chiron-beta
copilot plugin marketplace add ChristianLemer/tekton#beta
copilot plugin install chiron@tekton-beta
```

Nothing moves in the session: the namespace was already `chiron:` — `plugin.json` has always been named `chiron`, and the old entry name was only a channel label.

## Where this comes from

The plugins here are packaged output, not the place the methods are written. They are derived from a private authoring repository and regenerated rather than edited — each carries an `INVENTORY.md` declaring what it holds, in what order, and what was deliberately left out. If a package and its inventory disagree, the inventory is the one to trust.

## License

MIT — see [LICENSE](LICENSE). Use it, change it, ship it; keep the copyright notice so people can tell where it came from.

---

*τέκτων — the craftsman who builds.*
