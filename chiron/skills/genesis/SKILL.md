---
name: genesis
description: Use when you design a workspace, or judge one you have inherited; when a directory name is about to be chosen and should communicate before anyone reads it; when something must be referenced across workspaces and a path would break at the first restructuring; when content is superseded and needs somewhere to go that says how long it stays; when a method must be declared inside a workspace that consumes it; and when someone arrives fresh and the space has to answer what this is and where to start without you in the room. Not what can be done in the space — that is Praxis. Not whether the page reads well — that is Aisthesis.
---
# Genesis

*Workspaces that explain themselves.*

A grammar for designing workspaces so that opening the folder is enough to start working. The workspace is the documentation. The structure is the process. The files are the instructions.

---

## Founding Conviction

**Space structures thought.** When meta and work are mixed, the mind oscillates between "what is this project?" and "where am I in my work?" — friction without value. Isolation enables focus. Structure reveals intention. The workspace *is* the documentation.

## Three Spaces

- **Thinking** — exploration, design, understanding. Flow matters more than traceability. Drift is natural.
- **Operational** — recurring processes. Not audited, but needs consistency. Genesis makes the implicit explicit.
- **Compliance** — regulated, auditable. Not Genesis's concern: build a narrow auditable path with domain rules.

## Five Positions

**Minimal explicitness.** The cost of reading must be lower than the cost of guessing. Every convention must earn its place. Visual conventions (numbers, emoji, casing) are preferred because they communicate without reading. Formal explicitness is reserved for where the implicit fails — especially when Si is in the loop.

**Autonomy with conscious connections.** The workspace is the unit — portable, self-documented. Its connections (Genesis links, declared methods, lexicon) are architectural decisions, not accidents.

**Explicit scale.** Each convention says what level it operates at. Casing is micro (file). The partition belongs to the workspace, once. A method's sequence lives inside a zone; the folder it is given declares it.

**Progressive investment.** Foundational conventions (README, INTENTION, partition) come at birth. Maturity conventions (TEMPERED, local method copies, epistemic qualification) come when the workspace earns them.

**Designed for the centaur.** The workspace serves C and Si together: it works for C alone, and *better* with Si.

---

## I — Structural Grammar

### Complete Partition

A workspace that receives everything — a vault, or a project that lives alone — is organized as a complete partition: zones that cover everything, with no overlaps and no gaps. Every piece of content has one home. The power is in categories that **force attention**: something comes in, you ask "what kind of thing is this?", and the structure answers.

**Each zone answers a filing question.** The name states what the zone is *for*; the question settles where a thing goes. A name without a question leaves filing to judgment, and judgment drifts. Two symptoms of an unfinished partition: content that could go in two zones, and content with nowhere to go.

**All zones are always present** — even empty. Their presence tells the human everything that can exist here, and it calls for the right filling — from Si as much as from C. An absent zone is a question no one asks anymore. **Each zone carries a short README** — what it is, its filing question, what lives there and what does not: it guides filing, and keeps an empty zone present where an empty folder would not survive.

**What a method produces lives in the zone that answers its question** — *how do I produce?* — and the method describes the inside of that zone. A project filed in a zone repeats neither the partition nor the excluded zones: it explains itself, and files what it discards in the workspace's 7/8/9.

Genesis provides a **reference partition** — 0 🧹 inbox, 1–6 active, 7 💤 8 😈 9 🌀 excluded; the shape is kept, names may be adapted. Zones, questions, zone READMEs and boundaries: references/partition.

### Naming Convention

**Two usages of numbers.** *Identification*: zones of the partition carry stable numbers — you choose, you don't traverse. High numbers (7, 8, 9) signal exclusion; 0 is the inbox. *Sequence*: inside a zone, where a method traces a path, numbers are steps — 1 → 2 → 3. Zero marks inputs outside the sequence; parallel elements share a number.

**One emoji per zone**, after the number, so a zone is recognized before it is read. The rhythm **0…6 | 7 8 9** reproduces the active/excluded separation. Test emoji in a monospace terminal before adopting — see references/emoji.

**Nested structures use different conventions.** Number + emoji for zones; number alone for a sequence inside one.

### Folder as Workspace

Every level that produces work is a folder. Inside it, casing separates concerns at a glance: **UPPERCASE** for directives and framing (CHOICES.md), **TitleCase** for the work itself (Picture.md), **lowercase** for auxiliary material — scaffolding, transport, support (templates/, references/).

A deliverable can be a folder: UPPERCASE throughout says "this is a product, not a workspace"; lowercase subfolders travel with the product but are not the product.

### Deliverable Packaging

Placement promises a mode of use. **Permanent work tools** — consulted continuously, like a lexicon — live at the root beside the main document. **On-demand references** — catalogues, specification tables, developed examples — live in `references/`. The criterion is frequency of use, never theme: splitting a deliverable by topic files by subject what should be filed by use.

**The head of the main document is the closest place** — what remains when no one reads to the end: a human skimming, an agent that keeps only the beginning of what it loaded. What must stay present goes first; on-demand detail moves to `references/`, and the main document points to it where the principle is stated.

### Excluded Zones

| # | Zone | Purpose | Contract |
|---|------|---------|----------|
| 7 | 💤 Attic | Archived | Preserved for reference, not for active work |
| 8 | 😈 Purgatory | Content whose keeping is in doubt | Consultable for a while, cleaned periodically |
| 9 | 🌀 The Void | Discarded | May be wiped without notice |

The gradient: **dormant → in reprieve → gone.** The Purgatory takes what you are not sure you should keep, so it does not linger, forgotten. The Void gives AI a safe action: move here instead of deleting. No operator reads, cites or relies on them; anyone may use them as destinations.

