# Inventory — {UNIT}

*What this unit carries, in what order, and what it leaves out.*

> **A rendering, not a source.** PACKAGE writes this by applying the composition rule of the instance to the corpus as it stands, minus what the instance pauses. The carrier reads it; nobody maintains it. Regenerate rather than edit.
>
> Rendered at corpus revision `{REV}` · {N} grammars · rule `{RULE}`

---

## The grammars — carried as skills, loaded on demand

The order is the corpus's **reading order**, restricted to what the rule selects: the instance writes it once, REVIEW proposes it and the user confirms it. Neither this unit nor its persona chooses it — the persona declares what it mobilises, not in what order. The agent file lists the grammars under `skills:`, in this order, so that their descriptions are present from the first reply; the bodies load when a description triggers, or when the conduct asks for them in full.

| # | Grammar | Family |
|---|---------|--------|
{ROWS}

**None is injected at session start.** The system measures each hook's output independently and truncates past the ceiling the system file states; no grammar fits under it whole, and splitting a grammar is its author's act, not this unit's. Decided at the review; revalidated when a grammar changes size or the ceiling moves.

## Excluded

What the instance pauses, and nothing else: every other grammar the rule yields is carried in this rendering.

## The persona — the session's agent

Two files, two layers — substance orients, conduct applies. Both derive from one deliverable, the same way a grammar does, cut at the marks the persona declares in its workshop:

| File | Source | Layer | What is dropped |
|---|---|---|---|
| `agents/{PERSONA}.md` | `{SOURCE}` main document | essence | what precedes the first section heading — the layering callout; the opening sentence addresses the agent, derived from the persona's title and subtitle: *You are <title> — <subtitle>* |
| `persona/activation.md` | `{SOURCE}ACTIVATION.md` | conduct | the opening sections, cut at `{MARK}`; the title and subtitle are kept |
| the `description:` | `{SOURCE}ABOUT.md` | presentation | compressed by reading from *When it serves*, its boundary kept, never authored here |

**How the two reach the session.** The manifest names the essence as the session's agent (`settings.agent`): it is the system prompt from the first reply, without a hook. The conduct is the one payload a `SessionStart` hook injects — `hooks-handlers/session-start.js --conduct`, under the ceiling — because it must be true at message zero and the agent file alone does not bring it.

**Not dispatched automatically — a limit, not a guarantee.** The system makes every agent of a unit a dispatchable subagent too, this one included, and no field withholds it. What holds the system back is the description: it keeps the boundary of the presentation — when the persona does not serve. An agent dispatched on request is not prevented.

**Checkable.** The essence body from its first section heading onward equals its source; the conduct body from `{MARK}` onward equals its source; the address equals the rule applied to the title and subtitle.

## Channels — the destination's catalogs, and whom each serves

The carrier reads this table to recognise its twin — this unit enabled from another catalog of the same destination. When it finds one, the copy whose catalog serves all stands down for the one that serves a few, and says so to the user. Written from the instance's channels; the same on every head.

| Catalog | Serves |
|---|---|
{CHANNELS}

## Provenance

Each grammar comes from a single deliverable. The body is the main document, byte for byte after the frontmatter; the presentation is derived from that deliverable's own `ABOUT.md`.

| Grammar | Deliverable | Carried beside `SKILL.md` |
|---------|-------------|--------------------------|
{PROV}

**Name mapping.** Directory and `name:` keys are the deliverable's name in lowercase ASCII (`<DELIVERABLE>` → `<deliverable>`, diacritics dropped).

**What travels besides the body.** Everything else each deliverable carries, beside `SKILL.md`, as-is, each at its place in the deliverable. Never carried: `ABOUT.md`, consumed for the description; a deliverable's `README.md`.

---

*Regenerated, never maintained.*
