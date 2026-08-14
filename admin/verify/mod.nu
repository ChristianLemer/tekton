# verify — check that what is deployed here matches the Forge it came from.
#
# The other direction from `manifest --corpus`: that one asks whether a carried
# body still matches the *deliverable* it derives from (freshness). This one
# asks whether the *package* in this repo still matches the intermediate that
# produced it — whether the deployment is faithful.
#
# Why it exists: DEPLOY compares by hand, and the comparison is the part that
# never signals its own absence. A package can drift from its Forge silently —
# it keeps working, and nothing says it is no longer what was packaged.
#
# What it deliberately does NOT do: decide. Some files legitimately live only
# here (activation code, gitignored assets); others are stale extracts that
# ought to go. Same signature, opposite verdicts — so the tool lists and the
# operator judges. Copying blindly in either direction would erase one or keep
# the other.
#
# Run from the tekton repo root:
#   use admin/verify
#   verify --forge <path>            # all plugins in the marketplace
#   verify chiron --forge <path>     # one plugin
#
# The forge path is architekton's `2. 🧭 Apparatus/1. 🔨 Atelier/4. Forge`.
# Set TEKTON_FORGE to avoid passing it every time.

def info [text: string]: nothing -> nothing { print $"(ansi yellow)($text)(ansi reset)" }
def ok [text: string]: nothing -> nothing { print $"(ansi green)($text)(ansi reset)" }
def bad [text: string]: nothing -> nothing { print $"(ansi red)($text)(ansi reset)" }

# Files that legitimately exist here and nowhere upstream. Anything matching is
# reported as expected rather than as an orphan — but it is still reported: a
# list nobody reads is the failure mode this tool exists to avoid.
const HERE_ONLY = [
    "agents/image"                  # gitignored assets, out of the package
    "hooks-handlers/session-start.js"  # activation code, lives at the target
]

def is-here-only [rel: string]: nothing -> bool {
    $HERE_ONLY | any {|pat| $rel | str starts-with $pat }
}

# The plugin directories the catalogue points at, deduped and sorted.
#
# Not `plugins.name`: since the catalogue carries two channels, an entry name is
# a channel label (`chiron-beta`), not a directory. Several entries share one
# directory at different refs — what is verifiable here is the directory, once.
# Entries whose source has no local path (github, url, archive) are skipped:
# they are not deployed from this repo, so there is nothing here to compare.
def catalogue-dirs []: nothing -> list<string> {
    open .claude-plugin/marketplace.json
    | get plugins
    | get source
    | each {|src|
        if ($src | describe) starts-with record {
            $src | get --optional path | default ''
        } else {
            $src | str replace --regex ^\./ '' | str trim --right --char /
        }
    }
    | where {|dir| $dir != '' }
    | uniq
    | sort
}

# Relative file list under a directory, sorted. Empty list if absent.
# Absolute paths throughout: `path relative-to` needs both sides in the same
# form, and a relative dir yields relative glob results that do not match.
def files-under [dir: path]: nothing -> list<string> {
    if not ($dir | path exists) { return [] }
    let root = ($dir | path expand)
    glob ($root | path join "**" "*")
    | where {|p| ($p | path type) == "file" }
    | each {|p| $p | path relative-to $root }
    | sort
}

# Compare one plugin against its forge counterpart.
def verify-one [plugin: string, forge: path]: nothing -> record {
    let src = ($forge | path join $plugin)
    let dst = $plugin

    if not ($src | path exists) {
        bad $"  ($plugin): no forge at ($src) — this package has no source"
        return {plugin: $plugin, sourced: false, differ: 0, missing: 0, extra: 0}
    }

    let a = (files-under $src)
    let b = (files-under $dst)

    let missing = ($a | where {|f| $f not-in $b })          # forged, not deployed
    let extra = ($b | where {|f| $f not-in $a })            # here, no source
    let common = ($a | where {|f| $f in $b })
    let differ = ($common | where {|f|
        (open --raw ($src | path join $f)) != (open --raw ($dst | path join $f))
    })

    let expected = ($extra | where {|f| is-here-only $f })
    let orphans = ($extra | where {|f| not (is-here-only $f) })

    if ($missing | is-empty) and ($differ | is-empty) and ($orphans | is-empty) {
        ok $"  ($plugin): matches its forge \(($a | length) files\)"
    } else {
        bad $"  ($plugin): diverges from its forge"
    }

    $missing | each {|f| print $"      forged, not deployed: ($f)" }
    $differ | each {|f| print $"      content differs:      ($f)" }
    $orphans | each {|f| print $"      here, no source:      ($f)" }
    $expected | each {|f| print $"      here by design:       ($f)" }

    {plugin: $plugin, sourced: true, differ: ($differ | length), missing: ($missing | length), extra: ($orphans | length)}
}

# Check that deployed packages match the Forge that produced them.
export def main [
    plugin?: string    # one plugin; omit to check every entry in the marketplace
    --forge: path      # architekton's Forge; defaults to $env.TEKTON_FORGE
]: nothing -> nothing {
    let f = ($forge | default ($env.TEKTON_FORGE? | default null))
    if $f == null {
        error make {msg: "no forge path: pass --forge or set TEKTON_FORGE"}
    }
    if not ($f | path exists) {
        error make {msg: $"forge not found: ($f)"}
    }

    let plugins = if $plugin != null {
        [$plugin]
    } else {
        catalogue-dirs
    }

    info $"verify: deployed packages against ($f)"
    let results = ($plugins | each {|p| verify-one $p $f })

    let drifted = ($results | where {|r| (not $r.sourced) or $r.differ > 0 or $r.missing > 0 or $r.extra > 0 })
    if ($drifted | is-empty) {
        ok $"($results | length) package\(s\) match their forge"
    } else {
        bad $"($drifted | length) of ($results | length) package\(s\) diverge — judge each line, do not copy blindly"
    }
}
