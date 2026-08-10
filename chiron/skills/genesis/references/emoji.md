# Emoji Convention

*Visual identity for project-level zones.*

---

## Standard Set — project level

Numbers a project's **stages**: work in, product out, then the excluded zones.

| # | Emoji | Zone | Nature | Unicode |
|---|-------|------|--------|---------|
| 1 | 🔨 | Workshop / Atelier | Where work happens | U+1F528 |
| 6 | 📦 | Deliverable / Livrable | Finished product | U+1F4E6 |
| 7 | 💤 | Attic / Grenier | Archives (dormant) | U+1F4A4 |
| 8 | 😈 | Purgatory / Purgatoire | Superseded (in reprieve) | U+1F608 |
| 9 | 🌀 | The Void / Le Vide | Discarded (gone) | U+1F300 |

## Reference Set — vault level

Numbers a vault's **domains**, not stages. Zone names are the vault's own — only the shape and the exclusion tail transfer. See *Complete Partition* in the main document.

| # | Emoji | Nature | Unicode |
|---|-------|--------|---------|
| 0 | 🧹 | Inbox — landing zone for the unsorted | U+1F9F9 |
| 1 | 🧠 | Theory, principles, shared semantics | U+1F9E0 |
| 2 | 📢 | Outward-facing material | U+1F4E2 |
| 3 | 📈 | Domain guidance leading to concrete outputs | U+1F4C8 |
| 4 | 📂 | Runbooks, procedures, setup — the same way twice | U+1F4C2 |
| 5 | 🌿 | Tooling, environment configuration | U+1F33F |
| 6 | 🤝 | People, profiles, roles | U+1F91D |
| 7 | 💤 | Archives (dormant) | U+1F4A4 |
| 8 | 😈 | Superseded (in reprieve) | U+1F608 |
| 9 | 🌀 | Discarded (gone) | U+1F300 |

The two sets share 7/8/9 — the exclusion gradient is scale-independent. Everything below it is scale-specific: **6 📦 is a deliverable at project level, a team at vault level.** Read the scale before reading the number.

---

## Numbering Rhythm

- **1** — workshop (active work)
- **2–5** — available for intermediate spaces when a project needs them
- **6** — deliverable (finished product)
- **7, 8, 9** — excluded zones (retention gradient: dormant → in reprieve → gone)

The gap between 1 and 6 is intentional. The rhythm **1...6 | 7 8 9** reproduces the active/excluded separation found in parent vaults.

---

## Terminal Rendering Constraints

Not all emoji render at consistent width in monospace terminal contexts (Nushell, VS Code terminal, iTerm).

**Known problems:**
- Emoji with variation selectors (U+FE0F suffix) render at inconsistent widths
- Emoji from newer Unicode blocks may display too small
- Some emoji classified as "text presentation" default to narrow width

**The standard set above is validated** for consistent rendering on macOS (Terminal, iTerm, Nushell) and Windows Terminal.

**When extending:** always test in your terminal before adopting. Run the candidates as a list and verify column alignment.

---

## Infrastructure Folders

Unnumbered infrastructure folders sort after all numbered folders in the filesystem:

| Folder | Nature |
|--------|--------|
| `local/` | Executable scripts |
| `µ. LOCAL/` | Gesture catalogue (Praxis) |
| `µ. METHODS/` | Method references (Praxis) |
| `µ. ADMIN/` | Maintenance logic (Praxis) |

These are not numbered and carry no emoji. They are behind the interface, not the interface itself.
