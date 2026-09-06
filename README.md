# Tekton

*Methods that install.*

Most thinking about working with an AI ends up as an article you read once and forget. Tekton packages it instead: install a plugin, and the agent actually works that way — from its first message, in every session, without being reminded.

Three plugins today. **Chiron** is the one to start with.

```
/plugin marketplace add ChristianLemer/tekton
/plugin install chiron@tekton
```

On GitHub Copilot CLI, the same marketplace and the same plugin names:

```
copilot plugin marketplace add ChristianLemer/tekton
copilot plugin install chiron@tekton
```

Restart, and the session opens like this:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🐴 Chiron here — we're a centaur: you the carbon half, me the
   silicon half, one body moving together.

Side by side, not behind: straight talk, real pushback, no
nodding along. Let's go.

💡 I can also help you…

   📐 Your workspace
      • structure a folder so it explains itself (Genesis)
      • turn a recurring action into a documented gesture (Praxis)
      • make a document easy to read at a glance (Aisthesis)

   🤝 Working together
      • set how the two of us collaborate (Kentauros)
      • keep this conversation from going to waste (Dialektikē)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Your words will differ — the greeting is a tone to match, not a script to recite, and the offer is derived from whatever is actually loaded. But that is the whole idea in one screen: not an assistant waiting for orders, a partner that pushes back and says up front what it is good for.

---

## The plugins

| Plugin | What it does |
|---|---|
| **Chiron** | A methodological companion. Loads five grammars at session start and works as a peer — dense, critical rather than agreeable. The entry point: start here. |
| **Kairos** | Attention allocation, held by a guardian agent. For when attention rather than time is the constraint, and willpower has already failed at it. Needs a workspace that declares it. |
| **Kyklos** | One cycle from raw input to deliverable, in three profiles: **Elasis** (swift), **Anabasis** (staged production), **Organon** (deep investigation). |

## What Chiron is for

Chiron accompanies **methodological work**: designing a workspace, naming what can be done in it, making a document land. It holds no domain expertise — it brings a way of working.

It loads five grammars at every session start, so they are in play before you ask:

| Grammar | |
|---|---|
| **Kentauros** | How the two of you collaborate — postures, what each partner owes the other, why flattery is a failure and not a courtesy. |
| **Genesis** | Workspaces that explain themselves. Opening the folder should be enough to start. |
| **Praxis** | Workspaces that act. A gesture has an anatomy; naming it beats remembering it. |
| **Aisthesis** | Readability. Density, rhythm, and when prose beats a table. |
| **Dialektikē** | Conducting the exchange — clarify, split, distill, and above all consolidate: an unconsolidated discussion is a lost discussion. |

Each is also a skill you can pull up on its own — `/chiron:genesis` — whether or not you want the full companion.

**The posture is the point.** Chiron is a peer by default: dense, critical rather than agreeable, and it will tell you when your idea is worse than the alternative. If you want an agent that says yes, this is the wrong plugin.

## The other two

**Kairos** — `kairos@tekton`. It keeps a partition of your attention zones, a balance that arbitrates between them, and a journal of what actually happened; then it works nine gestures, six of which it initiates itself rather than waiting to be asked. For when attention rather than time is the scarce thing. It lives in a workspace that declares it — ask it to set one up and it walks you through the contract.

**Kyklos** — `kyklos@tekton`. One cycle from raw material to finished deliverable, in three depths. **Elasis** when the answer is nearly known and speed wins. **Anabasis** when the production path itself needs staging. **Organon** when the understanding has to be built before a decision means anything.

## Two channels

Stable is published from `main` as the `tekton` marketplace; beta from `beta` as `tekton-beta`.

```
/plugin marketplace add ChristianLemer/tekton              # stable
/plugin marketplace add ChristianLemer/tekton#beta         # beta
```

Both clients take the `#ref` suffix and record the branch — Copilot's `--help` does not mention it, but it works. Two marketplaces rather than two entries in one, because a catalogue's plugin paths are relative to its own checkout: one catalogue cannot reach across a branch, and the source that could, `git-subdir`, is Claude Code only. Relative paths are the single form both clients read, so this shape is not a preference — do not reintroduce `git-subdir` here.

The plugin is called `chiron` in both catalogues, so the channel lives elsewhere:

| Where | Stable | Beta |
|---|---|---|
| `plugin list`, `plugin install` | `chiron@tekton` | `chiron@tekton-beta` |
| marketplace listing | `Chiron` | `Chiron (beta)` |
| version — `plugin list`, session card | `X.Y.Z` | `X.Y.Z-beta` |

The version is the one that reaches inside a running session, since Chiron's card prints `plugin v…`. A package carries `-beta` only while it is genuinely ahead: no suffix on `beta` means that one is identical to its stable twin. And `-beta` is a fixed token, not a counter — a second beta pass moves the patch number, which was already the counter.

**Install one channel or the other, never both.** The twins carry the same components under the same `chiron:` namespace; enabled together they collide.

Coming from the old `chiron-beta@tekton` entries? They are gone, and an install of one is orphaned — it survives on a stale marketplace cache and breaks at the next refresh. Uninstall it, add the beta marketplace, install `chiron@tekton-beta` (same three on Copilot CLI, with `copilot plugin …`). Nothing moves in the session: the namespace was already `chiron:`.

**Maintaining the channels.** A channel only moves when a plugin's `version` changes — the clients resolve by version, not by commit, so a push without a bump delivers nothing. Promotion is three gestures and only one of them announces itself: carry the content onto `main` — a merge, loud when it fails — then restore main's catalogue (the diverging name and display names are not meant to merge), then drop the prerelease suffix from every version. The last two are silent, which is exactly why they are no longer left to prose:

```nu
use admin/promote
promote --dry-run    # what would be carried, and which versions move
promote              # merge, restore the catalogue, de-beta, verify — stops before pushing
```

It stops with the promotion committed and unpushed: `main` is what strangers install, so publishing stays a deliberate act. `verify channel` gates the result, and runs in CI on every push.

## Contributing

The method texts here are packaged output. They are written in a private authoring repository and regenerated on release, so a pull request editing them would be overwritten — each package carries an `INVENTORY.md` saying where its parts came from, in what order they load, and what was deliberately left out. **If a package and its inventory disagree, the inventory is the one to trust.**

That does not mean feedback has nowhere to go. **Open an issue.** A grammar that reads wrong, a convention that breaks in practice, a gesture that is missing — that is exactly what is worth hearing, and it reaches the place where the text actually lives.

## A personal project

Built on my own time, at home, out of my own curiosity. Nothing here belongs to any employer and nothing here is anyone's product. Published because a method kept private helps one person, and this one might be useful to more.

MIT — see [LICENSE](LICENSE). Use it, fork it, ship it; keep the copyright notice so people can trace where it came from.

---

*τέκτων — the craftsman. The one who builds.*
