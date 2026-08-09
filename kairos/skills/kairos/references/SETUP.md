# SETUP

*The state the system must have to function.*

> [!info] Consult this document at deployment and after each update.
> Verify that each element is in place. What is missing must be created.

---

## Partitions

> [!tip] A mathematical partition: exhaustive and non-overlapping.
> Each partition has a name, an emoji and a colour. If something exists within the scope, it has a place.

The file PARTITIONS.md must contain:

```
| # | Emoji | Partition | Colour |
|---|-------|-----------|--------|
| 1 | ...   | ...       | ...    |
```

Checks:
- No gaps — everything that demands attention is covered
- No overlap — each task belongs to exactly one partition
- Each partition has a corresponding folder for its backlog

## Calibration

> [!tip] The why behind the numbers.
> Calibration precedes balance — not the other way around.

The file CALIBRATION.md must contain:
- The theoretical balance (baseline distribution, context-free)
- Active situation fragments (dated, with named impact)
- The X-Ray (theoretical vs effective visualisation)

## Balance

> [!tip] The effective values — sole reference for allocation.
> Derived from calibration. Never modify without calibrating first.

The file BALANCE.md must contain:
- Effective values per partition
- Active allocation directives (summary of fragments that guide task selection)

## Inflections

> [!tip] What bends the allocation beyond the balance.
> Read by the guardian alongside BALANCE.md when allocating.

The file INFLECTIONS.md must contain:
- Regular inflections (personal allocation rules, stable — set at setup)
- One-time inflections (dated: desires, preferences, constraints of the moment)

Regular inflections persist. One-time inflections come and go.

## Task reservoir

> [!tip] Where tasks live. Declared once at setup. Transparent in operation.
> The guardian acts in the reservoir without friction — no probing, no fallback.

The reservoir is the external system where tasks are created, read, and completed. One provider for the entire scope.

Configuration:
- **Provider** — the system (Linear, GitLab, GitHub, or local files)
- **Channel** — how the guardian reaches it (CLI, MCP, API, or filesystem)
- **Mapping** — how partitions correspond to the provider's structure (projects, labels, folders)

```
provider: linear
channel: cli
mapping:
  🏢 Work: "project:Work"
  🌱 Personal: "project:Personal"
  💪 Health: "project:Health"
```

If no external provider is configured, local markdown files are the reservoir. This is the baseline — always functional.

The guardian may also read contextual information from the provider (deadlines, collaborator activity) to inform its gestures.

## Backlog

> [!tip] One folder per partition, tasks inside.

Each partition has a folder. Each task is an `.md` file with the nature emoji in the name. The TASK.md template describes the internal structure.

## Journal

> [!tip] Append-only. Must exist, even if empty.

The file JOURNAL.md must exist. It is filled by the Complete gesture.

## Allocation

> [!tip] Ephemeral. May not exist — it will be regenerated.

The file ALLOCATION.md is a rendering. Its presence is not required at setup.

## Lexicon

> [!tip] Permanent companion — consult when operating in another language.

The file lexicon.md provides multilingual correspondence for Kairos terms. The guardian consults it when instantiating a workspace in the user's language.
