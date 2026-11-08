# Tekton

*Methods that install.*

Most thinking about working with an AI ends up as an article you read once and forget. Tekton packages it instead: install a plugin, and the agent actually works that way — from its first message, in every session, without being reminded.

Five plugins. **Chiron** is the one to start with.

```
/plugin marketplace add ChristianLemer/tekton
/plugin install chiron@tekton
```

Restart, and the session opens with Chiron's card — the version it runs and the channel it came from, then a greeting in its own voice and an offer derived from what is actually loaded. Not an assistant waiting for instructions: a peer that already knows how it works with you.

---

## The plugins

| Plugin | What it does | For whom |
|---|---|---|
| **Chiron** | A methodological companion. Holds the session as its agent and carries five grammars as skills, loaded when the situation calls for them. Peer by default — dense, critical rather than agreeable. | anyone working with an AI on methods, workspaces and documents — **start here** |
| **Kyklos** | One cycle from raw input to deliverable, in three profiles: **Elasis** (swift), **Anabasis** (staged production), **Organon** (deep investigation). | anyone forging something that must hold — a method, a document, a system |
| **Kairos** | Attention allocation, held by a guardian agent dispatched beside the session. For when attention rather than time is the constraint, and willpower has already failed at it. | someone with several zones of life or work competing, and a workspace that declares it |
| **Agora** | The guardian of the whole: how a corpus of methods stays coherent from a piece's birth to its consumer — what enters, what is configured to leave, what leaves — with the tooling that packages and deploys it. | whoever keeps a corpus of their own and publishes it |
| **Prosopon** | The persona as an object: what a persona is, its two forms, and the six questions its design must settle. | whoever forges a persona of their own, Chiron-like or not |

## What Chiron is for

Chiron accompanies **methodological work**: designing a workspace, naming what can be done in it, making a document land, keeping a conversation from going to waste. It holds no domain expertise — it brings a way of working.

It carries five grammars, in the order the corpus reads them — each one presupposes those before it:

| | Grammar | |
|---|---|---|
| 1 | **Kentauros** | How the two of you collaborate — postures, what each partner owes the other, why flattery is a failure and not a courtesy. The spirit everything else frames itself by. |
| 2 | **Dialektikē** | Conducting the exchange — frame, clarify, split, distill, follow up, offer a thought, and above all consolidate: an unconsolidated discussion is a lost discussion. The manner; it presupposes the spirit. |
| 3 | **Genesis** | Workspaces that explain themselves. Opening the folder should be enough to start. |
| 4 | **Praxis** | Workspaces that act. A gesture has an anatomy; naming it beats remembering it. Impossible without Genesis. |
| 5 | **Aisthesis** | Readability. Density, rhythm, and when prose beats a table. After the two before it. |

None is injected at session start: each is a skill, present by its description from the first reply and loaded whole when its moment comes. Each is also a skill you can pull up on its own — `/chiron:genesis` — whether or not you want the full companion.

**The posture is the point.** Chiron is a peer by default: dense, critical rather than agreeable, and it will tell you when your idea is worse than the alternative. If you want an agent that says yes, this is not it. The posture holds across the session; when the problem calls for another one, Chiron says so and you choose.

## The other four

**Kyklos** — `kyklos@tekton`. One cycle from raw material to finished deliverable, in three depths. **Elasis** when the answer is nearly known and speed wins. **Anabasis** when the production path itself needs staging — strategy, tactics, operational — before anything is forged. **Organon** when the knowledge is not yet understood and must be refined before a stance makes sense. A project that follows Kyklos keeps its levels flat and its product at the Forge; the delivered state is what the main branch holds.

**Kairos** — `kairos@tekton`. It keeps a partition of your attention zones, a balance that arbitrates between them, and a journal of what actually happened; then it works nine gestures, six of which the guardian initiates without being asked. It reads and writes the issue reservoir your workspace declares, and tells a task from a message. It activates only in a workspace that has declared it.

**Agora** — `agora@tekton`. For a corpus, not a piece: one manifest at the head of the corpus's place says what leaves, in which units, for which systems; six gestures take a piece from its admission to its consumer; two scripts package and deploy, mechanically, dry-run by default. This repository is what Agora produces — it is published by the method it carries.

**Prosopon** — `prosopon@tekton`. A method of the persona as an object, grafted on Kyklos: at the Position of a persona's cycle, six questions to settle — its end, its use, its posture, what it mobilises, how it is recognised, how it is tried. Chiron is forged with it.

## Two channels

Stable is published from `main` as the `tekton` marketplace; trial from `beta` as `tekton-beta`.

```
/plugin marketplace add ChristianLemer/tekton              # stable — to all
/plugin marketplace add ChristianLemer/tekton#beta         # trial — to a few
```

Both clients take the `#ref` suffix and record the branch. Two marketplaces rather than two entries in one, because a catalogue's plugin paths are relative to its own repository.

The plugin is called `chiron` in both catalogues, and the **version is the same number on both**: a version goes to a few first, then to all once it has held. The channel is not in the number — the session card reads it from where the plugin was installed: `v0.0.11 @tekton-beta`, `v0.0.11 @tekton`.

**Install one channel or the other.** Should both be enabled, the one that serves all steps back in favour of the trial one, and says so at session start — but a second copy of every component still weighs on the session. Pick one.

**Maintaining the channels.** A channel only moves when a plugin's `version` changes — the clients resolve by version, not by commit, so a push without a bump delivers nothing. Promotion is the same packages, on the other head: nothing is rebuilt between trial and stable.

## Contributing

The method texts here are packaged output. They are written in a private authoring repository and regenerated on release, so a pull request editing them would be overwritten — each package carries an inventory that says what it was rendered from.

That does not mean feedback has nowhere to go. **Open an issue.** A grammar that reads wrong, a convention that breaks in practice, a gesture that is missing — that is exactly what is worth hearing, and it goes back to the piece it concerns.

## A personal project

Built on my own time, at home, out of my own curiosity. Nothing here belongs to any employer and nothing here is anyone's product. Published because a method kept private helps one person, and this one may help a few more.

MIT — see [LICENSE](LICENSE). Use it, fork it, ship it; keep the copyright notice so people can trace where it came from.

---

*τέκτων — the craftsman. The one who builds.*
