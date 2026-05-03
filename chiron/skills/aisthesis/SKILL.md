---
name: aisthesis
description: Readability in a textual workspace — the principles of visual communication in a Markdown environment. What the reader does (perceive before reading, read at two speeds, write to be read, understand without reading, show before concluding), governance (just measure, rhythm), affordance (signals of expected interaction), tool independence. Use when designing the visual layer of a Markdown document, balancing density and breathing, choosing between prose / list / table / diagram, making affordance explicit for both human and AI readers, or evaluating whether an artefact is legible at a glance.
---

# Aisthesis

*Readability in a textual workspace.*

The principles of visual communication in a Markdown environment. Genesis designs the workspace. Praxis operates it. Aisthesis makes it readable — and shows what to do next.

Every visual choice carries information or noise. Aisthesis provides the principles to tell the difference.

---

## The idea

A Markdown file looks like plain text. It is not. It carries information on multiple simultaneous layers. A reader — human or AI — does not just read words. They perceive structure, visual weight, signals, symbols, spatial representations.

Readability is not a property of the text. It is a property of the orchestration of its layers.

---

## What the reader does

Aisthesis is organised around what the reader *does* — not around the medium.

### 1. Perceive before reading

The eye precedes the brain. Before the first word, the reader has already perceived density, structure, presence of signals. This pre-linguistic perception decides whether they will read, scan, or close.

**Document structure.** The heading hierarchy creates a navigation map visible at first glance. Splitting content into separate documents creates units of meaning. A document title is a promise; a section title is a signal. Structure is not formatting — it is attention architecture.

**Density.** A 20-line paragraph without a break repels. The same content in four 5-line paragraphs invites. Spacing between sections creates rhythm. Separators (`---`) mark a change of register.

**Symbols.** Two registers of compressed semantics operate before reading. Emoji (`🧠`, `📐`, `🔨`) communicate the *nature* of a space — they categorise and signal a register. Numeric prefixes (`1.`, `6.`, `8.`) communicate *position in a cycle*. Together they read as one: `1. 🔨 Workshop` says both *where* you are and *what* the space does, before a single word is read. This is not decoration — it is positional language.

### 2. Read at two speeds

A document serves two readers: the one who scans and the one who reads deeply. Both read the same file. A well-designed document serves both without sacrificing either.

**Typographic styles.** **Bold** signals importance — it is the scan channel. *Italic* signals nuance — it is the deep-read channel. `Inline code` signals the literal. Each style is a semantic channel, not decoration. A wall of bold signals nothing.

**Attention markers.** Callouts, blockquotes — structured interruptions of the flow. They let the scan catch only the signals and let the deep read integrate them. The marker is a contract: "you can go fast, but don't miss this."

**Headings as filters.** A descriptive heading ("How to declare methods") serves the scan — you know whether the section is relevant without reading it. A vague heading ("Considerations") serves no one.

### 3. Write to be read

Prose is a visual register like any other — with its own strengths, anti-patterns, and rules.

**One idea per unit.** One paragraph, one idea. One section, one theme. When two ideas share the same block, neither is perceived clearly.

**Prose before bullets.** A bullet list is an admission of parallel structure. When the elements are not parallel, the list lies. A paragraph that develops an argument is more honest than a list that chops it up.

**Tone as signal.** Peer-to-peer, not top-down. Propose, don't prescribe. Acknowledge reality before suggesting change. A prescriptive document repels. A document that proposes invites.

### 4. Understand without reading

Some information resists prose. Relationships, comparisons, hierarchies — text linearises them at a cost. The space of the page can show directly.

**Tables.** Comparisons, catalogues, registers. Tabular information is grasped at a glance. But a 30-row table is as impenetrable as a 30-line paragraph.

**Lists and trees.** Hierarchies, sequences, enumerations. Indentation shows belonging. Numbering shows order. The risk: the bullet list as a lazy crutch.

**Diagrams.** Flows, relationships, states, sequences. Mermaid for formal structures, inline SVG for free-form illustrations. A diagram is documentation, not illustration.

**Images.** The richest and most expensive register. Useful when the referent is visual by nature. An image without a caption is an image that does not communicate.

### 5. Show before concluding

The narrative arc is a readability tool that operates at the level of an entire document. The pattern that works:

1. Current state — describe the situation as it is, without judgement
2. Reframe — introduce a distinction that unlocks a better model
3. Mechanism — show concretely how it works
4. Concrete example — a real case, walked through
5. What it yields — tangible deliverable, not abstract promise
6. Discussion — open questions, framed as invitations

