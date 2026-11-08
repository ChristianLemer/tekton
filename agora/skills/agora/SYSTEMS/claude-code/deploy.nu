#!/usr/bin/env nu
# deploy — carry the apparatus to one channel of the catalog repository.
#
# DEPLOY, all of it: it is mechanical. What the system file `claude-code.md` says under
# *The gate* and *The comparison*, and nothing else:
#
#   1. the working copy is on the channel's head, and clean — no alignment over work in progress;
#   2. the four-way comparison, apparatus against destination, over what this passage carries;
#   3. refuse a number already served — on this head or another — under another content;
#   4. dry run by default; with --apply, a complete alignment of what git tracks, deletions
#      included — what git ignores at the destination is never touched;
#   5. report what changed, and what remains to commit and push.
#
# What this script does NOT do: package (package.nu does), decide the channel (the review
# does, with the user), commit or push (the operator does — push is conscious).
#
# The destination is reached through $AGORA_DESTINATION, default ~/<destination> — the
# destination's name as the instance writes it, never a machine path written here. Run from
# the corpus's place — the folder that holds MANIFEST.md:
#   nu "<path to>/deploy.nu" <catalog> <unit>                  # dry run
#   nu "<path to>/deploy.nu" <catalog> <unit> <unit> --apply
#   nu "<path to>/deploy.nu" <other catalog> <unit> --apply    # to all: the same unit, on the other head
#
# A unit whose destination is the corpus itself is served to this working copy, as project
# skills at the root of the repository — the system reads them from the folder a session
# starts in and every folder above it, so the root serves wherever the agent starts; --to
# names another root. The same comparison, bounded to the folder of each skill the unit carries:
#   nu "<path to>/deploy.nu" corpus <unit>                     # dry run
#   nu "<path to>/deploy.nu" corpus <unit> --apply

# what the destination holds besides the units, in the apparatus (system file, "The gate")
const DESTINATION = "destination"
const CATALOG = ".claude-plugin/marketplace.json"
# the corpus as a destination: its channel row, and where the system installs project skills
const CORPUS_DESTINATION = "this corpus"
const PROJECT_SKILLS = ".claude/skills"
# the instance, at the head of the corpus's place (Agora, "The Instance")
const INSTANCE = "MANIFEST.md"

def info [text: string]: nothing -> nothing { print $"(ansi yellow)($text)(ansi reset)" }
def stop [text: string] { error make {msg: $text} }

# ---------------------------------------------------------------- the instance

def cells [line: string]: nothing -> list<string> {
    $line | str trim | str trim --char "|" | split row "|" | each {|c| $c | str trim | str trim --char "`" }
}

# The first Markdown table after the line that starts with `marker`, as records.
def table-after [text: string, marker: string]: nothing -> list<record> {
    let lines = ($text | lines)
    let hits = ($lines | enumerate | where {|l| $l.item | str trim | str starts-with $marker })
    if ($hits | is-empty) { return [] }
    let rows = ($lines | skip ($hits.0.index + 1)
        | skip while {|l| not ($l | str trim | str starts-with "|") }
        | take while {|l| $l | str trim | str starts-with "|" })
    if ($rows | length) < 3 { return [] }
    let head = (cells $rows.0)
    $rows | skip 2 | each {|l|
        let c = (cells $l)
        $head | enumerate | reduce --fold {} {|h, acc| $acc | insert $h.item ($c | get --optional $h.index | default "") }
    }
}

# ---------------------------------------------------------------- the destination

def --wrapped git-in [dir: path, ...args]: nothing -> record { ^git -C $dir ...$args | complete }

# The head's content for one unit, as a temporary folder — or null if the head lacks it.
def served [dir: path, ref: string, unit: string]: nothing -> any {
    if (git-in $dir cat-file -e $"($ref):($unit)").exit_code != 0 { return null }
    let tmp = (^mktemp -d | str trim)
    ^git -C $dir archive --format=tar $ref $unit | ^tar -x -C $tmp
    $tmp | path join $unit
}

# A head is read locally if the working copy has it, else from its remote.
def ref-of [dir: path, head: string]: nothing -> any {
    for r in [$head $"origin/($head)"] { if (git-in $dir rev-parse --verify --quiet $r).exit_code == 0 { return $r } }
    null
}

