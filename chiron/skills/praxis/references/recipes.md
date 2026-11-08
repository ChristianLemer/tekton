# Si's operational recipes

*What Si can do with its tools — techniques at the edge of automation.*

Loaded on demand from `PRAXIS.md`.

---

## What a recipe is

An operator Si animating a workspace has tooled capabilities: open a note through a URI scheme, insert a Mermaid diagram into Markdown, embed inline SVG, move between vaults, open an external URL, list a folder by Genesis conventions. These are neither gestures (no judgment required) nor automatons managed in `local/` or `admin/`. They are **recipes** — small techniques Si uses on its own with its native tools.

Not a fifth form. Recipes are **ambient tooled knowledge**, as editor conventions (callouts, Mermaid, frontmatter) are ambient structural knowledge documented by Genesis.

Without Si the workspace still runs — the recipes simply lose their meaning. Si is itself a poros: these recipes document what that particular found resource makes possible.

## Why capture them

This knowledge is lost between sessions. A workaround discovered today does not exist next session unless someone captured it. Praxis does not prescribe the recipes; it prescribes **where to capture them**: universal recipes here, situated ones (a particular template, a local validation script) in their workspace.

## Territory

The catalogue is not fixed; it grows with practice — any session may find a new recipe.

- **Note editor** — URI schemes (`obsidian://`), Mermaid in notes, inline SVG, callouts, frontmatter.
- **Browser automation** — workarounds for custom URI schemes, page interaction, content extraction.
- **Filesystem** — listing conventions (follow the index, no recursive scan), handling Genesis folders.
- **Embedded formats** — Mermaid, SVG, Markdown tables, code blocks.
- **Interaction patterns** — how Si moves between vaults, how it opens external resources.

## Recipes

### Open a custom URI scheme from a browser automation tool

**Problem.** Navigating the browser to an `obsidian://` URI does not open the note: the browser rewrites custom schemes to `https://`.

**Recipe.** Inject a clickable `<a href="obsidian://…">` into the page with JavaScript, then click it.
