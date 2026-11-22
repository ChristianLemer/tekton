# Working in this repository

This repository distributes the tekton plugins — methods for collaboration between carbon and silicon, packaged for Claude Code. It is generated: everything here is carried from a source repository by Agora's DEPLOY, and the next alignment rewrites whatever was changed by hand. Nothing is edited here, and nothing is run here.

## What is done here

Commit and push what DEPLOY aligned — the only act this repository asks for, and it is the operator's.

| Act | Regime |
|---|---|
| commit | free |
| push `beta` | free — it is the trial channel |
| push `main` | **announce first, wait for Christian Lemer's go** |

A push to the head that serves all changes what people install. That last look stays with Christian Lemer.

## Commit messages

English, always — they are read by anyone evaluating what is distributed.

```
deploy(<unit>): 📦 <version> — <what became true, as a sentence>
```

The scope is `catalogue` when the catalogue alone moves. State what became true, not what was edited.

## What is not done here

- **A fix.** A unit, a text, the catalogue or the home page is fixed at the source, and comes back through PACKAGE and DEPLOY.
- **An addition.** A tool, a check, a file: whatever is not carried from the source is removed by the next alignment.