# What git tracks at the destination, under the given paths (all of it with none). Alignment
# reads and deletes through git only: the clean check sees nothing git ignores, so a deletion
# read from the disk would erase, without trace, what the guard never saw.
def tracked [dir: path, ...paths: string]: nothing -> list<string> {
    (^git -C $dir ls-files -z -- ...$paths) | split row (char nul) | where {|f| $f != "" } | sort
}

def files-under [dir: path]: nothing -> list<string> {
    if not ($dir | path exists) { return [] }
    ^find $dir -type f -not -path "*/.git/*" -printf "%P\n" | lines | sort
}

def same-file [a: path, b: path]: nothing -> bool { (^cmp -s $a $b | complete).exit_code == 0 }

def same-tree [a: path, b: path]: nothing -> bool { (^diff -rq $a $b | complete).exit_code == 0 }

def version-in [unit_dir: path]: nothing -> string {
    let m = ($unit_dir | path join .claude-plugin plugin.json)
    if ($m | path exists) { open $m | get version } else { "" }
}

# Serve units to the corpus itself, as project skills. No catalog, no head, no cache by number:
# the folder is ignored by git — serving is an installation, each working copy serves itself —
# so the clean check has no hold there. Its place is taken by a bound: nothing is written or
# removed outside the folder of each skill the unit carries.
def deploy-corpus [units: list<string>, app: path, apply: bool, base: path]: nothing -> nothing {
    let root = ($base | path join $PROJECT_SKILLS)
    let skills = ($units | each {|u|
        let dir = ($app | path join $u skills)
        if not ($dir | path exists) { stop $"($u) carries no skill — nothing to serve to the corpus" }
        ls $dir | where type == dir | get name | each {|s| {unit: $u, skill: ($s | path basename), src: $s} }
    } | flatten)
    let rows = ($skills | each {|s|
        let dst = ($root | path join $s.skill)
        let wanted = (files-under $s.src)
        let present = (files-under $dst)
        {
            skill: $s.skill, src: $s.src, dst: $dst
            added: ($wanted | where {|f| $f not-in $present })
            gone: ($present | where {|f| $f not-in $wanted })
            changed: ($wanted | where {|f| $f in $present and not (same-file ($s.src | path join $f) ($dst | path join $f)) })
        }
    })
    let numbers = ($units | each {|u| $"($u) (version-in ($app | path join $u))" } | str join ", ")
    print $"(ansi cyan)corpus(ansi reset) — project skills in ($root)"
    for r in $rows {
        print $"  ($r.skill)"
        print $"    1. to carry \(($r.added | length)\):   ($r.added | str join ', ')"
        print $"    2. without a source here \(($r.gone | length)\): ($r.gone | str join ', ')"
        print $"    3. different \(($r.changed | length)\): ($r.changed | str join ', ')"
    }
    print $"  4. numbers: ($numbers) — not consumed here: nothing caches by number"
    print $"  left alone: whatever else ($PROJECT_SKILLS) and .claude/ hold"

    if not $apply { info "dry run — nothing written. --apply aligns."; return }
    for r in $rows {
        for f in $r.gone { rm ($r.dst | path join $f) }
        for f in ($r.added | append $r.changed) { let to = ($r.dst | path join $f); mkdir ($to | path dirname); ^cp ($r.src | path join $f) $to }
        if ($r.dst | path exists) { ^find $r.dst -mindepth 1 -type d -empty -delete }
    }
    info $"aligned: ($rows | get skill | str join ', ') — an installation, nothing to commit."
}

