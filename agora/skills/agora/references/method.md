# Agora — Method, in detail

*What the head of [AGORA.md](../AGORA.md) states in brief, developed — read when a gesture needs the detail. Each section continues the section of the same name in the head.*

---

## Three Tiers, One Place Per Fact

The parallel is Kyklos: one method, workshops that are its instances, and inside each workshop a content that belongs to it alone. Agora repeats the pattern one tier up.

The split forbids two things. The instance does not restate what a piece declares of itself — its nature is read at the piece. And the piece does not say what the whole decides — a **pause**, holding a piece back, is written in the instance, with its reason.

**Maturity has no tier: it has a gesture.** No tier writes it. It is read in the trace of what was done for the piece — a deliverable accepted or not, a version served to a few or to all — and confirmed aloud when something leaves. A trace cannot go stale: it *is* the act. Only the pause is written, because no act carries it: a piece held back looks exactly like a piece forgotten. Agora crosses three things — the rule that designates a piece, the trace of what was done for it, the pause that holds it — and where they disagree, it shows the gap to the user, never resolves it alone.

## The Place of the Corpus

**The pieces are arranged in places**, and each place states its criterion in its own README, as a question a piece answers yes or no. Where the corpus explains itself, it lists its places with their criteria — and, where they may overlap, the order in which they are asked. A piece lives in one place.

**The instance sits beside the pieces, not among them**: it is not a piece, it says what is done with the pieces. **The apparatus is the corpus's product** — to the corpus what a piece's product is to the piece; it lives inside, not beside. Numbering follows Genesis inside a zone: a sequence — the pieces, then what is assembled from them — and zero for what enters outside the sequence. `1. Corpus/` and `2. Apparatus/` are the template's names; a corpus may declare others in its instance, and everything that reads the corpus takes them from there. `MANIFEST.md`, `0. Colophon/` and the readings files keep their names: the gestures find them by these. **What a corpus reads for a system is the corpus's**, not the method's — the descriptions compressed from each presentation, what no piece carries but the system requires: it sits beside the instance, never beside the tooling, so that the tooling serves any corpus as it is.

**A piece's product is read where the method it follows puts it** — for a piece that follows Kyklos, `4. Forge/<PRODUCT>/`, of which the accepted state is the deliverable. A piece whose product cannot be found there stops PACKAGE, which names it.

**Gestures and tools start from this folder** and find everything relative to it. Where the folder sits in the workspace, and how the workspace says that it hands this folder to Agora, belongs to the workspace's structure — Genesis. Agora only asks that it be said.

## The Instance

`MANIFEST.md` is named for what it is — the manifest of what leaves — and not for the method that reads it.

How pieces combine is a judgment, and it belongs to the gesture that decides what leaves: REVIEW reads what the deliverables say of their neighbours, tells what a piece *presupposes* from what it *frames* — a lens it serves without presupposing it —, proposes the order, flags a selection that takes a piece without what it presupposes, and the user confirms. No piece has to declare its dependencies in an imposed form; whoever composes a unit asks for that judgment, or reads what the instance decided.

Composition is said **by rule or by list**, at the corpus's choice. Both fail differently; the review at each use catches the failure of either. The instance is in the artifact-layer language — gestures read it.

## The Apparatus

A unit belongs to no piece: it assembles pieces from many workshops. It is therefore assembled outside every workshop, in the **apparatus** of the corpus — a folder of the corpus's place, beside the pieces and the instance, one subfolder per unit. Versioned with the corpus, because the diff between two packagings is worth reading. It is what DEPLOY compares to the destination and what DOCUMENT reads. Nothing is ever assembled directly at a destination: what is written at the target has no source.

## What the Destination Holds

A destination is a shelf: it decides nothing, and nothing is written there by hand. The apparatus is therefore the **complete image of what the destination holds**, and each thing there has its source and its gesture:

| At the destination | Comes from | Gesture |
|---|---|---|
| the units | the pieces' deliverables, per the instance's composition | PACKAGE |
| each channel's catalogue — the units it offers | the instance's units, and each unit's manifest | PACKAGE generates it |
| the home page — what the destination offers, how to install | the units' presentations, and the instance | DOCUMENT |
| what is served to all rather than to a few | the user's answer at review | REVIEW decides, DEPLOY carries |
| files that derive from no piece — the licence | a file in `0. Colophon/`, which the instance names | PACKAGE copies it |
| the rules of an agent started at the destination — commit and push, nothing else | an `AGENTS.md` in `0. Colophon/`, written from the template, named as a destination file — filed there, it never instructs an agent working in the corpus | PACKAGE copies it |

**One more unit is one more line in the units** — decided at review, with the user; the catalogue follows. **A channel is written once**, in the instance: its catalogue name, and whom it serves. Neither the number nor the name of a unit repeats it. Whatever sits at the destination without coming from the apparatus is a gap — a remnant of a time it was worked in, or a text retouched there: DEPLOY shows it first, dry; the applied alignment removes it. What version control ignores there is never touched. **The destination is the only output:** what is distributed leaves from it, and from nowhere else.

## Three Criteria, Three Natures

Silence counts as candidacy: a piece the rule designates comes up even if it declares nothing, and the review asks. What is automated is the question, never the answer — a piece delivered since the last review does not enter a unit by itself. Push is conscious.
