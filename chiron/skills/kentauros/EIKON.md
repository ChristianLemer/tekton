# Eikōn — Profile Canvas

*The portrait that lets a collaboration start right.*

## What this is

The questions a person can answer so that any agent, on any platform, knows who it works with. The mechanism is defined in `KENTAUROS.md` (Foundations — Profile).

The canvas is **universal** — the questions apply to anyone. The answers are **personal** — they live in a file the person owns and controls.

A partial profile is better than none. Unanswered questions are skipped, not blocking.

## How it is used

- **All at once** — C, or an agent guiding C, goes through the canvas and writes the profile.
- **One part at a time** — when Si lacks knowledge of C to decide, it proposes to establish the relevant part (`KENTAUROS.md`, *Propose the Profile*). C may accept, decline, or keep the request for later.
- **Every session** — each harness the person uses loads the profile: the agent receives it, it does not look for it. If there is none, it works with its defaults — absence is a valid case.

The profile holds preferences, not setup: what the person likes, not what is installed on a machine. Tools belong there as taste — a tooling philosophy, a favoured kind of editor, an editing mode one cares about; what changes with the machine without the person changing has no place in it. It says where the person's knowledge lives — not a path, which describes a machine, but the answer to section 7. It gives the default; a project may override it where the override applies.

## Where a filled profile lives, and how it is installed

One profile per person, received by every agent. There is no fixed entry point: the profile lives where the person puts it, and each harness loads it.

**The place belongs to the person** — local or synced, it does not matter; a personal synced space is what lets the profile follow the person from one machine to another. Excluded:

- **a repository** — history keeps the file after deletion;
- **a space that belongs to someone else** — an employer's shared library, a company account, a team folder: the profile would belong to them.

**Establishing a profile ends with installing it**, done with the person the first time it is filled:

1. **Choose the place** — one that belongs to the person, as above.
2. **Wire every harness the person uses, and check it** — the configuration it loads every session receives the profile's real path. The agent knows its own harness; for the others, it asks the person or relies on their documentation. *For example, a harness that loads a user-level instruction file at every session, and lets it import another file, needs one line there pointing to the profile.* Then open a new session there and ask what it knows of the person: if the answer does not come from the profile, the wiring failed — silently, which is why it is checked.

A part established later goes into the installed profile: nothing to rewire. Moving the profile means installing it again — the new place, every harness rewired. The profile keeps no list of them: wiring is setup, not preference.

Where a harness loads nothing by itself, the agent reads the profile at the place the person gave.

> **The canvas is published; the answers never are.**

---

## Canvas

Each section has a **question**, **sub-questions** to go deeper if useful, and an **answer** — empty here.

---

### 1. Identity

**Question:** Who are you?

- Age, where you live?
- Family, important ties?
- Lasting passions, interests outside work?

> *(to be filled in — in the profile, at its place)*

---

### 2. Background

**Question:** Where do you come from, technically and professionally?

- What technical path? Languages, paradigms, turns?
- What founding experiences?
- What has left traces in the way you think?

> *(to be filled in — in the profile, at its place)*

---

### 3. Professional context

**Question:** Where do you work, and in what frame?

- Role, title, company?
- Business domain, regulatory constraints?
- Team: size, distribution, dynamics?
- Do you have organisational constraints, and how constraining are they for your role or for you?

> *(to be filled in — in the profile, at its place)*

---

### 4. Values and drives

**Question:** What keeps you going?

- What principles guide your work?
- What excites you? What puts you off?
- What temperament, day to day?

> *(to be filled in — in the profile, at its place)*

---

### 5. Leadership

**Question:** How do you guide others?

- What style of management or coaching?
- What beliefs about how teams work?
- What leadership experience?

> *(to be filled in — in the profile, at its place)*

---

### 6. Tools and taste

**Question:** What do you like to work with?

- What tooling philosophy?
- What kind of editor, what editing mode do you prefer?
- Preferred stack?
- Tools you refuse or avoid?

> *(to be filled in — in the profile, at its place)*

---

### 7. Where your knowledge lives

**Question:** Is there a place where I can store your knowledge? Where I can access it?

- Where does your personal knowledge live? Your work knowledge?
- What should never go where?

> *(to be filled in — in the profile, at its place)*

---

### 8. Expertise by domain

**Question:** Where do you stand on the gradient novice → practitioner → expert?

- Which domains do you master in depth?
- Where are you a competent practitioner without being an expert?
- Where are you a novice who needs guidance?

> *(to be filled in — in the profile, at its place)*

---

### 9. Collaboration style with Si

**Question:** How do you want to work with AI?

- What relationship? (assistant, peer, sparring partner, mentor…) — a default posture, which the problem at hand may override
- What level of initiative do you expect?
- What behaviours do you refuse?

> *(to be filled in — in the profile, at its place)*

---

### 10. Register and conversation style

**Question:** How do you communicate?

- What default register? (conversational, explicit, dense, technical…)
- How do you react to over-explanation?
- Does your register change during a conversation?

> *(to be filled in — in the profile, at its place)*

---

### 11. Orientation

**Question:** How do you think about problems?

- Dominant pole: theoretical (principles, models, structures) or practical (code, files, results)?
- Do you move between the two? In what context?

> *(to be filled in — in the profile, at its place)*

---

### 12. Language

**Question:** In which language(s) do you work?

- Preferred conversation language?
- Language for technical deliverables?
- Multilingualism: which language in which context?

> *(to be filled in — in the profile, at its place)*

---

### 13. Rhythm and availability

**Question:** How do you work over time?

- Short or long sessions?
- Synchronous (continuous dialogue) or asynchronous (occasional requests)?
- Times of day, time constraints?

> *(to be filled in — in the profile, at its place)*

---

### 14. What you love, where you are heading

**Question:** What draws you, and where are you going?

- What kinds of projects do you love? What aspects of things?
- Medium-term ambitions (technical, professional, personal)?
- Skills you are acquiring?

> *(to be filled in — in the profile, at its place)*

---

*No answers here: this document carries only the questions. Answers go into the profile, at the place the person chose.*
