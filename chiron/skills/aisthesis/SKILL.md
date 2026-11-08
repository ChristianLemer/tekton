---
name: aisthesis
description: Use when a document is written and the question shifts from whether it is correct to whether it will be read; when density and breathing need balancing — a wall of prose repels, the same content in four paragraphs invites; when a subject has more dimensions than prose can hold at once and demands a table, a diagram, a visual artefact so it can be thought about at all; when a reader must know at a glance what to do next; when emphasis is about to be added and should still mean something the fifth time; and when an artefact must be legible to a human and an agent at once, without two versions. Not the structure of the space — that is Genesis. Not what can be done in it — that is Praxis.
---
# Aisthesis

*Readability in a textual workspace.*

The principles of visual communication in a working space. Genesis designs the workspace. Praxis operates it. Aisthesis makes it readable — and shows what to do next.

Every visual choice carries information or noise. Aisthesis provides the principles to tell the difference.

---

## The idea

A Markdown file looks like plain text. It is not. It carries information on several simultaneous layers. A reader — human or AI — does not just read words. They perceive structure, visual weight, signals, symbols, spatial forms.

Readability is not a property of the text. It is a property of the orchestration of its layers.

---

## Meaning and form

Everything Aisthesis says rests on one distinction.

**Meaning** is what the author wants to stand out: this matters more than the rest, this belongs to that, this is in such a state. It is decided while writing, and it depends on no tool.

**Form** is how that meaning is made visible: structure, position, emphasis, typeface, colour, language, format. Form changes with the medium — a text file, a web page, a status screen — and can change without touching the meaning.

Aisthesis lives on the side of meaning. Its principles say what must reach the eye; the choice of means comes afterwards, for the reader's eye and the medium at hand.

**Emphasis exists only if it is perceived.** The author knows what they meant to mark; the reader receives only what they see. A means the eye cannot separate, or that the rendering erases, leaves the intention without effect — and the failure is silent: the author believes they signalled, the reader does not know they missed anything. Distinction belongs to the one who perceives, not to the intention of the one who writes.

Readability is thought at the level of meaning and checked in the rendering.

---

## What the reader does

Aisthesis is organised around what the reader *does* — not around the medium.

### 1. Perceive before reading

The eye precedes the brain. Before the first word, the reader has already perceived density, structure, the presence of signals. This pre-linguistic perception decides whether they will read, scan, or close.

**Structure.** The heading hierarchy draws a map visible at a glance. Splitting content into documents creates units of meaning. A document title is a promise; a section title is a signal. Structure is not formatting — it is attention architecture.

**Density.** A compact block repels; the same content, given room, invites. Space between parts sets the cadence; a separator marks a change of register.

**Symbols.** A sign placed in a name tells the *nature* of a space; a numeric prefix tells its *position* in a whole. Read together, they say where you are and what the space does: `1. 🔨 Workshop`, before a single word is read. This is not decoration — it is positional language.

### 2. Read at two speeds

A document serves two readers: the one who scans and the one who reads deeply. Both read the same text. A well-designed document serves both without sacrificing either.

**Distinct channels.** **Bold** signals importance — it is the scan channel. *Italic* signals nuance, a term introduced — it is the deep-read channel. `Inline code` signals the literal. Each style is a channel of meaning, not decoration.

**Attention markers.** Callouts and blockquotes are structured interruptions of the flow. The scan catches only them; the deep read integrates them. The marker is a contract: "you can go fast, but don't miss this." See the [callout convention](references/convention-callouts.md).

**Headings that suffice.** A descriptive heading tells the scanner whether the section concerns them without reading it. A vague heading ("Considerations") serves no one.

### 3. Write to be read

Prose is not a neutral background. It is a register like any other — with its own strengths, anti-patterns, and rules.

**One idea per unit.** One paragraph, one idea. One section, one theme. When two ideas share the same block, neither is perceived clearly.

**Prose when thought unfolds.** A bullet list asserts that its items are parallel. When they are not, the list lies — and hides behind an appearance of order the reasoning it has cut. An argument develops in sentences.

