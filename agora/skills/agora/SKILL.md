---
name: agora
description: Use when several artifacts have to be published as one coherent thing and nobody can see the whole from inside any single piece; when a corpus changes faster than memory can follow — pieces appear, are delivered, split — and what was shipped last time no longer says what should ship now; when the same source must be rendered into a system with its own format, and the rendering must stay regenerable rather than hand-maintained. Not for forging a single piece — that is Kyklos. Not for structuring a workspace — that is Genesis.
---
# Agora

*The guardian of the whole.*

A method for keeping a living corpus coherent from the moment a piece is born to the moment it reaches a consumer — what enters, what is configured to leave, what leaves.

---

## The Problem

When artifacts articulate — one completes another, one only works in the light of another — they form a **corpus**: a whole whose coherence is a property to manage. Inside the workshop the links are implicit; once the artifacts leave, each consumer must rebuild the topology alone — a human by intuition, an agent not at all. Kyklos forges artifacts, Genesis structures workspaces, Praxis operates within them; the whole that leaves and must make itself understood is Agora's territory.

---

## Part I — Grammar, in Brief

*Each idea in a sentence or two. The full text, section by section under the same names, is in [references/grammar.md](references/grammar.md).*

- **Corpus** — born of mutual dependency of meaning; its purpose is a coherent product for the consumer.
- **Grammar and Method** — every piece carries both: grammar makes an operator autonomous, method effective. One without the other leaves mechanical execution, or enlightened inaction.
- **Nature and Form** — a piece declares its nature; the system decides its form. The piece never carries the vocabulary of a system.
- **Stratification** — grammars extend by presupposition, methods compose by use: a stack, read in the order of its presuppositions. Packaging is a stratum above; one system, above that, removable.
- **Conditions of Application** — a carrier, a trigger, or nothing. Being in the corpus is not being deployed; the author says how far a piece goes, first by acting.
- **Leaving the Workshop** — publication decontextualises: what leaves must be self-sufficient, guaranteed by homologating the production method, not checked artifact by artifact.
- **Every Deliverable Carries Its Presentation** — what it is and when it serves, two texts for two readers, forged like the content. Packaging translates; it does not write.
- **What Only the Whole Can See** — the big picture, packaging, conformity, a pause. Deciding locally what was global produces silent drift.
- **Omission Is Structural** — a stale artifact looks current. Detection comes from lateral contrast — *it is not rules that set the norm, it is neighbours* — and from **declare, then compare**, at every use.
- **The Living Corpus** — an intention, conscious gaps, a trajectory; it must be able to say what moved.
- **Kept, Arranged, Housed** — keeping a corpus is decided and declared; each place states its criterion; the corpus has a place of its own, and Agora describes **the inside of the folder it is given**.
- **Cadence** — the automaton executes, the operator decides when to trigger.
- **Verifiability** — declarative: compare current states, stop where nothing is written.
- **Making Itself Understood** — desirable and usable. Three ends — understand, execute, discover; serving only one is a conscious gap, never a doctrine.

---

## Part II — Method

### The Guardian and Its Three Moments

Agora is the **guardian of the whole**, and it holds the three moments of that role: a piece **enters** the corpus; the whole is **configured** — what leaves, in what, for which system; something **leaves**. One method, one name. The one who recommends the structure of the corpus is the one who delivers it — a method that took notes at entry for another to consolidate at exit would lose information at every handover.

Towards a piece, Agora does three things and never a fourth. **Upstream, it guides**: it says what a piece must carry to leave — nature, the method it follows, presentation, conditions of application — as an instruction addressed to the piece's cycle. **Meanwhile, it lets be**: the cycle forges, decides, distils. **Downstream, it verifies**: it rereads whether the instruction was kept, and reports the gap. **It never modifies a piece.** Modification belongs to the cycle that holds the piece. The seam between Agora and that cycle is a reading in each direction — the instruction one way, the deliverable the other — with no memory between them.

### Three Tiers, One Place Per Fact

What is known at one tier is written at that tier, once. Agora crosses the tiers; it does not copy them.

| Tier | What it is | What it writes | Who writes |
|---|---|---|---|
| **the method** | Agora's deliverable — this one, generic | the form of an instance, the gestures, the instruction to pieces, and one file per target system | Agora |
| **the instance** | Agora applied to one corpus — `MANIFEST.md`, at the head of the corpus's place | the units that leave, each one's composition by rule or by list, the target system and its channels, the pauses, the record of movements, the review trace | whoever assembles the corpus |
| **the piece** | the cycle of one artifact | its nature, the method it follows, its conditions of application, its presentation, the inventory of its deliverable | the piece's author, through its cycle |

**Maturity has no tier: it has a gesture** — read in the trace of what was done for the piece, confirmed aloud when something leaves. Only the pause is written. The split and the maturity rule in full: [references/method.md](references/method.md).

### The Place of the Corpus

Agora prescribes what is inside the folder it is given, and nothing outside it:

```
<the folder you are given>/
├── MANIFEST.md     ← the instance: what leaves, in which units, for where
├── <system>.json   ← what the corpus has read for a system — one per system file its units target
├── 0. Colophon/    ← what the destination receives that derives from no piece
├── 1. Corpus/      ← the pieces, arranged in places
└── 2. Apparatus/   ← the product of the corpus: one folder per unit
```

Where a piece's product is read, how places state their criterion, what the readings file holds, where gestures start: [references/method.md](references/method.md).

### The Instance

A corpus kept by Agora has one file at the head of its place, `MANIFEST.md`, in the form Agora prescribes (`templates/instance.md`). Six sections, each stating whether it can go stale:

