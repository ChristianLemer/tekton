# promote — carry the beta channel onto stable.
#
# Why it exists: promotion is three steps and only two of them announce
# themselves. Carrying the content over is a merge, and a merge is loud when it
# goes wrong. Restoring main's catalogue is silent — the channel name and the
# display names diverge on purpose and must never merge, but nothing complains
# if they do. Dropping the prerelease suffix is silent too. Written as prose in
# README.md, those two got skipped; written here, they cannot be.
#
# What it deliberately does NOT do: push, and decide. It stops with everything
# staged and committed locally, and prints what a push would publish — because
# `main` is what strangers install, and that last look belongs to the operator
# (see AGENTS.md). It also has no opinion on whether the beta is ready: that
# judgement is not automatable and is not attempted here.
#
# Run from the tekton repo root:
#   use admin/promote
#   promote --dry-run     # what promotion would carry, and which versions move
#   promote               # merge, restore the catalogue, de-beta, verify, commit

def info [text: string]: nothing -> nothing { print $"(ansi yellow)($text)(ansi reset)" }
def ok [text: string]: nothing -> nothing { print $"(ansi green)($text)(ansi reset)" }
def bad [text: string]: nothing -> nothing { print $"(ansi red)($text)(ansi reset)" }

def git-out [args: list<string>]: nothing -> string {
    let r = (^git ...$args | complete)
    if $r.exit_code != 0 {
        error make {msg: $"git ($args | str join ' ') failed: ($r.stderr | str trim)"}
    }
    $r.stdout | str trim
}

# The plugin directories the catalogue points at. Same reading as `verify`:
# the source path, not the entry name — a label and a location need not agree.
def catalogue-dirs []: nothing -> list<string> {
    open .claude-plugin/marketplace.json
    | get plugins
    | get source
    | each {|src| if ($src | describe) starts-with record { $src | get --optional path | default '' } else { $src }}
    | each {|p| $p | str replace --regex '^\./' '' }
    | where {|p| ($p != '') and ($p | path exists) }
    | uniq
    | sort
}

def version-of [dir: string]: nothing -> string {
    open --raw ([$dir '.claude-plugin' 'plugin.json'] | path join)
    | parse --regex '"version"\s*:\s*"(?<v>[^"]+)"'
    | get v.0
}

# Drop the prerelease suffix, rewriting only the version field and leaving the
# rest of the file byte-identical — a reformat here would show up as noise in
# the very diff an operator is being asked to approve.
def strip-prerelease [dir: string]: nothing -> record {
    let file = ([$dir '.claude-plugin' 'plugin.json'] | path join)
    let raw = (open --raw $file)
    let current = (version-of $dir)
    let stripped = ($current | split row '-' | first)
    if $current == $stripped {
        return {plugin: $dir, from: $current, to: $current, moved: false}
    }
    let field = ($raw | parse --regex '(?<f>"version"\s*:\s*"[^"]+")' | get f.0)
    $raw | str replace $field ($field | str replace $current $stripped) | save --force $file
    {plugin: $dir, from: $current, to: $stripped, moved: true}
}

# Refuse to start on ground that would make the result ambiguous: a dirty tree
# mixes unrelated edits into the promotion commit, and a stale main promotes
# onto something that is not what is published.
def preflight [remote: string]: nothing -> nothing {
    if not ('.claude-plugin/marketplace.json' | path exists) {
        error make {msg: "not at the tekton repo root"}
    }
    if (git-out ["status" "--porcelain"]) != '' {
        error make {msg: "working tree is dirty — commit or stash before promoting"}
    }
    let branch = (git-out ["rev-parse" "--abbrev-ref" "HEAD"])
    if $branch != 'main' {
        error make {msg: $"on ($branch) — promotion runs from main"}
    }
    ^git fetch --quiet $remote | complete | ignore
    if (git-out ["rev-parse" "HEAD"]) != (git-out ["rev-parse" $"($remote)/main"]) {
        error make {msg: $"main and ($remote)/main disagree — sync before promoting"}
    }
}

export def main [
    --remote: string = 'origin'   # where beta and main are published
    --dry-run                     # report what would happen, change nothing
]: nothing -> nothing {
    preflight $remote

    let beta = $"($remote)/beta"
    let carried = (git-out ["log" "--oneline" "--no-decorate" $"main..($beta)"] | lines | where {|l| $l != '' })
    if ($carried | is-empty) {
        ok $"nothing to promote — main already holds every commit from ($beta)"
        return
    }

    info $"promote: ($carried | length) commit\(s\) from ($beta)"
    $carried | each {|c| print $"    ($c)" } | ignore

    let dirs = catalogue-dirs
    let moves = ($dirs | each {|d| {plugin: $d, from: (version-of $d), to: (git-out ["show" $"($beta):($d)/.claude-plugin/plugin.json"] | parse --regex '"version"\s*:\s*"(?<v>[^"]+)"' | get v.0)}})
    print ''
    info "versions"
    $moves | each {|m| print $"    ($m.plugin): ($m.from) -> ($m.to | split row '-' | first)" } | ignore

    if $dry_run {
        print ''
        ok "dry run — nothing changed"
        return
    }

    # Merge without committing, so the catalogue restore and the de-beta land
    # inside the same commit as the content. A promotion that arrives in three
    # commits has two intermediate states that were never a valid channel.
    let before = (git-out ["rev-parse" "HEAD"])
    let merged = (^git merge --no-ff --no-commit $beta | complete)
    if $merged.exit_code != 0 {
        ^git merge --abort | complete | ignore
        error make {msg: $"merge of ($beta) failed and was aborted: ($merged.stdout | str trim)"}
    }

    # The catalogue is the one file that must NOT come across: its name and
    # display names are what distinguish the channels.
    git-out ["checkout" $before "--" ".claude-plugin/marketplace.json"] | ignore

    let stripped = ($dirs | each {|d| strip-prerelease $d })
    git-out ["add" "-A"] | ignore

    print ''
    let checked = (^nu -c 'use admin/verify; verify channel' | complete)
    print ($checked.stdout | str trim)
    if $checked.exit_code != 0 {
        bad "verify channel refused — the merge is staged but NOT committed"
        error make {msg: "aborting: fix the incoherence, then commit by hand or `git merge --abort`"}
    }

    let moved = ($stripped | where moved)
    let summary = ($moved | each {|m| $"($m.plugin) ($m.to)" } | str join ', ')
    let subject = if ($moved | is-empty) {
        'deploy(catalogue): 📦 the stable channel takes up the beta content'
    } else {
        $"deploy\(catalogue\): 📦 the stable channel takes up the beta — ($summary)"
    }
    git-out ["commit" "-m" $subject] | ignore

    print ''
    ok $"promoted locally — ($carried | length) commit\(s\), ($moved | length) version\(s\) de-beta'd"
    info "not pushed. Announce this before publishing:"
    print $"    git push ($remote) main"
    $moved | each {|m| print $"    ($m.plugin): ($m.from) -> ($m.to)" } | ignore
}
