# Genesis Links

*Resolution rules, root keys, examples.*

---

## Format

`Segment .. Segment .. Target`. Each segment is a human name. Left to right, broadest to most precise. Use the minimum segments needed. The goal is stability: a restructuring does not break the reference.

## Resolution

Genesis links resolve by semantic matching, not exact string matching:

- **Numeric prefixes are ignored** — `Results in Abundance` matches `3. 📈 Results in Abundance`. The number aids perception; it is not part of the folder's identity.
- **Emoji are ignored** — `The Void` matches `🌀 The Void`.
- **Case- and diacritics-insensitive.**
- **Segments can be abbreviated** as long as they remain unambiguous.

When a segment is ambiguous, add a segment to the left, or ask for clarification. Generic names (README, INTENTION) often need more segments.

## Root Keys

Root keys (`<garden>`, `<shared library>`) are navigation entry points. They belong to the user, not to a workspace or a machine. Two levels:

- **the major roots** are declared once, in the user's profile — the same on every device and for any AI;
- **inside a workspace**, the roots it needs are described in its README, with the rest of its topography — a separate file only in the rare case where it becomes a document of its own.

What locates a root is the service that holds the data (Google Drive, OneDrive, iCloud), not a path.

## Examples

| Link | Resolves to |
|------|-------------|
| `ANABASIS` | Obvious if there's only one |
| `Kyklos .. ANABASIS` | ANABASIS.md in Kyklos's deliverable |
| `Tekton .. Logos .. Kyklos .. ANABASIS` | Fully qualified |
| `Kentauros .. Angles` | The Angles folder in Kentauros's workspace |
| `<garden> .. esprit .. aesthesis` | Aisthesis, from the user's garden root |

## Not Between Workspaces

A Genesis link references a published method or deliverable. It does not reach into another workspace's inside: there, ask that workspace's agent (see *Between Workspaces* in the main document).
