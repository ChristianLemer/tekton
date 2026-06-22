---
name: genesis
description: Workspaces that explain themselves — naming and casing conventions, complete partition of zones (active domains and excluded zones, with a reference vault-level partition), README as hub, INTENTION declarations, Genesis links (semantic identity-based references that survive restructuring), excluded zones (Attic / Purgatory / Void with retention gradient), structural grammar from file to vault level, content & navigation, link-vs-copy regimes, governance, directives. Use when designing or evaluating a workspace structure, naming directories or files for clarity, deciding link vs copy regimes, framing how a method is declared in a workspace, or making an existing workspace self-explanatory to someone arriving fresh.
---

# Genesis

*Workspaces that explain themselves.*

A method for designing workspaces so that opening the folder is enough to start working. The workspace is the documentation. The structure is the process. The files are the instructions.

---

## Founding Conviction

**Space structures thought.** When meta and work are mixed, the mind oscillates between "what is this project?" and "where am I in my work?" — friction without value. Isolation enables focus. Structure reveals intention. The workspace *is* the documentation.

---

## Three Spaces

Genesis applies differently depending on context:

- **Thinking** — exploration, design, understanding. Flow matters more than traceability. Drift is natural.
- **Operational** — recurring processes (recruitment, onboarding, setup). Not audited, but needs consistency. Genesis makes the implicit explicit.
- **Compliance** — regulated, auditable. Not Genesis's concern. Build a narrow auditable path with domain-specific rules.

---

## Five Positions

Genesis takes an explicit stance on five tensions that run through its conventions:

**Minimal explicitness.** The cost of reading must be lower than the cost of guessing. Every convention added must earn its place. Visual conventions (casing, emoji, partition) are preferred because they communicate without reading. Formal explicitness is reserved for situations where the implicit fails — especially when Si is in the loop.

**Autonomy with conscious connections.** The workspace is the unit — portable, self-documented, copy the folder and go. But it doesn't live in isolation. Connections exist (Genesis links, declared methods, lexicon) and are treated as architectural decisions, not accidents.

**Explicit scale.** Each convention signals what level it operates at. Casing is micro (file). Emoji are meso (project). Partition is macro (vault). Don't mix levels in the same gesture.

**Progressive investment.** Genesis doesn't demand everything on day one. Foundational conventions (README, INTENTION, structure, partition) come at birth. Maturity conventions (TEMPERED, local method copies, epistemic qualification) come when the workspace earns them.

**Designed for the centaur.** The workspace serves C and Si together. But centaur conventions must not overload C when working alone. Some conventions are universal (partition, meta/work separation). Others are activable (epistemic qualification, formalized exclusion contract). The workspace must work for C alone and work *better* with Si.

---

## I — Structural Grammar

*How the workspace is built. From file level to vault level.*

### Complete Partition

A knowledge base should be organized as a complete partition — domains that cover everything, with no overlaps and no gaps. Every piece of content has exactly one home.

The power isn't in having categories. It's in having categories that **force attention**. When something comes in, you ask "what kind of thing is this?" and the structure tells you where it goes.

**Design the whole partition, not just the exit.** The excluded zones (7/8/9) are the easy part — they have a standard form and are documented below. The work is the *active* zones: they carry the domain and must be invented for each workspace. A workspace with three well-named exclusion zones and a vague active area has been organized backwards.

**Zone semantics, not zone names.** Each active zone answers one question: *what kind of thing lives here?* The answer must be sharp enough that filing is a reflex, not a judgment call. Two symptoms of a partition that isn't done: content that could plausibly go in two zones (overlap), and content with nowhere obvious to go (gap — it silently accumulates at the root or in the inbox).

**Name the zone by the state it holds, not by the category it contains.** `4. 📂 A Flawless Execution` and `4. 📂 Procedures` point at the same folder, but the first names what the zone is *for* — an aspiration the operator can fail or honour — while the second names a filing bucket. The full form (article included) is part of the convention, not decoration: an article turns a label into a claim. It also survives contact with reality better — a zone called *Procedures* silently accepts anything procedure-shaped, whereas *A Flawless Execution* keeps asking whether what you filed there belongs.

**A reference partition at vault level.** This is Saul — a real workspace, named so the example stays discussable. The *shape* is what transfers; write your own zone names:

| # | Emoji | Zone | What lives here |
|---|-------|------|-----------------|
| 0 | 🧹 | A Tidy Desk | Inbox — unsorted, pending triage |
| 1 | 🧠 | An Indisputable Mastery | Theory, principles, shared semantics |
| 2 | 📢 | An Obvious Presence | Outward-facing material (positioning, demos) |
| 3 | 📈 | Results in Abundance | Domain guidance that produces outputs |
| 4 | 📂 | A Flawless Execution | Runbooks, procedures, setup |
| 5 | 🌿 | A Nice Environment | Tooling, environment configuration |
| 6 | 🤝 | A Happy Team | People, profiles, roles |
| 7 | 💤 | A Curated Attic | Archived (see *Excluded Zones*) |
| 8 | 😈 | The Purgatory | Superseded (see *Excluded Zones*) |
| 9 | 🌀 | The Void | Discarded (see *Excluded Zones*) |

