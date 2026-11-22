# Reference Partition

*The zones, their filing questions, and the boundaries that matter.*

---

Drawn from a workspace in service. The *shape* is what transfers — numbering, filing questions, the exclusion tail; zone names may be adapted. Names in other languages are in the lexicon: take them from there, never translate a zone name word by word — every round trip shifts it.

| # | Emoji | Zone | Filing question | What lives here |
|---|-------|------|-----------------|-----------------|
| 0 | 🧹 | A Tidy Desk | *how do I work?* | Inbox — unsorted, pending triage |
| 1 | 🧠 | An Indisputable Mastery | *what do I know?* | Theory, principles, shared semantics |
| 2 | 📢 | An Obvious Presence | *who sees me?* | Outward-facing material |
| 3 | 📈 | Results in Abundance | *how do I produce?* | Guidance leading to concrete outputs — and what a method produces |
| 4 | 📂 | A Flawless Execution | *how do I do it the same way twice?* | Runbooks, procedures, setup |
| 5 | 🌿 | A Nice Environment | *what do I work with?* | Tooling, environment configuration |
| 6 | 🤝 | A Happy Team | *who with?* | People, profiles, roles |
| 7 | 💤 | A Curated Attic | — | Archived |
| 8 | 😈 | The Purgatory | — | Keeping in doubt |
| 9 | 🌀 | The Void | — | Discarded |

The ten zones organize a workspace that receives everything — a vault, or a project that lives alone — once, all of them always present. A project filed in one of its zones does not repeat them.

---

## Zone READMEs

Every zone carries a short README. This is what each one says; the agent writes it in the workspace's description language, taking the zone name from the lexicon.

> **[#] [Emoji] [Zone name]** — *[filing question]*
> What lives here: […]
> What does not: […] — and where it goes instead.
> Method followed: [Genesis link] — *only when the zone is handed to a method*; the zone then carries an `AGENTS.md` saying what the agent loads.

| # | What lives here | What does not — and where it goes |
|---|-----------------|-----------------------------------|
| 0 | Whatever has just arrived and is not yet filed | Anything already sorted — it goes to its zone; nothing stays here for good |
| 1 | Knowledge you can account for — theory, principles, shared semantics, regulations | How to run this installation (4); what you produce from it (3) |
| 2 | What faces outward — offering, positioning, demos | Internal work that is not meant to be seen (3) |
| 3 | What you produce, and the guidance and methods that lead to it | Procedures that repeat identically (4); the knowledge behind it (1) |
| 4 | What runs the same way twice — runbooks, procedures, setup, compliance procedures | The reasoning behind them (1); one-off production (3) |
| 5 | What you work with — tools, configuration, dependencies | Instructions for using them identically every time (4) |
| 6 | The people who take part — profiles, roles | The work itself; tooling (5) |
| 7 | Archived — kept for reference, not for work | Anything still in use; anything whose keeping is in doubt (8) |
| 8 | What you are not sure you should keep | Anything you know you keep (7) or know you discard (9) |
| 9 | What is discarded — may be wiped without notice | Anything someone may still need (8) |

---

## Design the Whole Partition

The excluded zones (7/8/9) are the easy part — they have a standard form. The work is the *active* zones: they carry the domain. A workspace with three well-named exclusion zones and a vague active area has been organized backwards.

## Name the Zone by the State It Holds

`4. 📂 A Flawless Execution` and `4. 📂 Procedures` point at the same folder, but the first names what the zone is *for* — an aspiration the operator can fail or honour — while the second names a filing bucket. *Procedures* silently accepts anything procedure-shaped; *A Flawless Execution* keeps asking whether what you filed there belongs. Put an article where the phrase wants one — active zones tend to *A* / *An* (one instance among others), excluded ones to *The* (there is only one Void) — and never add one for the sake of alignment: `Results in Abundance` needs none.

## Zone 3 Against Zone 4

*How do I produce* against *how do I do it the same way twice*: guidance that leads to a result — interpretation rules, heuristics, reference workflows — against what runs identically — runbooks, setup. Read either gloss alone and the two zones blur; each holds only against the other.

## Zone 1 Against Zone 4

The most disputed boundary, and the names do not carry it. Zone 1 holds knowledge you can account for: understood, argued, taught; it outlives a post. Zone 4 holds what brings *this* environment up — provisioning a machine, obtaining access, refreshing a repository. The first is learned, the second applied.

**Imposed knowledge is still knowledge.** Knowing how to work an enforced toolchain is a competence: zone 1 is not *what I chose to learn*, it is *what I can account for*.

**A regulation goes in zone 1; the procedure for complying with it in zone 4.** A regulation says what must be true, not how to proceed. Filing it under execution would merge it with its implementation, so that rewriting the procedure would move the regulation.

**What the location cannot say, epistemic qualification says.** A manual and a regulation differ by *source of authority*, not by subject — `documented` against `stated`. The partition files by subject; qualification states the authority. Spending a zone on authority would leave a guide interpreting a regulation — explanatory in form, binding in reach — with no zone despite having one subject.

## What the Partition Encodes

**0 is the inbox** — a partition needs a landing zone, or unsorted items corrupt the real zones. **1 → 6 moves from the abstract to the human**: semantics, outward face, output, execution, environment, people — an ordering that is itself a claim about the domain. **An empty zone stays declared**: it costs nothing, reserves the slot, and calls for its content.

A partition of your own design holds between five and ten zones: fewer and they are too coarse to force attention, more and you can no longer hold the partition in your head.
