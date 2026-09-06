# Working in this repository

Tekton is a corpus of methods published as plugins. What ships from here is
installed by strangers, so the repository is not only source — it is the
showcase. Its own history is part of the demonstration.

These are the standing rules. Doctrine is not repeated here: where it already
has a home, this file points at it.

## Version control is delegated

Chris does not operate Git. The technical side — branches, commits, tags,
channels — belongs to the agent. What enters the corpus, and when a version
deserves promotion, remains his.

| Action | Regime |
|---|---|
| commit | free |
| push `beta` | free — it is the trial channel |
| push `main` | **announce first, wait for the go** |

`main` is the stable channel: a push there changes what people install. That
last look stays with Chris.

Because he does not read `git log`, the agent's report is his only window onto
the repository. Say what happened, not that it worked.

## Git, not jj — and the condition to revisit

The repository is plain Git. jj was weighed and set aside on 2026-09-06.

jj is the safer of the two for an agent — no index, the working copy is always
a commit, `jj undo` covers every operation. But its failure mode is *silent*:
bookmarks do not advance on their own, so a push can succeed and deliver
nothing. Git fails loudly. With no human reviewing, a loud failure beats a
quiet one — `origin` repairs what breaks, but nothing reveals what never
shipped.

**Revisit this the day more than one agent works this repository at once.**
Then isolation becomes the dominant problem, `origin` stops protecting
anything, and jj's workspaces win the argument.

## Commit messages

English, always. They are derived into release notes and read by anyone
evaluating the corpus.

```
<type>(<scope>): <emoji> <what changed, as a sentence>
```

- **type** — `feat`, `fix`, `docs`, `deploy`
- **scope** — `catalogue`, a plugin (`chiron`, `kairos`, `kyklos`), or the tooling touched (`admin`, `ci`)
- **deploy** carries the version: `deploy(chiron): 📦 0.0.9 — …`

Write the subject in the voice of the corpus: state what became true, not what
was edited. *"the front door shows the card instead of describing it"*, not
*"update README"*.

## The channels

Doctrine lives in [README.md](README.md) § *Two channels* — stable from `main`
as `tekton`, beta from `beta` as `tekton-beta`. Read it before touching either.

A channel only moves when a plugin's `version` changes: clients resolve by
version, not by commit, so a push without a bump delivers nothing.

## Gestures

Nushell modules under `admin/`. Run from the repository root.

```nu
use admin/verify
verify channel              # channel/version coherence — no forge needed
verify --forge <path>       # deployed packages against their forge

use admin/promote
promote --dry-run           # what promotion would do
promote                     # merge beta, de-beta, verify, commit — stops before pushing
```

`verify channel` also runs in CI on every push. It is the guard that does not
depend on anyone remembering.