Read what this partition encodes. **0 is the inbox** — a partition needs a landing zone, or unsorted items corrupt the real zones. **1 → 6 moves from the abstract to the human**: semantics, then outward face, then output, then execution, then environment, then people. That ordering is itself a claim about the domain. **A zone may be empty at birth** and earn its content later — declaring it costs nothing and reserves the slot.

Note the drift in article as you cross into exclusion: the active zones are *A* / *An* (one instance among possible others — yours will differ), the excluded ones are *The* (there is only one Purgatory, one Void). The grammar carries the distinction before the number does.

Ten zones is not a rule. Between 5 and 10 is the practical range: fewer and the zones are too coarse to force attention, more and you can no longer hold the partition in your head.

### Naming Convention

**Two usages of numbers.** Numbers serve two distinct roles — context disambiguates. *Sequence* (inside a project workshop): 1 → 2 → 3, a path to follow. Zero is reserved for elements outside the sequence. Parallel elements share the same number. *Identification* (at partition or project level): stable labels. You don't traverse — you choose. High numbers (7, 8, 9) signal exclusion. Zero identifies infrastructure.

**Emoji convention.** Emoji follow the number to signal the nature of each zone visually. The standard set at **project level** (validated for consistent monospace terminal rendering) — distinct from the vault-level partition above, which numbers domains rather than stages:

| # | Emoji | Zone | Nature |
|---|-------|------|--------|
| 1 | 🔨 | Workshop | Where work happens |
| 6 | 📦 | Deliverable | Finished product |
| 7 | 💤 | Attic | Archives (dormant) |
| 8 | 😈 | Purgatory | Superseded (in reprieve) |
| 9 | 🌀 | The Void | Discarded (gone) |

The gap between 1 and 6 leaves room for intermediate spaces. The rhythm **1...6 | 7 8 9** reproduces the active/excluded separation. Emoji with variation selectors (U+FE0F) may render at inconsistent widths in monospace — test before adopting.

**Nested structures.** When structures nest, each level should use a different convention if it serves a different purpose. At project level, numbers are identifiers (with emoji). Inside the workshop, numbers are a sequence (without emoji).

### Folder as Workspace

Every level that produces work should be a folder. Inside the folder, casing separates concerns at a glance:

| Case | Role | Examples |
|------|------|----------|
| UPPERCASE | Directives, framing, structured artefacts | FRAME.md, CONSTRAINTS.md, CHOICES.md |
| TitleCase | The work itself — user ownership | Picture.md, Strategy.md |
| lowercase | Auxiliary material — scaffolding, transport, support | templates/, assets/ |

A deliverable can be a folder — UPPERCASE throughout signals "this is a product, not a workspace." Auxiliary subfolders use lowercase — they travel with the product but are not the product.

### Deliverable Packaging

A deliverable folder contains companion files of different natures. The placement of each file encodes its expected mode of consultation — a signal to the reader about how often they will need it.

**Permanent work tools** live at the root, next to the main document. These are files consulted continuously during work — a lexicon when operating in another language, a playbook when executing the cycle. They must be immediately findable.

**Support references** live in `references/`. These are files consulted on demand — catalogues of available types, specification tables, technical conventions. They serve a need, then recede.

The criterion is not the technical nature of the file. It is the frequency of consultation. A lexicon is not a reference — it is a companion. Placing it in a subfolder increases the access cost at every consultation.

### Excluded Zones

Three zones with a retention gradient:

| # | Emoji | Zone | Purpose | Contract |
|---|-------|------|---------|----------|
| 7 | 💤 | Attic | Archived/historical | Preserved for reference, not for active work |
| 8 | 😈 | Purgatory | Superseded content | Consultable for rollback, cleanable periodically |
| 9 | 🌀 | The Void | Discarded content | May be wiped without notification |

The gradient: **dormant → in reprieve → gone.** Purgatory is the landing zone for DELIVER. The Void gives AI a safe action: move here instead of delete. The contract applies to any operator — the exclusion is a property of the zone, not of the operator.

---

## II — Content & Navigation

*How the workspace explains itself. File and project level.*

### Declaring Intention

INTENTION.md at the root declares why the project exists. README orients navigation — what's here, where to go. INTENTION orients contribution — why this exists, what it serves. A workspace without INTENTION can be navigated but not meaningfully contributed to.

Recommended, not mandatory. Evolvable but deliberately — not a silent drift.

### README as Hub

The README is the sole entry point for any operator — C or Si. It declares everything: what this workspace is, what methods it follows, where to find things. An operator who reads only the README knows everything they need.

A good README helps decide **whether to drill down**: What is this? What's the scope? When should you go deeper? Be explicit about exclusions.

Progressive depth operates within documents. Attention markers — warnings, highlights, open questions — allow two reading speeds: fast scan and deep read.

### Nature and Placement of Instructions

The hybrid template + instruction is immediately actionable. Content first, instructions last. Never external. README is orientation only. Complex instructions extracted to local reference files — still inside the project. Splitting is fine if dependencies are loud.

