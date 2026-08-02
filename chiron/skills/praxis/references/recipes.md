# Si's Operational Capabilities

*Tooled recipes — what Si can do with its native tools.*

---

This catalogue documents the technical recipes Si uses to operate inside a workspace. They are neither gestures (no *tekhnē* — no judgment required) nor Nushell automatons (no managed scripts). They are techniques at the edge of automation — ambient tooled knowledge.

The catalogue grows with practice. Every session may uncover a new recipe.

---

## Obsidian

**URI schemes.** Open a note: `obsidian://open?vault=VaultName&file=path/to/note`. From Chrome MCP, custom URI schemes are rewritten to `https://` — workaround: inject a clickable `<a href="obsidian://...">` via JavaScript.

**Mermaid.** Diagrams embedded in Markdown notes. Syntax: a code block with language `mermaid`. Rendered natively in Obsidian. Useful for flowcharts, sequence diagrams, dependency maps.

**Inline SVG.** Vector images embedded directly in the Markdown. No external file needed. Useful for simple illustrations, icons, schematics.

**Callouts.** Attention blocks (`> [!note]`, `> [!warning]`, etc.). Genesis convention for attention markers in documents.

**Frontmatter.** YAML metadata at the head of a note. Usable for typing, dating, tags.

## Chrome MCP

**Custom URI schemes.** Chrome rewrites `obsidian://` to `https://`. Workaround: `javascript_tool` to inject a clickable link into the DOM.

**Content extraction.** `get_page_text` to extract a page's text. `read_page` for the accessibility tree.

**Navigating between vaults.** Use Obsidian URI links or navigate via the filesystem MCP.

## Filesystem

**Genesis listing conventions.** Follow the index (README), never scan recursively. When Si lists a directory, it reads the README first, not `ls -R`.

**Handling Genesis directories.** Create a directory following the naming convention (number + emoji + name). Respect the partition (no overlap).

## Embedded formats

**Mermaid** — flowcharts, sequences, Gantt, dependency maps.
**SVG** — illustrations, schematics, icons.
**Markdown tables** — simple tabular data.
**Code blocks** — snippets, examples, directory structures.

---

*Universal recipes live here. Workspace-specific recipes stay situated in that workspace.*