The pattern extends beyond presentations. A method deliverable, a fragment, a README all follow the same logic. The common thread: start with what is, show what you make of it, let the reader see for themselves. Never start with the conclusion.

---

## What governs the whole

### Just measure

Every visual layer has a yield that rises then falls with frequency of use:

- A wall of **bold** signals nothing — everything is important, therefore nothing is
- An emoji on every line turns visual semantics into background noise
- A document packed with callouts makes every sentence scream
- A 30-row table is as impenetrable as a 30-line paragraph
- Bullets everywhere — prose disappears, and thinking with it

The central anti-pattern of Aisthesis is not the absence of formatting — it is excess. A bare document under-exploits the medium. An overloaded document sabotages it. Readability lives between the two.

This principle is confirmed by established sources: Tufte's data-ink ratio and smallest effective difference, Bringhurst's typography in service of text, Müller-Brockmann's invisible grid. They did not found Aisthesis — they confirm it.

### Rhythm

The cadence of a document — the alternation between density and breathing, between prose and visuals, between long sections and short ones — guides the reader without their awareness.

**Separators as register changes.** A `---` between two sections signals a change in tone, abstraction level, or subject. Without separators, the reader must guess where the register shifts. With too many, every section floats disconnected.

**Prose/visual alternation.** An entirely textual document tires through monotony. An entirely diagrammatic one tires through cognitive overload. The alternation between a paragraph that explains and a table that summarises — or a diagram that shows then a text that interprets — creates natural breathing.

**Section length variation.** Uniformly long sections numb. Uniformly short sections chop. Variation in length is a signal: a short section after a long one says "pause." A long section after several short ones says "we go deeper here."

Rhythm is transversal — it concerns neither the choice of layers nor their dosage, but their sequencing. This territory remains young.

---

## The bridge to action

### Affordance

A document does not merely sit there to be read — it signals the nature of the interaction it expects. Read, contribute, execute, navigate. If the expected interaction is not perceptible before the first line, that is a design failure.

**File name.** A declarative name ("Position", "Picture") invites reading — it is a state. An imperative name ("FORGE", "OBSERVE", "DELIVER") invites action — it is a gesture. A conventional name ("README", "REQUESTS", "CHANGELOG") carries an implicit contract inherited from the software ecosystem.

**Case.** UPPERCASE for directives and gestures (CONSTRAINTS, CHOICES, FORGE) — it signals authority or action. Normal case for narrative content — it signals reading.

**Position in the structure.** A file at the root (README.md, INTENTION.md) says "read me first." A file in `µ. LOCAL/GESTURES/` says "execute me." A file in `6. 📦 Deliverable/` says "I am a finished product — consume me."

**End of document.** A document that ends with a Navigation section invites exploration. A document that ends with a principle invites reflection. The end of a document is an affordance — it says what the reader should do next.

Affordance has two consumers. The human reader perceives signals visually and interprets them through cultural habit. The AI agent perceives the same signals but interprets them through instruction. The boundary between Aisthesis and Kentauros passes exactly here: Aisthesis designs the signal, Kentauros teaches the agent to consume it.

---

## Tool independence

Aisthesis principles are independent of any tool. Obsidian, VS Code, GitHub, a bare text editor — implementations change, principles hold. Markdown is the common medium, not the constraint.

---

## Characteristics

A workspace made readable by Aisthesis tends to have:

- **Structure as attention architecture** — visual hierarchy guides before content does
- **Two reading speeds** — fast scan and deep read coexist in every file
- **Intentional typographic styles** — each style is a semantic channel
- **Attention markers** — callouts and blockquotes as contracts with the reader
- **Semantic symbols** — emoji and numeric prefixes as positional language, not decoration
- **Prose as a conscious register** — one idea per unit, descriptive headings, peer-to-peer tone
- **Narrative arc** — show before concluding, let the reader see for themselves
- **Appropriate visual registers** — tables, diagrams, images chosen for the type of information
- **Just measure** — every layer used with intention, not habit
- **Rhythm** — cadence between density and breathing across the document
- **Affordance** — the document signals what kind of interaction it expects

---

## Relation to Genesis and Praxis

Genesis designs the workspace — *what* goes *where*. Praxis operates the workspace — *what to do*. Aisthesis makes the workspace readable — *how* meaning becomes visible, and *what interaction* the document expects. The three form the Topos triptych: design, operate, perceive.

Aisthesis prescribes neither structure (Genesis) nor action (Praxis). It prescribes form in service of meaning — and signals that bridge perception to action.

---

*Information is perceived before it is read.*