### How Much Explanation

Simple for daily use. Never silent dependencies. Gate principle: "You must be familiar with X before proceeding." When structure can be shown, show it — visuals are documentation, not decoration.

With AI as a writing partner, the cost of documentation collapses. The discipline shifts from "write less" to "structure for progressive depth."

---

## III — Connections

*How the workspace relates to the world. Inter-project level.*

### Link or Copy

The regime depends on the relationship between source and consumer. A link is always a dependency — treat it as an architectural decision.

| Regime | When | What |
|--------|------|------|
| **Link** | Consumer in active adoption | They need the living source |
| **Copy** | Consumer stabilised | Protect from noise |
| **Pointer** | Source in active development | Temporary indirection |
| **Frozen copy** | Source stabilised | Decouple completely |

The transition between regimes is a conscious act, not a drift.

### Genesis Links

Reference by identity, never by path. Format: `Segment .. Segment .. Target`. Each segment is a human name. Left to right, broadest to most precise. Use the minimum segments needed. The goal is stability: a restructuring does not break the reference.

**Resolution.** Genesis links resolve by semantic matching, not exact string matching. Numeric prefixes and emoji are ignored — they aid perception but are not part of the folder's identity. Matching is case-insensitive and diacritics-insensitive. Segments can be abbreviated as long as they remain unambiguous. A workspace can define root keys (Mon Jardin, Saul, chezmoi) as navigation entry points — the topography of these keys is a contract between the operator and the agent. When a segment is ambiguous, add a segment to the left or ask for clarification.

| Link | Resolves to |
|------|-------------|
| `ANABASIS` | Obvious if there's only one |
| `Organon .. ANABASIS` | ANABASIS.md in Organon's deliverable |
| `Tekton .. Logos .. Organon .. ANABASIS` | Fully qualified |
| `Forge .. lessive` | A specific file in La Forge |
| `Kentauros .. Angles` | 1b. Angles/ in Kentauros workshop |

Generic names (README, REQUESTS) often need more segments. When in doubt: add a segment to the left until it's obvious.

### Declaring Methods

Methods are declared in the README by reference using Genesis links. `µ. METHODS/` appears only when methods are copied locally — a maturity marker, not a default. Genesis itself is not declared — the workspace structure *is* Genesis.

### Workspace Language

A workspace has one language. Folder names, file names, and content are in that language.

Methods are written once, in one language. Translation is the responsibility of the agent (Kentauros), not the producer. Each method contains a **lexicon** — a multilingual correspondence table for its technical terms, forged by the method's author.

### Parallel Variants

*Activable capability.* Separated by default. Each reader gets a clean version. Synchronise with AI assistance. Naming: language suffix on the deliverable folder (GENESIS/, GENESIS-FR/). Don't expose the machinery to the reader.

---

## IV — Governance

*How the workspace evolves and self-regulates. Project level.*

### Directives

Lateral forces that influence reasoning without participating in it. UPPERCASE files inside the level's folder.

Typed on two axes — **source** (internal vs external) and **binding force** (strong vs medium). The strong pair: CONSTRAINTS (external, imposed) and CHOICES (internal, decided). The medium pair: CONSIDERATIONS (external, terrain) and CONVICTIONS (internal, beliefs). TEMPERED has survived practice — the strongest form. FRAME stands apart as structural.

The catalogue is open — extensible by practice, not by drift.

**Two axes of conviction.** A fragment-conviction (vertical) irrigates the whole system — an axiom. A directive-conviction (horizontal) influences one level — revocable. A local conviction that survives across contexts rises. One that ossifies in place becomes a constraint disguised as wisdom.

### Input Channels

REQUESTS.md receives feedback from any operator at any level. Input channels live alongside directives but serve a different function: they feed the project rather than shaping its reasoning.

### Request Lifecycle

A request has three states: **open, done, or gone.** The elevation rule: if a closed request produced something worth remembering, elevate it into an artefact. The request itself is not the memory.

### Version Drift

Thinking space: accept drift entirely. Operational space: light versioning, conscious updates. Compliance space: not Genesis's concern.

### Epistemic Qualification

*Activable capability.* Assertions can be tagged by nature: documented, stated, connection, inference, speculation. The vocabulary is not prescriptive — a project may use fewer levels or different labels. The principle: qualify, don't leave implicit. Activate when the distinction matters — for stakeholder credibility or for calibrating AI trust.

---

## What Genesis Does Not Prescribe

- **Tools** — works with any filesystem
- **Gestures** — that's Praxis
- **Compliance** — that's the domain
- **Content** — Genesis structures; it doesn't tell you what to think

---

## The Test

Drop a competent stranger into the folder. In 10 minutes, without asking anyone, can they:

- Understand the structure
- Find what they need
- Start contributing
- Know where to put new things

If yes — it's a Genesis workspace.

---

## Relation to Praxis

Genesis designs the workspace — *what it contains*. Praxis animates the workspace — *what can be done in it*. The two are independent: a workspace can follow Genesis without Praxis. A workspace cannot follow Praxis without Genesis.

---

*The workspace teaches you how to use it.*
