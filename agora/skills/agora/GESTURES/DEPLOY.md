# DEPLOY

Carry the apparatus to the channel the review chose.

## Intention

Put into service what PACKAGE assembled and left inspectable — nothing more. Transport is mechanical and reversible; what it carries, and where to, was decided and checked before it. The operator decides when; the automaton executes.

## When

- A unit in the apparatus differs from what a channel serves
- The review sent a version to all that a few already have — the same unit, to the other channel
- First delivery of a unit, or of a destination
- A destination was lost and must be rebuilt from the apparatus

## Input

- The apparatus — the units with their inventories, and everything else the destination holds
- The channel the review chose for each version that leaves
- The system file — how the destination and each channel are reached, what transport does and does not do, what precedes putting into service
- The destination, reached as the system file says: a variable with a default, never a machine path

## Output

The channel's destination aligned with the apparatus. A report of what was added, replaced, removed — and of what remains for the operator to commit and push.

## Sequence

1. **Check the destination.** Is it the channel the review chose, as the system file says a channel is reached? Is it clean — nothing modified, nothing pending? A destination with work in progress is not aligned over: stop, and say what is there.
2. **Compare**, four things in this order: in the apparatus and absent from the destination; at the destination and absent from the apparatus; present on both sides and different; and the number. Report — this is the dry run, and it is the default.
3. **Refuse a stale number.** If contents differ and the number in the apparatus equals a number already served — in this channel or in any other — stop: PACKAGE must set the level first. A served number is consumed.
4. **Align** — only with the explicit flag. Complete copy, with deletion of what the apparatus no longer carries — of what version control tracks; what it ignores is never touched. Never a pointer or a link.
5. **Report** what changed, and what remains to commit and push, so that the operator knows what was published because they decided it.

## Guardrails

- **Idempotent** — running twice produces the same result.
- **Dry-run by default** — report before acting; an explicit flag applies.
- **Nothing is written at the destination that the apparatus does not carry.** What is written at the target has no source and cannot be regenerated; it is the defect verification never sees. What sits there without a source is shown, then removed by the alignment — a destination distributes, it is not worked in.
- **To all is the same unit, byte for byte.** Going to all is a transport to another channel, never a repackaging; the number does not change.
- **Transport does not package.** A metadata missing, a file to rename: back to PACKAGE. DEPLOY found it late; fixing it here would make the destination the source.
- **What version control ignores at the destination is never touched.** The clean check cannot see it; a deletion it cannot see erases without trace. An ignore file stays while it still hides something: removing it would expose what it hid.
- **Transport does not publish.** Committing and pushing at the destination stay the operator's act — push is conscious.
- **To all waits for the author.** Pushing to the head that serves all is announced first, and waits for the author's word; the trial head is free.
- **The destination is not archived.** Agora's obligation stops at *being able to redeliver*: the unit regenerates from the corpus. What happens at the destination afterwards is the consumer's.
- **Always complete copy.** The consumer receives a finished product.

## Source method

Agora