# Carry the apparatus to one channel. Run from the corpus's place.
def main [
    catalog: string                          # the channel, by its catalog name in the instance — or `corpus`
    ...units: string                         # the units the review sent to this channel
    --apply                                  # align; without it, the dry run only
    --to: string = ""                        # the channel's working copy, default $AGORA_DESTINATION then ~/<destination>; for `corpus`, the root to serve, default the repository's
] {
    if not ($INSTANCE | path exists) { stop $"no ($INSTANCE) here — run from the corpus's place" }
    let text = (open --raw $INSTANCE)
    let apparatus = (table-after $text "**Folders**" | where Folder == apparatus | get --optional Path.0 | default "")
    if $apparatus == "" { stop "the instance names no folder for the apparatus — REVIEW writes it under Units (Agora's template)" }
    let rows = (table-after $text "## Units" | where {|r| $r.Unit != "" })
    let channels = (table-after $text "**Channels**")
    if ($units | is-empty) { stop "name the units the review sent to this channel — nothing leaves by default" }
    for u in $units { if $u not-in ($rows | get Unit) { stop $"($u) is not a unit of the instance" } }
    let target = (if $catalog == "corpus" { $CORPUS_DESTINATION } else { $channels | where Catalogue == $catalog | get --optional Destination.0 | default "" })
    if $target == "" { stop $"($catalog) is not a channel of the instance — declared: ($channels | get --optional Catalogue | default [] | where {|c| $c != "—" } | str join ', '), or corpus" }
    # a unit goes only where the instance sends it: to a catalog of its destination, or to the corpus
    for u in $units {
        let d = ($rows | where Unit == $u | get Destination.0)
        if $d != $target { stop $"($u) is served to ($d) — not to (if $catalog == 'corpus' { 'the corpus' } else { $catalog })" }
    }
    if $catalog == "corpus" {
        let app = ($apparatus | path expand)
        for u in $units { if not ($app | path join $u | path exists) { stop $"($u) is not in the apparatus — PACKAGE first" } }
        let base = (if $to != "" { $to | path expand } else { ^git rev-parse --show-toplevel | str trim })
        deploy-corpus $units $app $apply $base
        return
    }
    let declared = ($rows | where Destination == $target | get Unit)
    let channel = ($channels | where Catalogue == $catalog)
    if ($channel | is-empty) { stop $"($catalog) is not a channel of the instance — declared: ($channels | get --optional Catalogue | default [] | where {|c| $c != "—" } | str join ', ')" }
    let head = $channel.0.Head
    let catalogs = ($channels | where {|c| $c.Destination != $CORPUS_DESTINATION } | get Catalogue)

    # 1. the working copy: on the channel's head, and clean
    let dest = (if $to != "" { $to } else { $env.AGORA_DESTINATION? | default ($nu.home-dir | path join $target) } | path expand)
    if not ($dest | path join .git | path exists) { stop $"($dest) is not a working copy of the catalog repository" }
    let branch = ((git-in $dest branch --show-current).stdout | str trim)
    if $branch != $head { stop $"($dest) is on ($branch) — the channel ($catalog) is served from ($head)" }
    let dirty = ((git-in $dest status --porcelain).stdout | str trim)
    if $dirty != "" { print $dirty; stop $"($dest) has work in progress — not aligned over; commit or set it aside first" }

    # what the apparatus carries for this passage
    let app = ($apparatus | path expand)
    for u in $units { if not ($app | path join $u | path exists) { stop $"($u) is not in the apparatus — PACKAGE first" } }
    let home = ($app | path join $DESTINATION README.md)
    if not ($home | path exists) { stop "the destination's home page is not in the apparatus — DOCUMENT writes it first" }
    let extras = (ls -a ($app | path join $DESTINATION) | where {|e| ($e.name | path basename) not-in $catalogs } | get name)

    # 3. a served number is consumed — on this head and on every other
    for u in $units {
        let v = (version-in ($app | path join $u))
        for c in $channels {
            let ref = (ref-of $dest $c.Head)
            if $ref == null { continue }
            let s = (served $dest $ref $u)
            if $s == null { continue }
            if (version-in $s) == $v and not (same-tree ($app | path join $u) $s) {
                stop $"($u) ($v) is already served by ($c.Catalogue) with another content — PACKAGE must set a new number"
            }
        }
    }

    # 2. the four-way comparison, over what this passage carries
    let wanted = ($units | each {|u| files-under ($app | path join $u) | each {|f| $"($u)/($f)" } } | flatten
        | append ($extras | each {|e| let b = ($e | path basename); if ($e | path type) == dir { files-under $e | each {|f| $"($b)/($f)" } } else { [$b] } } | flatten))
    let present = (tracked $dest ...($units | append ($extras | each {|e| $e | path basename })))
    let src_of = {|f| let top = ($f | split row "/" | first); if $top in $units { $app | path join $f } else { $app | path join $DESTINATION $f } }
    let added = ($wanted | where {|f| $f not-in $present })
    let gone = ($present | where {|f| $f not-in $wanted })
    let changed = ($wanted | where {|f| $f in $present and not (same-file (do $src_of $f) ($dest | path join $f)) })
    # what the head tracks without a source: neither a unit, nor a destination file, nor the catalog —
    # a remnant of the time the destination was worked in, or a text retouched there
    let keep = ($declared | append ($extras | each {|e| $e | path basename }) | append [.claude-plugin])
    let strays = (tracked $dest | each {|f| $f | split row "/" | first } | uniq | where {|n| $n not-in $keep })
    let ignored = ((git-in $dest ls-files --others --ignored --exclude-standard --directory).stdout | lines | where {|l| $l != "" })
    # removing an ignore file would expose what it hides — one `git add` from published
    if $apply and ($strays | any {|n| $n == .gitignore }) and ($ignored | is-not-empty) {
        stop $"the .gitignore the alignment removes still hides: ($ignored | str join ', ') — move those out of the working copy first, or declare .gitignore as a destination file"
    }
    let numbers = ($units | each {|u| {unit: $u, served: (version-in ($dest | path join $u)), carried: (version-in ($app | path join $u))} })

    # the catalog lists the units the head carries after alignment: its frame as the apparatus
    # generated it, each entry from the manifest of the unit this head will serve — a unit not
    # carried at this passage keeps the version, hence the description, it is served with
    let generated = (open ($app | path join $DESTINATION $catalog $CATALOG))
    let after = ($declared | where {|u| $u in $units or ($dest | path join $u | path exists) })
    let entries = ($after | each {|u|
        let m = (open ((if $u in $units { $app } else { $dest }) | path join $u .claude-plugin plugin.json))
        {name: $u, displayName: ($u | str capitalize), description: $m.description, source: $"./($u)"}
    })
    let cat = ($generated | update plugins $entries)
    let cat_text = (($cat | to json --indent 2) + "\n")
    let cat_file = ($dest | path join $CATALOG)
    let cat_changed = (not ($cat_file | path exists)) or ((open --raw $cat_file) != $cat_text)

    print $"(ansi cyan)($catalog)(ansi reset) — head ($head), working copy ($dest)"
    print $"  1. to carry \(($added | length)\):   ($added | str join ', ')"
    print $"  2. without a source here \(($gone | length)\): ($gone | str join ', ')"
    print $"  3. different \(($changed | length)\): ($changed | str join ', ')"
    print $"  4. numbers: ($numbers | each {|n| $'($n.unit) (if $n.served == "" { "—" } else { $n.served }) → ($n.carried)' } | str join ', ')"
    print $"  catalog: (if $cat_changed { 'regenerated' } else { 'unchanged' }) — ($after | str join ', ')"
    print $"  not from the apparatus, removed by the alignment: (if ($strays | is-empty) { '—' } else { $strays | str join ', ' })"
    print $"  ignored by git, left alone: (if ($ignored | is-empty) { '—' } else { $ignored | str join ', ' })"

    if not $apply { info "dry run — nothing written. --apply aligns."; return }

    # 4. complete alignment of what git tracks, deletions included — file by file, so that
    # nothing git ignores goes with a folder
    for f in ($gone | append (if ($strays | is-empty) { [] } else { tracked $dest ...$strays })) { rm ($dest | path join $f) }
    for f in $wanted { let to = ($dest | path join $f); mkdir ($to | path dirname); ^cp (do $src_of $f) $to }
    for d in ($units | append $strays) { let p = ($dest | path join $d); if ($p | path exists) and ($p | path type) == dir { ^find $p -type d -empty -delete } }
    mkdir ($cat_file | path dirname)
    $cat_text | save --raw --force $cat_file

    # 5. what remains for the operator
    print ((git-in $dest status --short).stdout)
    info $"aligned. Commit and push from ($dest) — that act is yours."
}
