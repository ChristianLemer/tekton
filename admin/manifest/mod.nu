# manifest — generate a plugin's plugin.json from the INVENTORY.md it carries.
#
# The carrier must not know what it carries. Before this, the composition was
# hard-coded in three places: `const GRAMMARS` in the hook handler, the hook
# entries in plugin.json written one by one, and the grammars named in the
# persona. The trap was that "The four grammars…" was generated from
# GRAMMARS.length — so the count was always right and nothing could ever
# signal a missing grammar. A four-grammar package announced itself as a
# complete package of four; that is how Dialektikē stayed out of the payload
# for three weeks without a single warning.
#
# The inventory is the single entry: it carries the load order (deliberate —
# framing, not reading), the provenance, and the reason for an absence. None of
# that survives directory discovery, which is why we read a file rather than
# globbing skills/.
#
# Run from the tekton repo root:
#   use admin/manifest
#   manifest chiron              # dry-run: show the manifest that would be written
#   manifest chiron --apply      # write plugin.json
#
# One SessionStart entry per payload, never merged. The harness measures each
# hook's stdout independently and persists anything over ~60 KB to a file,
# splicing in only a ~2 KB preview — which silently truncated the persona and
# lost the welcome card and the 🐴 rule. Keep one grammar per entry; if a single
# grammar ever approaches the ceiling, split that grammar instead.

const HOOK_TIMEOUT = 5
const CEILING = 60_000  # bytes — harness truncation threshold, see header

def info [text: string]: nothing -> nothing { print $"(ansi yellow)($text)(ansi reset)" }

# Parse the load-order table of an INVENTORY.md into an ordered list of names.
#
# The table is the contract: `| 1 | `kentauros` | 🤝 Synergeia | why |`. The
# order comes from the file rather than from sorting names, because the order is
# a decision (Kentauros first — the collaboration protocol frames the rest).
def read-inventory [inventory: path]: nothing -> list<string> {
    if not ($inventory | path exists) {
        error make {
            msg: "no INVENTORY.md — the carrier has nothing to read"
            label: {text: $"expected at ($inventory)", span: (metadata $inventory).span}
        }
    }

    # --raw: `open` would otherwise parse .md into a structured table.
    let rows = (try { open --raw $inventory } catch {
        error make {
            msg: "could not read the inventory"
            label: {text: $"unreadable: ($inventory)", span: (metadata $inventory).span}
        }
    }
        | lines
        | parse --regex '^\|\s*(?<rank>\d+)\s*\|\s*`(?<name>[a-z0-9-]+)`\s*\|')

    if ($rows | is-empty) {
        error make {
            msg: "no load-order rows found — expected rows like: | 1 | `kentauros` | …"
            label: {text: $"in ($inventory)", span: (metadata $inventory).span}
        }
    }

    # Ranks must be 1..n with no gap: a hole means a row was hand-edited out, and
    # the inventory is meant to be regenerated rather than maintained.
    let ranks = ($rows | get rank | into int)
    if $ranks != (1..($ranks | length) | each {|n| $n }) {
        error make {
            msg: $"load-order ranks are not contiguous: ($ranks | str join ', ')"
            label: {text: $"in ($inventory)", span: (metadata $inventory).span}
        }
    }

    $rows | get name
}

# Compare one carried body against its deliverable. Returns null when they match
# or when either side is missing; a record describing the drift otherwise.
def compare-body [corpus: path, row: record]: nothing -> record {
    # The main document carries the deliverable's own name: GENESIS/GENESIS.md
    let dir = ($corpus | path join ($row.deliverable | str trim --right --char /))
    let doc = ($dir | path join $"($dir | path basename).md")
    if not (($doc | path exists) and ($row.skill | path exists)) { return {} }

    # Bodies only: the target's frontmatter is its own, derived from the
    # deliverable's ABOUT.md, and never matches the document.
    let carried = (try { open --raw $row.skill } | parse --regex '(?s)^---\n.*?\n---\n(?<body>.*)$'
        | get --optional 0.body | default "" | str trim)
    let source = (try { open --raw $doc } | default "" | str trim)
    if $carried == $source { return {} }
    {
        name: $row.name
        carried: ($carried | str length)
        source: ($source | str length)
    }
}

