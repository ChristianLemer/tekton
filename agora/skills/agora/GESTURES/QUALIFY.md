# QUALIFY

Report whether the pieces a unit will carry are fit to leave.

## Intention

Surface the gap between what a piece declares and what it actually carries, and between what the corpus's conventions require and what the piece does — before that gap reaches a consumer. Verification informs; it never repairs.

## When

- After REVIEW, before PACKAGE — on the pieces the confirmed composition designates
- A convention has been added or changed, and existing pieces predate it
- Periodically — drift accumulates silently and announces nothing

## Input

- The instance (`MANIFEST.md`, at the head of the corpus's place), reviewed at the current revision — which pieces, in which units
- Each piece in scope, in **both its states**, as version control holds them: the open chantier branch, if any, and `main`
- The references below, each at its home

**Where the references live.** A step that reads a reference nobody can locate compares nothing, and reports conformity. Before comparing, know which of these you are reading:

| What you compare against | Where it lives |
|---|---|
| what leaves, in which unit, for which system; what is paused | the instance, at the head of the corpus's place |
| that the corpus is kept, and where its place is | the workspace's README, and its agent instructions as the system file's *threshold* names them |
| what a piece declares — nature, source method, conditions of application | the piece's own README |
| which artifacts compose a deliverable, and where they go | the level that equips the forge, inside the piece's own cycle |
| the anatomy of each artifact | the **source method** the piece declares it follows |
| what a nature becomes in the target system, the system's limits, its threshold | the system file, in Agora's `SYSTEMS/` |
| the language of the published layer, the forbidden classes of identifier | the house conventions of the corpus |

Anything whose home is not in this table is out of reach. Say so; do not conclude.

**What a piece declares.** Three answers, in its README, in whatever shape — a section named *Status* or *État* that answers them is enough:

| Declaration | Answers | Values |
|---|---|---|
| **nature** | what is it? | grammar · method · persona — or what the corpus has named in addition |
| **source method** | what anatomy to expect of its deliverable? | the method's name |
| **conditions of application** | what does it need to act? | a carrier, a trigger, nothing |

**The source method has a second address, not a second authority.** Whoever works in a piece does not read its README. The method is also said where the system in use reads by itself, together with what makes it available, both committed with the piece — the system file's *threshold* names the files. The README remains where the declaration is read; the second place is its executed form.

## Output

A report, per piece — and one line for the workspace's declaration of the corpus: conform, or the specific gap. **No modification.**

## Sequence

1. **Read the workspace's declaration of the corpus.** Keeping a corpus is declared the way a method followed is, at two addresses: the workspace's README names Agora and says where the corpus's place is; its agent instructions say to load the skill `agora`, as the system file's *threshold* names the files. Are both there, and do they say the same thing — Agora, and the place this gesture runs from? Report a missing or disagreeing address; never write either.
2. **List the pieces** the instance designates for the units in scope, with their production cycle.
3. **Compare siblings before consulting rules.** For each convention, look at what the neighbouring pieces do. A written rule invites the special-case plea; unanimous practice minus one exception does not. Drift shows by contrast — and contrast is only a signal when it is unanimous: an even split is an author's choice, not a norm.
4. **Read the three declarations.** Are they there? Do not judge whether the answers are right: that is the author's. A README that still declares a maturity is not wrong, but it says in a second text what the trace already says — report it, so the author can drop it before the two disagree. Then read the **executable form of the source method**, as the system file's *threshold* names it: is it there, committed with the piece, and do the declared method, the named skill and the enabled unit say the same thing? A local or user setting does not count — it does not travel with the piece. Report a missing or disagreeing place: a method declared but out of reach is a consigne pointing at nothing, and work done without it leaves no trace.
5. **Check the presentation.** Does the deliverable carry `ABOUT.md` — what it is about, when it serves, as two texts — and is it in the artifact-layer language? Does *when it serves* name situations, not restate the object?
6. **Check the anatomy** the source method declares — main document, lateral documents, whatever that method says a deliverable carries. Note what is missing.
7. **Note levels that are skipped — and levels that determine nothing.** A production level absent: legitimate for a grammar, or a hole? A level that exists but never says what the forge must produce is the same hole with a folder in front of it. Read it for four things — which artifacts compose the deliverable and where they go, the language, the order of production where artifacts depend on each other, and what ACCEPT compares against. Natures, not a template.
8. **Compare the two states of the piece.** The only defect no reading of a single state reveals. The deliverable has one place; version control separates the states — the chantier branch holds what is in progress, `main` what is accepted, the tag what was delivered before. Read positions, not folders:
   - *a chantier branch ahead of `main` in the deliverable* — forged, never delivered; consumers hold an earlier version and nothing says so;
   - *the served unit differs from the deliverable on `main`* — delivered, never deployed, or edited at the destination; the reference is no longer knowable. The system file says how the two are confronted.

   The third gap — an artifact **written outside the cycle** — no longer shows as a difference between two folders. It shows in the next step, as an artifact the workshop never declared, and it is the one that **destroys**: the next FORGE, regenerated from an upstream that does not know it, rewrites the deliverable without it.
9. **Compare the deliverable to its own inventory, both ways.** Declared and absent is a gap. Present and undeclared is an **orphan** — born at the forge without an upstream, or deposited on `main` outside any chantier; the signature is the same, and so is the fate: nothing will regenerate it. An orphan artifact is not a surplus one. It is usually the right artifact, written by the right hand, deprived of its upstream. Report it so it can be **declared at the level that equips the forge** — never as something to delete. Same signature, opposite verdicts: report both, decide neither.
10. **Look at both tiers before concluding to a silence.** The piece's cycle declares *which* artifacts; the source method declares *the anatomy* of each. A reference absent from one tier may be complete in the other. Where the piece declares no source method at all, the anatomy tier is unreachable: report that, because every anatomy check on it is vacuous.
11. **Scan for forbidden identifiers** in what will leave — the classes the house conventions name. A scan only finds what it knows to name; say which list it used.
12. **Report — the conform pieces included.** One line per piece: the piece, what was compared, the observed state. A piece that passes must appear as passing; otherwise nothing distinguishes what was checked and found sound from what was never opened. Name explicitly what you could not compare, and why.

## Guardrails

- **Report, never repair.** A gap may require reopening a decision — that is an author's act, not a check's. The finding goes to the piece's cycle, which modifies and reprocesses. Agora never writes in a piece.
- **The line is declared or undeclared — not configuration or quality.** Anything with a written reference can be compared to it, form included. What cannot be judged is whether the written reference is the right one, or whether what was put in it is any good. Do not pretend otherwise in either direction.
- **A conform piece is not a good piece.** Conformity is a floor.
- **Do not confuse the three silences.** A missing piece is visible. A stale piece looks exactly like a current one — that is what this gesture exists for. And an expectation nobody wrote down produces no finding at all: where nothing is declared, say that nothing is declared.
- **A declaration is not a guarantee — what holds a rule is a comparison, not a text.** Where a rule is declared *and* reread, conformity holds; declared and never reread, it drifts silently. Never close a finding with « it is written »: ask what rereads it.
- **An absence at one tier is not an absence.** Before reporting that nothing is declared, open the other tier.
- Never run this from inside a single piece — a piece cannot know it is the only one doing otherwise.

## Source method

Agora
