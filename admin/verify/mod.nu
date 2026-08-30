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
#   verify channel                   # channel/version coherence, no forge needed
#   verify skills                    # skill descriptions fit Copilot, no forge needed
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
# Not `plugins.name`: an entry name is a catalogue label, a source is a
# location, and nothing forces the two to agree — they did not when one
# catalogue served both channels and `chiron-beta` pointed at `chiron`. They
# agree again now that each channel has its own catalogue, but reading the
# source is what keeps this correct under either shape. Deduped, because more
# than one entry may legitimately land on one directory. Entries whose source
# names no local path (github, url, archive) are skipped: they are not deployed
# from this repo, so there is nothing here to compare.
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

# The channel this catalogue serves, read from its own name: `tekton` is stable,
# `tekton-beta` is beta. Nothing else in the repo declares it — and this is not
# an arbitrary convention: both Claude Code and Copilot CLI derive the local
# marketplace name from this field, so it is the name the operator actually
# types (`chiron@tekton-beta`). Which makes it the one field that cannot lie
# about which branch a checkout is on.
def catalogue-channel []: nothing -> string {
    let name = (open .claude-plugin/marketplace.json | get name)
    if ($name | str ends-with '-beta') { 'beta' } else { 'stable' }
}

# What each deployed package declares as its version, and whether that version
# carries a prerelease suffix (`0.0.8-beta`). Semver puts the suffix after the
# first `-` and these versions carry no build metadata, so a single `-` is the
# whole test.
#
# Deliberately blind to what the suffix says: `-beta`, `-rc`, anything. The
# suffix is a fixed token here rather than a counter — a package needs one
# counter and the patch number already is it — but this check has no business
# policing which token, only that stable ships none.
def declared-versions []: nothing -> table {
    catalogue-dirs | each {|dir|
        let manifest = ($dir | path join '.claude-plugin' 'plugin.json')
        let version = if ($manifest | path exists) {
            open $manifest | get --optional version
        } else {
            null
        }
        {
            plugin: $dir
            version: $version
            prerelease: (($version | default '') | str contains '-')
        }
    }
}

# Copilot CLI refuses a skill whose frontmatter `description` runs past 1024
# characters — "Skill description must be at most 1024 characters" — and the
# refusal is per-skill and quiet: the session banner counts the casualties, the
# rest of the package loads normally, and the operator sees a working plugin with
# a hole in it. Claude Code has no such limit, so a description can pass every
# check on that side and still drop one grammar in the other client.
#
# MEASURED, not assumed: chiron's `dialektike` shipped at 1081 characters and its
# skill silently failed to load in Copilot. Nobody noticed, because Chiron itself
# still held the grammar — the SessionStart payload carries all five in full. Only
# the standalone `/chiron:dialektike` was gone.
const SKILL_DESCRIPTION_MAX = 1024

# Every skill this repo deploys, with the character count of its description.
# Parsed through `from yaml` rather than a regex: a description may be quoted,
# folded, or span lines, and a regex that handles only today's shape would go
# quiet exactly when the shape changes.
def skill-descriptions []: nothing -> table {
    catalogue-dirs
    | each {|dir|
        glob ($dir | path join 'skills' '*' 'SKILL.md')
        | each {|f|
            let fm = (open --raw $f | split row --regex '(?m)^---\s*$' | get --optional 1 | default '')
            let meta = (try { $fm | from yaml } catch { {} })
            let desc = ($meta | get --optional description | default '' | into string)
            {
                plugin: $dir
                skill: ($f | path dirname | path basename)
                chars: ($desc | str length)
            }
        }
    }
    | flatten
}

# Report over-long skill descriptions and return how many there are.
def check-skills []: nothing -> int {
    let rows = skill-descriptions
    if ($rows | is-empty) {
        info "verify skills: no skills deployed here"
        return 0
    }
    info $"verify skills: ($rows | length) description\(s\), Copilot's ceiling is ($SKILL_DESCRIPTION_MAX)"
    let over = ($rows | where {|r| $r.chars > $SKILL_DESCRIPTION_MAX })
    $rows
    | sort-by chars --reverse
    | each {|r|
        let label = $"  ($r.plugin)/($r.skill): ($r.chars)"
        if $r.chars > $SKILL_DESCRIPTION_MAX {
            bad $"($label) — ($r.chars - $SKILL_DESCRIPTION_MAX) over; Copilot will refuse this skill"
        } else {
            ok $"($label)"
        }
    }
    ($over | length)
}

