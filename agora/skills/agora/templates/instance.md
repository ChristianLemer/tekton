# Manifest

*What leaves this corpus, in which units, for which systems — and what the whole has decided about it.*

> This file is Agora applied to this corpus — its instance, at the head of the corpus's place, named `MANIFEST.md`. Its form is prescribed by Agora; its values belong to whoever assembles the corpus. Two gestures write here — ADMIT adds a piece, REVIEW rereads everything — and the exit gestures only read. Every section states its **regime**: whether it can go stale, and what revalidates it.

---

## Units

*Regime: declared — changes when the fact changes.*

One line per installable whole. PACKAGE assembles each unit in `<apparatus>/<unit>/`.

| Unit | System | Destination | Carrier |
|---|---|---|---|
| `<unit>` | `<system file in Agora's SYSTEMS/>` | `<destination, as the channels below name it>` | yes / no |
| `<unit>` | `<system file in Agora's SYSTEMS/>` | `this corpus` | yes / no |

A unit more is a line more: decided at review, with the user. The catalogue of each channel is generated from this table — the units of that channel's destination, and they only — never written at the destination. A unit whose destination is `this corpus` serves the corpus that produces it — the workshop's tool rather than its product: it enters no catalogue, and DEPLOY installs it in the working copy, as the system file says.

**Folders** — where the pieces are and where the apparatus is, relative to this file. The defaults are the template's; a corpus may name others, and everything that reads the corpus takes them from here.

| Folder | Path |
|---|---|
| pieces | `1. Corpus/` |
| apparatus | `2. Apparatus/` |

**Channels** — per destination, each catalogue it serves, and to whom. The only place a channel is written: neither a unit's number nor its name repeats it. A destination is reached as the system file says — a variable, never a machine path.

| Destination | Catalogue | Head | Serves |
|---|---|---|---|
| `<destination>` | `<catalogue name>` | `<the head that serves it>` | a few — trial |
| `<destination>` | `<catalogue name>` | `<the head that serves it>` | all |
| `this corpus` | — | — | this corpus |

**Destination files** — what the destination holds that derives from no piece, and where its source sits: in `0. Colophon/`, beside this file. Filed there, they never apply to the corpus itself.

| File | Source |
|---|---|
| `<LICENSE>` | `0. Colophon/<LICENSE>` |
| `AGENTS.md` | `0. Colophon/AGENTS.md` — written from `templates/destination-agents.md` |

## Reading order

*Regime: decided — read in the corpus's topology, revalidated when a piece enters it or the topology moves.*

The order in which pieces are read together, written once for the whole corpus. A unit's order is this one, restricted to its selection: it is derived, and written nowhere else — neither in a composition nor in the persona that carries a unit. Only the pieces some unit reads together are listed; the list grows when a unit asks for one more.

REVIEW proposes it from what the deliverables say of their neighbours — what a piece **presupposes** (it cannot be understood without the other), what it **frames** (it serves the other as a lens without presupposing it) — and the user confirms: the pieces that frame first, then each after what it presupposes. One piece per line, by its path relative to the pieces' folder. PACKAGE stops on a selected piece this list does not place.

1. `<place>/<piece>`
2. `<place>/<piece>`

## Composition

*Regime: a rule is derived — nothing to revalidate; a list, and what a unit adds in its own right, are decided — revalidated at each review.*

Per unit: a **rule** that names a property (« every grammar of these families ») *or* a **list** that names the pieces; and what the unit adds beyond the rule (a persona, a guardian). A rule by families resolves through the places of the pieces' folder, each recognised by its name. No order here: it derives from *Reading order*.

At most one unit per destination adds a persona that holds the main thread — the session's agent; the other personas are dispatched beside it. PACKAGE stops if two units of one destination claim it.

### `<unit>`

- **Rule:** `<property>` — or — **List:** `<piece>`, `<piece>`
- **Adds:** `<what the unit's purpose requires in its own right>` — and, for a persona, whether it holds the main thread

## Pauses

*Regime: decided — revalidated at each review.*

Pieces the rules designate and the whole holds back, and why. A designated piece absent from this table goes out once it has an accepted deliverable. **Maturity is not written here, nor anywhere**: it is read in the trace of what was done for the piece — its deliverable accepted or not, the version each channel serves — and confirmed aloud at review. A piece with no accepted deliverable is not listed: the trace says it already.

| Piece | Why |
|---|---|
| `<piece>` | `<reason>` |

## Movements

*Regime: decided — written at the review that confirms the movement, erased at the review that follows its delivery.*

What moved between pieces, so that carriers can tell consumers once, and orchestration can tell those without a carrier.

| What | From | To | Retired |
|---|---|---|---|
| `<what moved>` | `<piece>` | `<piece>` | — |

## Last review

*Regime: the trace PACKAGE requires.*

The revision of the corpus at the moment REVIEW last confirmed this file. PACKAGE refuses if the corpus has moved since — a different revision, or a modified tree.

- **Revision:** `<revision identifier>`
