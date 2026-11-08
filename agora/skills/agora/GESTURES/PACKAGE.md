# PACKAGE

Assemble, for one system, the units and everything the destination holds — from the instance and the pieces' deliverables.

## Intention

Turn deliverables into a unit a system can install — inspectable in the apparatus before anything ships. Packaging commits: it refuses what is not conform, and produces only what the review confirmed, because a broken unit presents itself as valid and nothing downstream will say otherwise.

## When

- After REVIEW and QUALIFY, for each unit the instance declares
- A deliverable has changed and its unit no longer matches what is in service
- The composition changed: a piece added, removed, or reassigned

## Input

- The instance (`MANIFEST.md`, at the head of the corpus's place) — the folders of the pieces and of the apparatus, units and their channels, composition, pauses, movements, the files it names for the destination, **and the review trace**
- The revision identifier of the corpus
- The system file for the unit's target, in Agora's `SYSTEMS/` — rendering of natures, metadata keys, declared transformations, limits, where the number lives, the validator
- Each piece in scope: its README (nature), its deliverable with its presentation (`ABOUT.md`), read where the method it follows puts its product
- The readings file of each system the units target, at the head of the corpus's place — what the corpus has read for that system
- What is currently in service at the destination — its number, read there

## Output

The unit, assembled in the apparatus (`<apparatus>/<unit>/`), with its **inventory**: what it carries, from which deliverable, through which transformation, in which order, and what it excludes. Beside the units, what the destination holds besides them, generated or copied as the system file says: the catalogue of each channel, the files the instance names. The apparatus is then the complete image of the destination. Not yet shipped — DEPLOY carries it.

## Sequence

1. **Check the review trace.** Read **Last review** in the instance. If anything outside the instance and the apparatus has changed since that revision, or the tree is modified, **stop**: the review is stale, run REVIEW. Writing the review and assembling units are the only moves that leave the trace valid. No stamp to nod at — the state has moved, the whole must look again.
2. **Determine the scope** from the instance: the rule applied to the corpus as it stands, plus what the unit adds, minus what **Pauses** holds, minus what has no accepted deliverable yet. Prefer the rule to any list you could write — a rule stays true as the corpus grows.
3. **Package only what the review confirmed.** Every version that would leave has a channel the user confirmed at review. A version the review did not see — delivered after it, or never proposed — **stops**: back to REVIEW. Neither refuse by default nor ship in silence.
4. **Check fitness** — QUALIFY on the pieces in scope. **Stop if a piece fails**: see guardrails.
5. **Check non-collision.** No two units may claim the same name, nor overlap so much that a consumer cannot tell them apart. This requires seeing all units at once — it is why a piece cannot package itself.
6. **Select from each deliverable** what the system file says the piece's nature becomes. A unit is not a copy of a deliverable: it takes what the system consumes — usually the main document and what the system has a place for — and leaves the rest in the workshop.
7. **Derive the metadata** from the presentation the deliverable already carries, by the mapping the system file states. Compress if the system demands density; never write here from scratch. The reading belongs to the corpus: keep it in the system's readings file, at the head of the corpus's place, in the form the system file gives — never beside the tooling. If the presentation is missing, the deliverable is incomplete: back to step 4.
8. **Apply the declared transformations, and no other.** The system file lists what rendering may change — an address shift, a frontmatter added. Anything else that differs between deliverable and unit is substance born at the target: it goes back **up** to the deliverable, never in.
9. **Assemble** according to the system file: hierarchy, manifest, activation channel; the unit's order is the instance's **Reading order** restricted to its selection — a selected piece it does not place **stops**, and so do two units of one destination that each add a persona holding the main thread. Generate what is integrally derivable — a manifest from the inventory, each channel's catalogue from the instance's units and the units' manifests. Copy the files the instance names for the destination. Nothing at the destination may be left without a source here.
10. **Check the limits** the system file states — payload ceilings, character sets. A limit exceeded is a composition finding for REVIEW, not something to squeeze past here. A skill past the re-attach ceiling is reported with its measure, named for the piece's cycle — not cut, not refused: where its head ends is a decision of frequency, and the cycle makes it.
11. **Check the number.** Compare the unit's content to what is in service at the destination. Content changed under an unchanged number: **stop** — the level (patch, minor, major) is the user's judgment, by what the consumer *reads*, not by what moved. Set the number in the one place the system file names.
12. **Validate** with the system's validator, which must pass **without warnings** — a warning is exactly what this step exists to catch.
13. **Embark the movements** the instance records, in the form the system file gives, so the carrier can tell the consumer once.
14. **Write the inventory** and leave the result in the apparatus. The intermediate is the point: it is what makes the transformation auditable before it reaches anyone.

## Guardrails

- **Refuse rather than produce a broken unit.** A unit built from a non-conform deliverable will present itself as valid — the worst outcome, because nothing signals it. This is where PACKAGE differs from QUALIFY: verification informs, packaging commits.
- **No review, no package.** The trace is a revision; anything that moves the corpus invalidates it. That is not friction to work around — it is the whole guarding itself.
- **Packaging transforms; it does not transport.** If the sequence ends at a destination, DEPLOY's territory has been entered.
- **The metadata is derived, never invented.** Written here, it would have no source — not regenerable, and the drift reconstitutes itself without anyone erring.
- **One transformation set, declared, replayable.** The test for anything that differs: *would a rule produce this difference from the source?* If yes, it is a transformation — declare it and replay it. If no, it is substance — raise it.
- **This is not a local act.** Scope, non-collision and triggers all refer to the whole.
- **Target knowledge stays in the system file.** If format vocabulary appears in a grammar, it has climbed one stratum too far.
- **Judgment does not disappear here** — selecting, deriving, checking non-collision, deciding a level all require it. Tooling assists; it cannot replace.

## Source method

Agora
