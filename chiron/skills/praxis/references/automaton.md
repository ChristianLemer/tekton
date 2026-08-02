# Automaton Layer Conventions

*Technical detail for Nushell automatons — conventions, patterns, discipline.*

---

## Structure of an automaton directory

```
local/  (or admin/)
├── mod.nu          → entry point, exports the public commands
├── deliver.nu      → one file per automaton
├── validate.nu
└── helpers/        → shared internal functions (optional)
    └── mod.nu
```

Usage from the workspace root: `use local` or `use admin`.

## Nushell conventions

**Naming:** snake_case for commands and variables. Exported command names are the verbs of the action (`deliver`, `publish`, `validate`).

**Parameters:** explicit typing. Use Nushell flags (`--force (-f)`, `--dry-run (-d)`) rather than ambiguous positional parameters.

**Dry-run:** the default for every admin automaton. Dry-run mode shows what would be done without doing it. `--force (-f)` to actually execute.

**Output:** structured (tables, records) rather than free text. This allows pipeline chaining.

## Recurring patterns

**Discover-Validate-Execute:** the automaton discovers paths by Genesis convention (no hardcoding), validates the prerequisites, then executes. Each phase is a separate function.

**Ensure-Clear-Copy:** for deliveries (pattern documented in Kyklos, gesture DELIVER). Make sure the previous state remains recoverable, clear the deliverable, copy the forge content into it. The first beat states a guarantee, not a mechanism — under a VCS it is given by construction.

**Preview-Confirm-Execute:** for admin operations. Show what is about to happen, ask for confirmation, execute. Dry-run is the default mode.

## When Nushell, when Python

| Criterion | Nushell | Python |
|---------|---------|--------|
| Filesystem, pipeline, transformation | ✓ | |
| Simple tabular data | ✓ | |
| Computation, data science, ML | | ✓ |
| Complex data processing (Polars) | | ✓ |
| Interaction script (preview, confirm) | ✓ | |

The boundary is sometimes blurred. When in doubt: if the operation is mostly filesystem work and structured transformation, Nushell.

## Si as co-author

Si can write Nushell. The quality varies. To maintain common ground:

- Follow the conventions above
- Modularise (no monolithic scripts)
- Comment the intention where it is not obvious
- Test destructive operations (admin especially)
- Use the recurring patterns rather than reinventing them

---

*The automaton executes. Discipline guarantees it executes well.*
