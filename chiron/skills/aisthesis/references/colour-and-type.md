# Colour and Type

*Choosing colour, typeface, signs and state signals — once the meaning is decided.*

---

These are means of representation. They come after the question of meaning: what must stand out is already settled; what remains is to choose the means, for the reader's real eye and the medium at hand. See *Meaning and form* in [AISTHESIS](../AISTHESIS.md).

## Colour

**Start from a tested palette.** Do not invent a categorical palette. A published, tested one — Paul Tol's schemes, Okabe-Ito — encodes constraints (colour-vision deficiency, displayable gamut, colour names) that no simple formula recovers. Dividing the hue circle evenly at fixed lightness and chroma is the naive method, and it fails: some hues fall out of gamut and are silently clamped, a mid-lightness yellow turns mustard, and evenly spaced angles can land twice in the same named colour.

| Palette | Distinct colours | Colour-vision safe |
|---|---|---|
| Paul Tol *bright*, *vibrant* | 7 | yes |
| Paul Tol *muted* | 9 | yes |
| Okabe-Ito | 8 (including black) | yes |

**Vary lightness.** It is the channel that survives colour-vision deficiency and greyscale. Two categories that differ by hue alone are fragile.

**One colour, one name.** Two categories whose colours share a name ("two blues") blur together. Colours that fall under different names are told apart and remembered better.

**Check in the rendering.** In both light and dark modes, and at the real size of the marks: a small dot needs a far larger difference than a large patch, and a bar is easier to tell apart than a point.

**Beyond seven to nine categories, double the signal.** Shape, label or position carry the category alongside colour — colour alone no longer holds.

**If you must generate,** maximise perceptual distance to every colour already chosen (Glasbey's method), never spacing by angle — then tune by eye.

## Typeface

**In a shared space, use the system typeface.** A typeface imposed by a theme but missing on one machine renders differently for each reader — the author sees one thing, the reader another. The system typeface (`system-ui`) or one embedded in the medium renders the same everywhere.

**The register chooses the family.** Serif for long prose, read as a flow; sans-serif for what is scanned — headings, tables, navigation. A workspace rich in structure benefits from sans-serif.

**Monospace for the literal.** Code and anything to be taken as-is has its own family, under the same rule: system or embedded.

## Signs and vocabularies

**One sign, one meaning.** An emoji, a prefix, a case designates one thing, everywhere. No synonyms.

**A closed set.** The vocabulary is short and does not grow with each use; adding a sign is a decision, not a convenience.

**The vocabulary belongs to whoever owns the meaning.** The marks for a method's gestures are defined in that method. Aisthesis checks their conditions — closed, constant, in just measure — not their content.

## State signals

**A signal in its place.** A state — of a task, an agent, a system — is signalled where the reader knows to find it: a status bar, a discreet mark beside what it qualifies.

**Never redraw the reader's space.** Changing the theme, recolouring the screen, rearranging panes to signal a state is imposing. The reader set up their space; the signal adds to it, it does not replace it.

## Sources

- Heer & Stone, *Color naming models for color selection, image editing and palette design*, CHI 2012
- Szafir, *Modeling Color Difference for Visualization Design*, IEEE VIS 2017
- Paul Tol, *Colour Schemes*, technical note
- Okabe & Ito, *Color Universal Design*, 2008
- Glasbey et al., *Colour Displays for Categorical Images*, 2007
