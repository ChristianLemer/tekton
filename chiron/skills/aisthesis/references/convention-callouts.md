# Callout Convention

*Which callouts to use, when, and why.*

---

## Principle

A callout is an attention marker — a structured interruption of the flow. The fast reader sees only the callouts. The deep reader integrates them in context. Too many callouts — every sentence screams. No callouts — no signal rises from the flow.

Convention: an average document (500–1500 words) contains **0 to 3 callouts**. Beyond that, signal density kills the signal.

## Types retained for Tekton

Out of 11 Obsidian callout types available, 6 are retained. The others are redundant or too visually close to distinguish.

| Type | Signal | When to use |
|------|--------|-------------|
| `[!tip]` | **Key** — don't miss this | The most important point in the section. What the scan must catch. |
| `[!warning]` | **Caution** — identified risk | A common mistake, a trap, an anti-pattern. What can go wrong. |
| `[!question]` | **Open question** — not yet resolved | A topic identified but not settled. Invites contribution. |
| `[!example]` | **Example** — show rather than tell | A concrete case illustrating the principle. Collapsible (`[!example]-`) if long. |
| `[!quote]` | **Citation** — someone else's words | An external reference, an attributed quote. Not for one's own sentences. |
| `[!note]` | **Note** — additional context | Useful but secondary information. The fast reader can skip. |

## Types not retained

| Type | Reason for exclusion |
|------|-----------------------|
| `[!info]` | Too close to `[!note]`. One type for secondary context suffices. |
| `[!abstract]` / `[!tldr]` | A good title and a good opening sentence make explicit summaries unnecessary. |
| `[!success]` / `[!done]` | Occasional use (step validation). Not frequent enough to justify a dedicated type. Use `[!tip]` if needed. |
| `[!failure]` / `[!missing]` | Too close to `[!warning]`. The danger/gap distinction is subtle to the eye. |
| `[!danger]` / `[!error]` | Reserved for technical systems (logs, CI). In a method document, `[!warning]` suffices. |

## Usage rules

**One callout = one signal, not a paragraph.** Callout content should be short (1–3 sentences). If content exceeds 5 lines, either it is a collapsible `[!example]-`, or it is not a callout — it is a section.

**The callout title carries the message.** `> [!warning] Never write directly in the deliverable` is better than `> [!warning] Caution`. The scan reads only the title.

**No nested callouts.** Obsidian supports them, but readability collapses. A callout inside a callout signals that the document structure is failing.

**Collapsible callouts (`-` / `+`)** are reserved for long content that supports without cluttering — typically examples. A closed collapsible callout says: "there is detail here, but you don't need it to understand."

---

*Six types. Zero to three per document. The title carries the message.*