# Check that the persona files sit where the inventory says they do.
#
# Not a content check: the persona is obtained by a declared transformation (the
# person of address shifts), so a byte comparison would always report drift. What
# is mechanically checkable is the *layout* the inventory declares — and that is
# precisely what drifted once, the inventory still naming `agents/activation.md`
# after the file moved to `persona/` to stop the harness validating it as an agent.
#
# An inventory that misdescribes the package is worse than no inventory: the
# carrier reads it, and so does whoever reforges.
def check-persona [inventory: path]: nothing -> nothing {
    # Persona table:  | `agents/chiron.md` | `Chiron/…/CHIRON.md` | essence |
    let declared = (try { open --raw $inventory } | lines
        | parse --regex '^\|\s*`(?<file>[a-z]+/[a-z0-9-]+\.md)`\s*\|\s*`(?<source>[^`]+)`\s*\|')

    if ($declared | is-empty) {
        info "  persona: no persona table in the inventory — skipped"
        return
    }

    let root = ($inventory | path dirname)
    let absent = ($declared | where {|row| not ($root | path join $row.file | path exists) } | get file)
    if ($absent | is-not-empty) {
        error make {
            msg: $"the inventory declares files the package does not have: ($absent | str join ', ') — fix whichever is wrong, the layout or its declaration"
            label: {text: $"under ($root)", span: (metadata $inventory).span}
        }
    }
    info $"  persona: ($declared | length) declared file\(s\) present where the inventory says"
}

# Compare each carried body against the corpus deliverable it came from.
#
# A package can be regenerable and stale at the same time: regenerable says
# nothing was born at the target, it does not say everything that matured
# upstream has followed. Only the first was ever tooled — which is how three of
# five skills came to carry a version predating their source, `praxis` announcing
# "Four Positions" against five and omitting the poros entirely.
#
# The corpus root is not knowable from inside the package, so this check is
# opt-in: pass --corpus <path>. Without it, the check is skipped and said to be.
def check-freshness [corpus: path, inventory: path]: nothing -> nothing {
    # Provenance table:  | `genesis` | `b. 📐 Topos/Genesis/6. 📦 Livrable/GENESIS/` |
    let provenance = (try { open --raw $inventory } | lines
        | parse --regex '^\|\s*`(?<name>[a-z0-9-]+)`\s*\|\s*`(?<deliverable>[^`]+)`\s*\|')

    if ($provenance | is-empty) {
        info "  freshness: no provenance table in the inventory — skipped"
        return
    }

    let stale = ($provenance
        | insert skill {|row| $inventory | path dirname | path join skills $row.name SKILL.md }
        | each {|row| compare-body $corpus $row }
        | where {|r| $r != {} })

    if ($stale | is-empty) {
        info $"  freshness: all ($provenance | length) bodies match their deliverable"
        return
    }

    for s in $stale {
        info $"  STALE: ($s.name) carries ($s.carried) chars, source has ($s.source)"
    }
    let names = ($stale | get name | str join ', ')
    error make {
        msg: $"($stale | length) skill\(s\) predate their source: ($names) — refresh the bodies before packaging"
        label: {text: $"against corpus ($corpus)", span: (metadata $corpus).span}
    }
    null
}

# One SessionStart entry. `mode` is the handler flag, `label` the status line.
def hook-entry [mode: string, label: string]: nothing -> record {
    {
        hooks: [
            {
                type: command
                command: $'node "${CLAUDE_PLUGIN_ROOT}/hooks-handlers/session-start.js" ($mode)'
                timeout: $HOOK_TIMEOUT
                statusMessage: $"Loading ($label)..."
            }
        ]
    }
}