**Tone as signal.** Peer-to-peer, not top-down. Propose, don't prescribe. Acknowledge what is before suggesting change. Tone decides whether the reader feels invited or subjected.

Prose is the richest register and the riskiest: its defects do not look like defects. A wall of text, a disguised list, an empty heading pass for ordinary text.

### 4. Understand without reading

Some information has a shape — a comparison has rows and columns, a hierarchy has levels, a flow has branches. Prose flattens it, and asks the reader to rebuild in their head the shape the author had in view. When relations matter more than narrative, the page can show them: alignment says "comparable," indentation says "belongs to," an arrow says "leads to." The question is not *how do I write this?* but *what shape does this information have?*

**Tables** for what compares. **Lists and trees** for what nests and orders. **Diagrams** for flows, states, relationships — a diagram is documentation, not illustration; see the [Mermaid reference](references/mermaid-reference.md). **Images** when the referent is visual by nature, always captioned.

**To think, not only to read.** The same capability serves the one who works. Prose is sequential: the reader holds each dimension in memory while the next arrives. A visual artefact is simultaneous: the dimensions are present at once, and the eye relates them without effort. When a subject has more dimensions than prose can carry at once, it *demands* a visual artefact so that one can think about it at all — a status board, a companion pane, a grid of facets. The means follows what is at hand; the reflex is constant. Such an artefact serves the work, not its presentation.

### 5. Show before concluding

The order of a document changes what the reader makes of it. Starting with the conclusion asks the reader to believe it, then sets out to justify it. Starting with what is lets the reader see, then lets them conclude.

The arc that works: the current state, described without judgement; the distinction that sheds light; how it works; a real case walked through; what it yields; open questions, framed as invitations. At each step the reader has something to check.

The arc is not reserved for presentations. A method, a note, a README gain from the same order: what is, what you make of it, what the reader judges. The reader is not convinced — they see for themselves.

---

## What governs the whole

Four principles apply to every means at once. Each regulates a different dimension.

| Principle | Regulates | What fails without it |
|---|---|---|
| Just measure | quantity | excess — each signal drowns the others |
| Rhythm | sequence | uniformity — all dense exhausts, all airy scatters |
| A code is learned | constancy | the unstable sign — the reader falls back to reading |
| Signal without imposing | territory | the invasive signal — it takes over the reading |

### Just measure

Every means of readability first serves, then harms. Emphasis distinguishes while it is rare; everywhere, it distinguishes nothing. A symbol condenses meaning while isolated; multiplied, it becomes background. An alert interrupts the flow for a reason; repeated, every sentence screams. Structure helps; pushed too far, it chops the thought it was meant to carry.

The central anti-pattern of Aisthesis is not the absence of form — it is excess. A bare document under-uses the medium but stays readable. An overloaded one turns its means against their purpose. Readability lives between the two: each addition must still distinguish something, or it subtracts.

This principle is confirmed by established sources: Tufte's data-ink ratio and smallest effective difference, Bringhurst's typography in service of the text, Müller-Brockmann's invisible grid. They did not found Aisthesis — they confirm it.

### Rhythm

A document can have good headings, measured emphasis, well-chosen registers — and still tire. What is missing is neither the choice of means nor their quantity but their succession.

The reader moves by alternation. A dense passage calls for a lighter one; an explanation calls for what summarises or shows it; detail calls for overview. A separator says "the register changes." Length itself speaks: a short section after a long one is a pause; a long one after several short ones says "here we go deeper." Rhythm guides without being noticed — and is noticed mostly when it is missing.

### A code is learned

A symbol, a colour, a case, a prefix can speak before a word is read — but none does so by itself. The reader recognises what they have learned to recognise; everything else is one more mark to decipher.

A code is learned when it is **closed** — a set small enough to retain, which does not grow with each use — and **constant** — one sign, one meaning, wherever it appears. A sign that changes meaning from one document to the next, or two signs for the same meaning, undo what the reader had learned. Every new sign is one more thing to learn.

### Signal without imposing

