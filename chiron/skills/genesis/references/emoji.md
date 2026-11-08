# Emoji Convention

*Visual identity for the zones of a partition.*

---

## One Emoji per Zone

The emoji follows the number, so a zone is recognized before it is read. The reference partition carries its own set:

| # | Emoji | Zone | Unicode |
|---|-------|------|---------|
| 0 | 🧹 | Inbox | U+1F9F9 |
| 1 | 🧠 | What I know | U+1F9E0 |
| 2 | 📢 | Who sees me | U+1F4E2 |
| 3 | 📈 | How I produce | U+1F4C8 |
| 4 | 📂 | The same way twice | U+1F4C2 |
| 5 | 🌿 | What I work with | U+1F33F |
| 6 | 🤝 | Who with | U+1F91D |
| 7 | 💤 | Archived (dormant) | U+1F4A4 |
| 8 | 😈 | Keeping in doubt (in reprieve) | U+1F608 |
| 9 | 🌀 | Discarded (gone) | U+1F300 |

A workspace that adapts its zone names may adapt the emoji of its active zones. The exclusion tail — 💤 😈 🌀 — stays fixed.

## Numbering Rhythm

- **0** — inbox
- **1–6** — active zones
- **7, 8, 9** — excluded zones (dormant → in reprieve → gone)

The rhythm **0…6 | 7 8 9** reproduces the active/excluded separation. Inside a zone, a method's sequence uses numbers alone, without emoji.

---

## Terminal Rendering Constraints

Not all emoji render at consistent width in monospace terminals.

**Known problems:**
- Emoji with variation selectors (U+FE0F suffix) render at inconsistent widths
- Emoji from newer Unicode blocks may display too small
- Some emoji classified as "text presentation" default to narrow width

**The set above is validated** for consistent rendering in common terminals on macOS and Windows.

**When adapting:** test in your terminal before adopting — list the candidates and check column alignment.

---

## Infrastructure Folders

Unnumbered infrastructure folders sort after all numbered folders:

| Folder | Nature |
|--------|--------|
| `local/` | Executable scripts |
| `µ. LOCAL/` | Gesture catalogue (Praxis) |
| `µ. METHODS/` | Local method copies (Praxis) |
| `µ. ADMIN/` | Maintenance logic (Praxis) |

They carry no number and no emoji: they are behind the interface, not the interface itself.