# Refuse any inventory the package cannot honour, and warn on payload size.
# This is the check the hard-coded manifest could never perform, because nothing
# ever measured anything.
def check-payloads [plugin_dir: path, ...grammars: string]: nothing -> nothing {
    let payloads = ($grammars | each {|g|
        let file = ($plugin_dir | path join skills $g SKILL.md)
        let present = ($file | path exists)
        {
            name: $g
            present: $present
            bytes: (if $present { (try { ls $file } | get --optional 0.size | default 0 | into int) } else { 0 })
        }
    })

    let missing = ($payloads | where not present | get name)
    if ($missing | is-not-empty) {
        error make {
            msg: $"in the inventory but absent from skills/: ($missing | str join ', ') — the package would promise what it cannot deliver"
            label: {text: $"under ($plugin_dir)", span: (metadata $plugin_dir).span}
        }
    }

    let oversized = ($payloads | where bytes > $CEILING)
    if ($oversized | is-not-empty) {
        error make {
            msg: $"over the ~($CEILING)-byte ceiling: ($oversized | get name | str join ', ') — split that grammar, never merge entries"
            label: {text: $"under ($plugin_dir)", span: (metadata $plugin_dir).span}
        }
    }

    let largest = ($payloads | sort-by bytes --reverse | get --optional 0)
    info $"  largest payload: ($largest.name) at ($largest.bytes) bytes \(ceiling ~($CEILING)\)"
}

# The persona leads: it carries the essence and the activation, and must be true
# at message zero. Then one entry per grammar, in inventory order.
def build-entries [plugin: string, ...grammars: string]: nothing -> list<record> {
    [(hook-entry '--persona' $plugin)]
    | append ($grammars | each {|g| hook-entry $'--grammar ($g)' $g })
}

# Splice the generated hooks into the existing manifest, preserving identity
# fields. This gesture owns `hooks` and nothing else.
# nu-lint-ignore: list_param_to_variadic
def render [manifest_path: path, entries: list<record>]: nothing -> string {
    let existing = (try { open $manifest_path } catch {
        error make {
            msg: "could not read the existing manifest"
            label: {text: $"unreadable: ($manifest_path)", span: (metadata $manifest_path).span}
        }
    })
    $existing | upsert hooks {SessionStart: $entries} | to json --indent 2
}

# Generate plugin.json for a plugin from its INVENTORY.md. Dry-run unless --apply.
#
# Identity fields (name, version, description, author) are preserved from the
# existing manifest — this gesture owns the `hooks` section and nothing else. A
# version lives in exactly one place; see admin/publish for why declaring it in
# two ships the wrong one silently.
export def main [
    plugin: path       # plugin directory name, e.g. chiron
    --apply (-a)       # write the file instead of printing it
    --corpus: path     # architekton's corpus root — enables the freshness check
]: nothing -> nothing {
    let plugin_dir = (pwd | path join $plugin)
    if not ($plugin_dir | path exists) {
        error make {
            msg: "no such plugin directory"
            label: {text: ($plugin_dir | into string), span: (metadata $plugin).span}
        }
    }

    let manifest_path = ($plugin_dir | path join .claude-plugin plugin.json)
    if not ($manifest_path | path exists) {
        error make {
            msg: "no plugin.json — this gesture regenerates hooks, it does not create a plugin"
            label: {text: $"expected at ($manifest_path)", span: (metadata $plugin).span}
        }
    }

    let inventory = ($plugin_dir | path join INVENTORY.md)
    let grammars = (read-inventory $inventory)
    let mode = if $apply { 'write' } else { 'dry-run' }
    info $"manifest: ($plugin) <- INVENTORY.md \(($mode)\)"
    info $"  ($grammars | length) grammars, in inventory order: ($grammars | str join ', ')"
    check-payloads $plugin_dir ...$grammars
    check-persona $inventory

    if $corpus == null {
        info "  freshness: not checked — pass --corpus <architekton>/1. 📚 Corpus to compare against sources"
    } else {
        check-freshness $corpus $inventory
    }

    let entries = (build-entries $plugin ...$grammars)
    let rendered = (render $manifest_path $entries)

    if not $apply {
        print $rendered
        info $"Dry-run complete. ($entries | length) SessionStart entries. Re-run with --apply to write."
        return
    }

    try { $rendered | save --force $manifest_path } catch {
        error make {
            msg: "could not write the manifest"
            label: {text: $"not writable: ($manifest_path)", span: (metadata $plugin).span}
        }
    }
    print $"(ansi green)Wrote ($manifest_path) — ($entries | length) SessionStart entries.(ansi reset)"
}