To signal is to make information perceptible: a state, an alert, a change. To impose is to alter the reader's space so that it cannot be ignored. Both draw attention; only the first leaves the decision to the reader.

The screen, the page, the theme, the layout are where the reader works, set up for themselves. A signal enters as a guest: it takes a place proportionate to what it has to say, where the reader knows to find it, and stays there. This is not a matter of quantity — even a single signal that redraws someone else's space has crossed the line.

---

## The bridge to action

### Affordance

A document does not merely sit there to be read — it signals the interaction it expects. Read, contribute, execute, navigate. If the expected interaction is not perceptible before the first line, that is a design failure.

**Name.** A declarative name ("Position", "Picture") invites reading — it is a state. An imperative name ("FORGE", "OBSERVE") invites action — it is a gesture. A conventional name ("README", "CHANGELOG") carries a contract inherited from the software ecosystem.

**Case.** UPPERCASE for directives and gestures — authority or action. Normal case for narrative content — reading.

**Position in the structure.** A file at the root says "read me first." A file among gestures says "execute me." A file in the deliverable says "I am a finished product — use me."

**End of document.** A document that ends with navigation invites exploration. One that ends with a principle invites reflection. The ending says what the reader should do next.

Affordance has two consumers. A human perceives the signals and interprets them through habit; an agent perceives the same signals and interprets them through instruction. The same signal must serve both. This is where perception meets action: Aisthesis designs the signal, Praxis describes the gesture it announces, Kentauros how an agent receives it.

---

## Reach

Aisthesis was born in the textual workspace — Markdown files in a folder — and that remains its ground and the source of its examples. But its principles are set at the level of meaning, and hold wherever meaning must reach an eye: a Markdown file, an HTML page, a status screen. Obsidian, a code editor, a browser, a bare terminal — implementations change, principles hold. Aisthesis does not claim graphic design in general; it claims readability wherever someone works with text and its forms.

What depends on a tool or a medium is kept apart, so that the core travels without it:

- [colour-and-type](references/colour-and-type.md) — colour, typeface, signs, state signals: choosing the means once the meaning is decided
- [convention-callouts](references/convention-callouts.md) — which callouts to use, and how many
- [callouts-reference](references/callouts-reference.md) — available callout types
- [mermaid-reference](references/mermaid-reference.md) — supported diagram types

---

## Characteristics

A workspace made readable by Aisthesis tends to have:

- **Meaning before form** — what must stand out is decided first, the means chosen for the reader's eye
- **Structure as attention architecture** — visual hierarchy guides before content does
- **Two reading speeds** — fast scan and deep read coexist in every document
- **Intentional styles and markers** — each a channel of meaning, a contract with the reader
- **Positional language** — signs and prefixes that say where and what, before reading
- **Prose as a chosen register** — one idea per unit, headings that filter, peer-to-peer tone
- **Registers fit to the shape of information** — and visual artefacts where thought needs simultaneity
- **A narrative arc** — show before concluding
- **Just measure** — every layer used with intention, not habit
- **Rhythm** — cadence between density and breathing
- **A learned code** — few signs, each with one meaning, everywhere
- **Signals that stay in place** — informing the reader without taking over their space
- **Affordance** — each document signals the interaction it expects

---

## What remains to explore

Aisthesis is young. Two territories are identified but not yet mature:

- **Rhythm** — the principle holds; its patterns do not yet. Are there identifiable cadences? Can rhythm be prescribed, or only observed after the fact? How does it meet the narrative arc?
- **Affordance** — the boundary is set, the full grammar is not. How do name, case, position and ending compose into one system? Where exactly does Aisthesis end and Praxis begin?

---

## Relation to Genesis and Praxis

Genesis designs the workspace — *what* goes *where*. Praxis operates the workspace — *what to do*. Aisthesis makes the workspace readable — *how* meaning becomes visible, and *what interaction* the document expects. The three form the Topos triptych: design, operate, perceive.

Aisthesis prescribes neither structure (Genesis) nor action (Praxis). It prescribes form in service of meaning — and the signals that bridge perception to action.

---

*Information is perceived before it is read.*