| Section | Says | Regime |
|---|---|---|
| **Units** | the folders of the pieces and of the apparatus; each installable whole: name, system, destination; and per destination, its channels — catalogue name, served to a few or to all | declared |
| **Reading order** | the order in which pieces are read together, once for the whole corpus — the logic of their combination. A unit's order is this one restricted to its selection, derived and written nowhere | decided — read in the topology, revalidated when a piece enters it |
| **Composition** | per unit, a rule *or* a list, and what the unit adds — at most one unit per destination adds a persona that holds the main thread | rule derived; list and additions decided |
| **Pauses** | pieces the rules designate and the whole holds back, and why. A piece with no accepted deliverable is not listed: the trace says it already | decided — revalidated at each review |
| **Movements** | what left which piece for where, what is retired | decided — written when confirmed, erased once delivered |
| **Last review** | the corpus revision at the last REVIEW | what PACKAGE requires |

How REVIEW proposes the reading order, and why composition is by rule or by list: [references/method.md](references/method.md).

### The Apparatus and the Destination

Units assemble in the **apparatus** of the corpus, outside every workshop, versioned with the corpus: it is the complete image of what the destination holds, and what DEPLOY compares and DOCUMENT reads. **Nothing is written at a destination by hand** — what is written at the target has no source. What the destination holds, from where, by which gesture: [references/method.md](references/method.md).

### Three Criteria, Three Natures

What leaves is decided by crossing three things that are not of the same kind:

| Criterion | Question | Nature | Lives |
|---|---|---|---|
| **belonging** | does the piece fall under the unit? | derived by rule, without memory | the composition, in the instance |
| **maturity** | how far does this version go? | an author's appreciation, read in their gesture and **confirmed** aloud | the trace: deliverable accepted or not, version served to a few or to all |
| **pause** | do we hold it back? | a decision of the whole — it **decides** | the pauses, in the instance |

**To a few first, to all when the author says so.** A new version, the review proposes to send to a few; a version already served to a few and unchanged since, it asks whether it goes to all. The author follows or corrects — a minimal change may go straight to all, a simple-looking one may stay on trial. What is confirmed is where *this version* goes, not a rank attached to the piece; the answer is written nowhere — the transport that follows leaves its trace.

### Systems

One file per target system in `SYSTEMS/`, each answering the same questions in the same order, so that PACKAGE and DEPLOY know where to read: only facts of the system, verified on real artifacts, with its tooling beside it — removable, graftable, without touching the method.

### Gestures

Six gestures, on three moments. See [GESTURES/](GESTURES/).

| Moment | Gesture | Does |
|---|---|---|
| **entry** | [ADMIT](GESTURES/ADMIT.md) | orient a new piece — its place and criterion, its nature, what it must carry — and inscribe it in the instance. Guides; does not forge |
| **configuration** | [REVIEW](GESTURES/REVIEW.md) | pass the instance in review with the user, and propose how far each new version goes. Systematic, even without a clue; leaves the trace every exit requires |
| **exit** | [QUALIFY](GESTURES/QUALIFY.md) | report whether the pieces are fit to leave. Reports; never repairs |
| | [PACKAGE](GESTURES/PACKAGE.md) | assemble, in the apparatus, the units and everything the destination holds. Refuses what is not conform |
| | [DEPLOY](GESTURES/DEPLOY.md) | carry the apparatus to the channel the review chose. Dry-run by default |
| | [DOCUMENT](GESTURES/DOCUMENT.md) | write each unit's orchestration, and the destination's home page |

Only ADMIT and REVIEW write in the instance. No gesture writes in a piece. Every exit begins with REVIEW: PACKAGE refuses without a review of the current revision.

Two separations hold the exit gestures: **packaging is not transport** — one produces an inspectable unit, the other carries it; **verification informs, packaging commits** — the first may be mechanical, the second must be able to refuse.

### The Passage

1. **REVIEW** — derive the candidates by rule, read each at home and in its trace, show what changed, propose how far each new version goes and reread the pauses, piece by piece, write the instance.
2. **QUALIFY** — reread each piece that leaves against what it declares and the conventions. Report.
3. **PACKAGE** — assemble in the apparatus, and **stop at the first missing input**.
4. **Compare** with what is in service, from the apparatus.
5. **DEPLOY** — carry, to the channel the review chose. **DOCUMENT** — orchestrate.

A stop is a product, not a failure. Nobody surveys in advance what is missing: the gesture names it, by hitting it. If the missing input is of a kind another corpus would have to provide too, it enters the form of the instance; if no corpus could provide it, the defect is Agora's.

### Movements

A change between pieces is **applied** — no old form preserved alongside — but the corpus **knows what it did**. REVIEW records the movement when the user confirms it; PACKAGE embarks it in the unit; the carrier tells the consumer **once**, at the first session after the update; DOCUMENT keeps it in the orchestration for those without a carrier. The producer pushes, but it pushes while warning.

### Tooling, and Its Limits

Tooling covers what is mechanical — comparing states, transporting, recording presence, detecting change, generating what is integrally derivable — dry-run by default for anything that touches the outside.

What tooling cannot do: judge the quality of a presentation, write metadata for a system, verify a non-collision, decide a pause, how far a version goes, or a version level. Each requires knowing the whole or writing prose. The switch to tooling happens *when judgment disappears* — and for packaging it does not. **More tooling is not more discipline.**

---

## Applying Agora

Setting up a corpus, holding a piece, receiving a unit — what serves once: [references/applying.md](references/applying.md).

## Dependencies

The boundary with each neighbouring method is in [references/grammar.md](references/grammar.md).

- **Genesis** — workspace conventions, where the corpus's place sits and how it is declared, the README as the piece's declaration
- **Praxis** — gesture anatomy, tooling boundary
- **Kentauros** — conscious boundary crossing

---

*A corpus makes itself understood — and the whole knows what it holds.*