---

## II — Content & Navigation

### Declaring Intention

INTENTION.md at the root declares why the project exists. README orients navigation; INTENTION orients contribution. Recommended, not mandatory; evolvable, deliberately.

### README as Hub

The README is where the workspace speaks, for any operator. It declares what the workspace is, its perimeter, the methods it follows, where things are — and helps decide **whether to drill down**, exclusions included. Normally a folder that must explain itself has a README. When another file naturally plays that role — a deliverable's main document, an entry file a tool imposes — no README is added beside it: it would only repeat it.

### One Threshold per Reader

Whoever orients and whoever acts do not come in through the same door. Each reader may have its threshold, but every threshold points back to the README rather than repeating it. The agent's threshold is `AGENTS.md` at the root of the workspace and of any folder handed to a method, recommended as soon as an agent works there: only what serves the agent. README and AGENTS.md cite each other; neither copies the other. The name is the ecosystem's standard; what the agent does on arrival is Praxis.

### Instructions and Explanation

Content first, instructions last. Never external, never silent: if something outside is needed, say it loudly. Simple for daily use; detail can live in local reference files. Progressive depth: attention markers — warnings, highlights, open questions — allow a fast scan and a deep read. When structure can be shown, show it. With AI as a writing partner, the discipline shifts from "write less" to "structure for progressive depth."

---

## III — Connections

### Link or Copy

The regime follows the relationship: **link** while the consumer is in active adoption, **copy** once it has stabilised, **pointer** while the source moves too fast to copy, **frozen copy** once the source has stabilised. A link is always a dependency. The transition between regimes is a conscious act, not a drift.

### Genesis Links

Reference by identity, never by path: `Segment .. Segment .. Target`, broadest to most precise, minimum segments needed. A restructuring does not break the reference. Resolution is semantic — numeric prefixes and emoji ignored, case- and diacritics-insensitive, segments abbreviable while unambiguous. Root keys (`<garden>`) belong to the user, not to a workspace or a machine. Rules and examples are in references/links.

### Between Workspaces

**Don't point into another workspace — ask it.** Launch an agent in each; the one that needs something addresses its request to the other's agent, which finds its own way. You depend on the workspace, not on its inside — and it works because every workspace explains itself. Genesis links remain the reference between published methods. How the request is made belongs to Praxis.

### Declaring Methods

**The folder given to a method declares it**, at every level and both thresholds: its README names it with a Genesis link, its `AGENTS.md` says what the agent loads. The level above only says what the folder holds and points there — two declarations diverge. A zone's line: references/partition. `µ. METHODS/` appears only when methods are copied locally. Genesis itself is not declared — the structure *is* Genesis.

### Three Languages

Often one. **Spoken** — each person's own; Genesis does not govern it. **Described** — one per workspace: folder names, files, content, in the common language of those who work there. **Delivered** — one or several: when it differs from the described language, it is a decision, declared where the artefact is decided. By default, one for everything; next, a common language for documents and one or more for delivery.

A method is written once and not duplicated: the agent translates. Each method carries a **lexicon** its author forges for terms literal translation would betray. Exception: an audience without access to the agent gets a frozen translated copy. Genesis's own lexicon is lexicon.md.

### Parallel Variants

*Activable.* Several delivery languages or audiences mean separate variants, each reader getting a clean one. Variants concern only what leaves; they are made together from the same source, never one from another — the forge keeps them aligned. Naming: language suffix on the folder (GENESIS/, GENESIS-FR/); no suffix is canonical.

---

## IV — Governance

### Directives

Lateral forces that shape reasoning without being it — UPPERCASE files inside a level's folder. Typed on two axes, **source** and **binding force**: CONSTRAINTS (external, strong), CHOICES (internal, strong), CONSIDERATIONS (external, medium), CONVICTIONS (internal, medium), TEMPERED (proven by practice, strongest); FRAME is structural. At a workspace's root, no directive files: the README states the perimeter and shared rules; AGENTS.md, what serves the agent. The catalogue is open — extended by practice, not by drift. See references/directives.

### Input Channel

A project must be able to **receive** — from any operator, at any level, without contaminating work in progress. The channel lives **outside the workspace**: a request changes state, while the workspace holds documents that are rewritten. The README says where it is. A request is **open, done, or gone**. What it produced worth keeping is elevated into the workspace — a fragment, a deliverable, a README. The request is not the memory; the artefact is — so losing the channel never loses the workspace.

### Version Drift

Thinking space: accept drift. Operational space: light versioning, conscious updates. Compliance: not Genesis's concern.

### Epistemic Qualification

*Activable.* Tag assertions by nature — documented, stated, connection, inference, speculation. Qualify rather than leave implicit, when the distinction matters: for credibility, or for calibrating Si's trust.

---

## Inside and Outside

What stays speaks to those who work there; what leaves, to those who receive it — in a form set by the method that produces it.

## The Test

Drop a competent stranger into the folder. In ten minutes, without asking anyone, can they understand the structure, find what they need, start contributing, and know where to put new things? If yes, it is a Genesis workspace.

## What Genesis Does Not Prescribe

Tools — any filesystem works. Gestures — that is Praxis (Tekton .. Praxis .. PRAXIS). Compliance — that is the domain. Content — Genesis structures; it does not tell you what to think.

## Relation to Praxis

Genesis designs the workspace — *what it contains*. Praxis animates it — *what can be done in it*: gestures, the µ namespace, orientation, agent bootstrap. A workspace can follow Genesis without Praxis; not Praxis without Genesis.

---

*The workspace teaches you how to use it.*