# Check that no skill description exceeds what Copilot CLI accepts.
#
# Like `verify channel` and unlike the forge comparison, this one decides: a
# description over the ceiling is never legitimate, so it exits non-zero.
#
# Needs no forge. Run from the tekton repo root:
#   use admin/verify
#   verify skills
export def skills []: nothing -> nothing {
    let over = check-skills
    if $over == 0 {
        ok "every skill description fits"
    } else {
        error make {msg: $"($over) skill description\(s\) exceed ($SKILL_DESCRIPTION_MAX) characters"}
    }
}

# Report channel/version coherence and return the count of incoherences.
# Printing here, deciding at the call sites: `verify channel` errors on a
# non-zero return, `verify` only folds it into its verdict.
def check-channel []: nothing -> int {
    let channel = catalogue-channel
    let rows = declared-versions
    info $"verify channel: catalogue serves ($channel)"

    let unversioned = ($rows | where {|r| $r.version == null })
    let marked = ($rows | where {|r| $r.prerelease })
    let plain = ($rows | where {|r| $r.version != null and (not $r.prerelease) })

    $unversioned | each {|r| bad $"  ($r.plugin): no version in .claude-plugin/plugin.json" }

    if $channel == 'stable' {
        $marked | each {|r| bad $"  ($r.plugin): ($r.version) — prerelease on the stable channel; drop the suffix" }
        $plain | each {|r| ok $"  ($r.plugin): ($r.version)" }
    } else {
        $marked | each {|r| ok $"  ($r.plugin): ($r.version) — ahead of stable" }
        $plain | each {|r| info $"  ($r.plugin): ($r.version) — no suffix, so identical to stable; bump it if this one is ahead" }
    }

    let wrong = if $channel == 'stable' { ($marked | length) } else { 0 }
    ($wrong + ($unversioned | length))
}

# Check that the channel this catalogue serves agrees with the versions it ships.
#
# Why it exists: the channel is legible to an operator in three places — the
# marketplace name, the entry display name, and the version string. Only the
# third reaches inside a running session, because Chiron's activation card
# prints the version. The three live in different files, and promoting beta to
# stable has to change all of them. Restoring the catalogue conflicts loudly if
# skipped; dropping the prerelease suffix is silent. Forget it and stable ships
# a package that announces itself as beta, to every client, for as long as
# nobody looks.
#
# Unlike the forge comparison, this one *decides*: a prerelease version on the
# stable channel is never legitimate, so there is no judgement to leave to the
# operator and it exits non-zero.
#
# What it deliberately does NOT check: whether a beta package that is genuinely
# ahead of stable actually carries a suffix. That needs the other branch, and
# this reads only the working copy — the unsuffixed lines are reported so the
# operator can judge. See "Two channels" in README.md.
#
# Needs no forge. Run from the tekton repo root:
#   use admin/verify
#   verify channel
export def channel []: nothing -> nothing {
    let wrong = check-channel
    if $wrong == 0 {
        ok "channel coherent"
    } else {
        error make {msg: $"($wrong) package\(s\) disagree with the channel this catalogue serves"}
    }
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

    # Free — reads only the working copy and needs no forge — so it has no
    # reason ever to be skipped. Folded into the verdict rather than raised:
    # `verify` reports, `verify channel` is the one that gates.
    let incoherent = check-channel
    print ''
    let oversized = check-skills
    print ''

    info $"verify: deployed packages against ($f)"
    let results = ($plugins | each {|p| verify-one $p $f })

    let drifted = ($results | where {|r| (not $r.sourced) or $r.differ > 0 or $r.missing > 0 or $r.extra > 0 })
    if ($drifted | is-empty) {
        ok $"($results | length) package\(s\) match their forge"
    } else {
        bad $"($drifted | length) of ($results | length) package\(s\) diverge — judge each line, do not copy blindly"
    }
    if $incoherent > 0 {
        bad $"and ($incoherent) disagree with the channel — run `verify channel`"
    }
    if $oversized > 0 {
        bad $"and ($oversized) skill description\(s\) are too long for Copilot — run `verify skills`"
    }
}
