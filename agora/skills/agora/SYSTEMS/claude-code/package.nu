#!/usr/bin/env nu
# package — regenerate the whole apparatus for the Claude Code system.
#
# PACKAGE, the mechanical part: what the system file `claude-code.md` declares as
# transformations 1, 2, 4, 5, 6, 7 and 8, and nothing else. Transformation 3 — the
# description compressed from ABOUT.md — is a reading; its result belongs to the corpus
# that read it, and is kept in the system's readings file at the head of the corpus's
# place — `claude-code.json`, named after the system file — so that a run is
# replayable; it is reread against each ABOUT.md at every passage. The inventories are
# rendered from `templates/`, beside this script.
#
# The script renders shapes — a method, a method and its guardian, a carrier — and
# knows nothing of a corpus's units, pieces or destinations: what a unit takes, in what
# order, with what, it reads in the instance at every passage (Agora, "What PACKAGE
# reads to compose a unit"). A piece's nature is the first word of the Nature line of
# its README, recognised through Agora's lexicon; a composition's rule names a nature
# and families, which resolve through the places of the pieces' folder; a list or an
# addition names pieces by their folder's name; the order is the instance's Reading
# order restricted to the selection. A persona and a guardian are cut at the marks the
# system file sets. Where one of these is missing, the passage stops and names it.
#
# Every passage regenerates every unit the instance declares, the catalog of each
# channel and the files the instance names for the destination: freshness is
# acquired by construction, it is not checked apart. A unit keeps the number it
# carries in the apparatus unless this passage gives it a new one.
#
# What this script does NOT do: review (the instance is read, not confirmed),
# qualify, decide the number, write the home page (DOCUMENT does), deploy.
# Judgment stays with the gesture.
#
# Run from the corpus's place — the folder that holds MANIFEST.md, which names the folders
# of the pieces and of the apparatus; nothing here knows the workspace around it:
#   nu "<path to>/package.nu"                       # same numbers, everything regenerated
#   nu "<path to>/package.nu" <unit>=<version> <unit>=<version>

# the instance, at the head of the corpus's place (Agora, "The Instance")
const INSTANCE = "MANIFEST.md"
# where a piece that follows Kyklos keeps its product (Agora, "The Place of the Corpus")
const PRODUCT = "4. Forge"
# the presentation is consumed for metadata and never carried; a deliverable's own
# README is the hub of whoever opens it (system file, "What has no place")
const NOT_CARRIED = ["ABOUT.md" "README.md"]
# what the destination holds besides the units, in the apparatus (system file, "The gate")
const DESTINATION = "_destination"
# the destination of a unit that serves the corpus itself, not a catalog (system file, "The gate")
const CORPUS_DESTINATION = "this corpus"
# what a unit served to the corpus may carry: skills only — the project's skill folder holds nothing else
const CORPUS_CARRIES = [".claude-plugin" "skills" "INVENTORY.md"]
# the marks a persona and a guardian carry, as the system file sets them ("Rendering of natures"):
# the conduct beside the persona's main document, starting at its first heading with this prefix;
# the guardian beside the method's main document, its body after the first rule
const ACTIVATION = "ACTIVATION.md"
const CONDUCT_MARK = "## 1."
const GUARDIAN = "GUARDIAN.md"
const RULE = "\n---\n"
# the natures a rendering knows, in the lexicon's first language — a piece may declare them in any of its languages
const NATURES = ["grammar" "method" "persona"]
# another client reading the same units refuses a skill description past this (system file, "Limits")
const OTHER_CEILING = 1024
# where this script lives: templates/ sit beside it, and Agora's lexicon two levels up
const HERE = (path self | path dirname)
const LEXICON = (path self | path dirname | path join .. .. lexicon.md)
# the system's readings, at the head of the corpus's place, named after the system file
const SYSTEM = (path self | path dirname | path basename)

def info [text: string]: nothing -> nothing { print $"(ansi yellow)($text)(ansi reset)" }

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

def stop [text: string] { error make {msg: $text} }

def read-instance [file: path]: nothing -> record {
    if not ($file | path exists) {
        if ($file | path dirname | path join AGORA.md | path exists) {
            stop $"no ($file) here, but an AGORA.md — the corpus is in the previous form: rename the instance ($INSTANCE), name its folders, put the destination files in 0. Colophon/ \(Agora's template\)"
        }
        stop $"no instance at ($file) — run from the corpus's place"
    }
    let text = (open --raw $file)
    let folders = (table-after $text "**Folders**")
    let pieces = ($folders | where Folder == pieces | get --optional Path.0 | default "")
    let apparatus = ($folders | where Folder == apparatus | get --optional Path.0 | default "")
    if $pieces == "" or $apparatus == "" { stop "the instance names no folder for the pieces or the apparatus — REVIEW writes them under Units (Agora's template)" }
    if ($text | str contains "\n## Opportunity") and not ($text | str contains "\n## Pauses") {
        stop "the instance is in the previous form (Opportunity, not Pauses) — REVIEW must rewrite it from Agora's template"
    }
    let rows = (table-after $text "## Units" | where {|r| $r.Unit != "" })
    if ($rows | is-empty) { stop "the instance declares no unit" }
    let units = ($rows | get Unit)
    let channels = (table-after $text "**Channels**")
    if ($channels | is-empty) { stop "the instance declares no channel — REVIEW writes them under Units (Agora's template)" }
    # each unit names its destination as a channel row names it: the catalogs are drawn from that pairing
    let known = ($channels | get Destination | uniq)
    for r in $rows { if $r.Destination not-in $known { stop $"($r.Unit): destination ($r.Destination) is not a destination of the channels — declared: ($known | str join ', ')" } }
    let files = (table-after $text "**Destination files**")
    let pauses = (table-after $text "## Pauses" | get --optional Piece | default [] | where {|p| $p not-in ["" "—"] })
    {units: $units, rows: $rows, channels: $channels, files: $files, pauses: $pauses, pieces: $pieces, apparatus: $apparatus,
     order: (reading-order $text), compositions: (compositions $text), dir: ($file | path expand | path dirname)}
}

# The lines of a `## ` section, up to the next one.
def section [text: string, heading: string]: nothing -> list<string> {
    $text | lines | skip until {|l| $l == $heading } | skip 1 | take until {|l| $l | str starts-with "## " }
}

# Reading order: the numbered list of pieces, each by its path relative to the pieces' folder.
def reading-order [text: string]: nothing -> list<string> {
    section $text "## Reading order" | parse --regex '^\d+\.\s+`(?<piece>[^`]+)`' | get piece
}

# Composition: per `### `<unit>``, its Rule, List and Adds, as written.
def compositions [text: string]: nothing -> record {
    let lines = (section $text "## Composition")
    $lines | enumerate | where {|l| $l.item | str starts-with "### `" } | reduce --fold {} {|h, acc|
        let unit = ($h.item | parse --regex '^### `(?<u>[^`]+)`' | get u.0)
        let block = ($lines | skip ($h.index + 1) | take until {|l| $l | str starts-with "### " })
        let field = {|key| $block | parse --regex ('^- \*\*' + $key + ':\*\*\s*(?<v>.*)$') | get --optional v.0 | default "" }
        $acc | insert $unit {rule: (do $field Rule), list: (do $field List), adds: (do $field Adds)}
    }
}

# A composition that names a paused piece stops here: the composition follows the pause, not the reverse.
def unpaused [piece: string, pauses: list<string>]: nothing -> nothing {
    let name = ($piece | path basename)
    if $name in $pauses { stop $"($name) is paused in the instance — the composition of its unit must leave it out first" }
}

# ---------------------------------------------------------------- rendering

# A frontmatter value containing ': ' must be quoted; single quotes, doubled inside.
def quote [v: string]: nothing -> string {
    if ($v | str contains ": ") { "'" + ($v | str replace --all "'" "''") + "'" } else { $v }
}

def frontmatter [name: string, description: string, --skills: list<string> = []]: nothing -> string {
    let head = $"---\nname: ($name)\ndescription: (quote $description)\n"
    # skills: — the system hands the agent the listed skills' descriptions at start, not their bodies (system file, persona)
    let sk = if ($skills | is-empty) { "" } else { "skills:\n" + ($skills | each {|s| $"  - ($s)\n" } | str join) }
    $head + $sk + "---\n"
}

def write [file: path, text: string]: nothing -> nothing {
    mkdir ($file | path dirname)
    $text | save --raw --force $file
}

def copy-entry [src: path, dst: path]: nothing -> nothing {
    if ($dst | path exists) { stop $"two files of one deliverable land on ($dst)" }
    mkdir ($dst | path dirname)
    cp -r $src $dst
}

# A piece's product, where Kyklos puts it. No fallback to an earlier form: a piece whose
# product is not there stops the passage, named.
def deliverable [piece: string, name: string]: nothing -> path {
    let p = ([$env.PIECES $piece $PRODUCT $name] | path join)
    if not ($p | path exists) { stop $"($piece): no product at ($PRODUCT)/($name)/ — the piece is not in the form its method sets" }
    $p
}

# The same, as the inventory cites it: relative to the pieces' folder.
def source-of [piece: string, name: string]: nothing -> string { $"($piece)/($PRODUCT)/($name)/" }

# A piece's product is the one folder of its Forge level; none, or several, stops the passage.
def product-of [piece: string]: nothing -> string {
    let forge = ([$env.PIECES $piece $PRODUCT] | path join)
    let dirs = (if ($forge | path exists) { ls $forge | where type == dir | get name | each {|d| $d | path basename } } else { [] })
    if ($dirs | length) != 1 { stop $"($piece): ($dirs | length) product folders in ($PRODUCT)/ — one is expected" }
    $dirs.0
}

# The places of the pieces' folder, and the name each is recognised by — its folder name
# without the letter that orders it ("c. <Family>" → "<Family>").
def places []: nothing -> list<record> {
    ls $env.PIECES | where type == dir | get name | each {|d|
        let folder = ($d | path basename)
        {folder: $folder, name: ($folder | str replace --regex '^[a-z0-9]+\.\s+' '')}
    }
}

# Every piece, as `<place>/<piece>`.
def all-pieces []: nothing -> list<string> {
    places | each {|p| ls ([$env.PIECES $p.folder] | path join) | where type == dir | get name | each {|d| $"($p.folder)/($d | path basename)" } } | flatten
}

# The natures, as Agora's lexicon writes them: each known nature with all its translations.
def natures []: nothing -> list<record> {
    let rows = (open --raw $LEXICON | lines | where {|l| $l | str starts-with "|" } | each {|l| cells $l })
    $NATURES | each {|n|
        let row = ($rows | where {|r| ($r | get --optional 0 | default "") == $n })
        if ($row | is-empty) { stop $"Agora's lexicon has no row for the nature ($n)" }
        {nature: $n, words: ($row.0 | each {|w| $w | str lowercase })}
    }
}

# A piece's nature: the first word of the Nature line its README declares, under État or
# Status, recognised through the lexicon. Absent or unknown, the passage stops.
def nature-of [piece: string]: nothing -> string {
    let readme = ([$env.PIECES $piece README.md] | path join)
    let text = (if ($readme | path exists) { open --raw $readme } else { "" })
    let state = ($text | lines | skip until {|l| $l =~ '^## (État|Etat|Status|State)\b' } | skip 1 | take until {|l| $l | str starts-with "## " })
    let value = ($state | parse --regex '\*\*Nature\*\*\s*[—–:-]+\s*(?<v>.*)$' | get --optional v.0 | default "")
    if $value == "" { stop $"($piece): its README declares no nature — a Nature line under État or Status" }
    let word = ($value | split row --regex '[\s.,:;—–()]+' | where {|w| $w != "" } | first | str lowercase)
    let hit = (natures | where {|n| $word in $n.words })
    if ($hit | is-empty) { stop $"($piece): its declared nature « ($word) » is none the lexicon knows — ($NATURES | str join ', ')" }
    $hit.0.nature
}

# A rule — « every grammar of the families <A> and <B> » — names a nature
# and families: each family must be a place of the pieces' folder, and every piece in it
# that declares that nature is selected.
def by-rule [unit: string, rule: string]: nothing -> list<string> {
    let parsed = ($rule | parse --regex '^every\s+(?<n>\S+)\s+of\s+(?:the\s+)?famil(?:y|ies)\s+(?<f>.+)$')
    if ($parsed | is-empty) { stop $"($unit): its rule names no nature and families — « ($rule) »" }
    let nature = ($parsed.0.n | str lowercase)
    if $nature not-in $NATURES { stop $"($unit): its rule names the nature ($nature), none a rendering knows — ($NATURES | str join ', ')" }
    let families = ($parsed.0.f | split row --regex ',\s*|\s+and\s+' | each {|f| $f | str trim | str trim --char "`" } | where {|f| $f != "" })
    let ps = (places)
    $families | each {|f|
        let hit = ($ps | where {|p| $p.name == $f or ($p.name | str ends-with $" ($f)") })
        if ($hit | is-empty) { stop $"($unit): the family ($f) its rule names is no place of the pieces' folder" }
        let folder = $hit.0.folder
        ls ([$env.PIECES $folder] | path join) | where type == dir | get name | each {|d| $"($folder)/($d | path basename)" }
            | where {|p| (nature-of $p) == $nature }
    } | flatten
}

# The system's readings, at the head of the corpus's place; a key a unit asks for and the
# file does not hold stops the passage.
def reading [readings: record, kind: string, key: string]: nothing -> any {
    let v = ($readings | get --optional $kind | default {} | get --optional $key)
    if $v == null { stop $"($"($SYSTEM).json") holds no ($kind).($key) — PACKAGE reads it from the ABOUT.md and writes it there" }
    $v
}

# A list, or an addition, names pieces by their folder's name.
def named-in [text: string]: nothing -> list<string> {
    all-pieces | where {|p| $text | str contains ($p | path basename) }
}

# The unit's order: the instance's Reading order, restricted to the selection. A selected
# piece the order does not place stops the passage.
def ordered [unit: string, selection: list<string>, order: list<string>]: nothing -> list<string> {
    for p in $selection { if $p not-in $order { stop $"($unit): ($p) is selected and Reading order does not place it — REVIEW places it" } }
    $order | where {|p| $p in $selection }
}

def unit-dir [unit: string]: nothing -> path { [$env.APPARATUS $unit] | path join }

def revision []: nothing -> string { ^git rev-parse --short HEAD | str trim }

# Grammar and method render the same way: one skill, the main document as body, and
# everything else the deliverable carries beside it, each at its place — placement is the
# author's promise of use, and the body's links resolve unchanged. Returns what was carried.
def skill [unit: string, name: string, src: path, main: string, description: string, --exclude: list<string> = []]: nothing -> list<string> {
    let dst = ([(unit-dir $unit) skills $name] | path join)
    write ($dst | path join SKILL.md) ((frontmatter $name $description) + (open --raw ($src | path join $main)))
    ls $src | sort-by name | each {|e|
        let base = ($e.name | path basename)
        if $base == $main or $base in $NOT_CARRIED or $base in $exclude { return [] }
        copy-entry $e.name ($dst | path join $base)
        [(if $e.type == dir { $base + "/" } else { $base })]
    } | flatten
}

def carried-list [carried: list<string>]: nothing -> string {
    if ($carried | is-empty) { "—" } else { $carried | each {|c| $'`($c)`' } | str join ", " }
}

# Transformation 6. `agent` names the unit's main-thread persona (`settings.agent`); `hooks` carries one
# SessionStart entry per payload injected at session start; `extra` is free-form metadata the system
# does not read (the carrier does — the glyph).
def manifest [unit: string, version: string, description: string, owner: record, --agent: string = "", --hooks: record = {}, --extra: record = {}]: nothing -> nothing {
    let m = ({name: $unit, version: $version, description: $description, author: $owner}
        | merge (if $agent == "" { {} } else { {settings: {agent: $agent}} })
        | merge (if ($extra | is-empty) { {} } else { {metadata: $extra} })
        | merge (if ($hooks | is-empty) { {} } else { {hooks: $hooks} }))
    write ([(unit-dir $unit) .claude-plugin plugin.json] | path join) (($m | to json --indent 2) + "\n")
}

def hook [arg: string, label: string]: nothing -> record {
    {hooks: [{type: command, command: $'node "${CLAUDE_PLUGIN_ROOT}/hooks-handlers/session-start.js" ($arg)', timeout: 5, statusMessage: $"Loading ($label)..."}]}
}

# The carrier's activation code lives beside the system file and travels with the unit.
def handler [unit: string]: nothing -> nothing {
    let dst = ([(unit-dir $unit) hooks-handlers session-start.js] | path join)
    mkdir ($dst | path dirname)
    cp ($HERE | path join hooks-handlers session-start.js) $dst
}

# The channels of a unit's destination — catalog and whom it serves — for the carrier,
# which reads them to recognise its twin (system file, "One channel at a time"). The same
# on every head, so the unit stays byte-identical from one channel to the other.
def channel-rows [unit: string, rows: list<record>, channels: list<record>]: nothing -> string {
    let dest = ($rows | where Unit == $unit | get Destination.0)
    $channels | where Destination == $dest | each {|c| $"| `($c.Catalogue)` | ($c.Serves) |" } | str join "\n"
}

def fill [template: string, values: record]: nothing -> string {
    $values | transpose key value | reduce --fold $template {|it, acc| $acc | str replace --all $"{($it.key)}" $it.value }
}

def template [shape: string]: nothing -> string { open --raw ($HERE | path join templates $"inventory-($shape).md") }

# ---------------------------------------------------------------- a carrier
# A persona that holds the main thread and carries grammars as skills. Its grammars are
# the composition's rule resolved, in the corpus's reading order; the persona is the piece
# its addition names. Address, essence and conduct are cut where the persona declares.
def package-carrier [unit: string, version: string, r: record, owner: record, inst: record, channels: string, persona_piece: string]: nothing -> nothing {
    let comp = ($inst.compositions | get $unit)
    if $comp.rule == "" { stop $"($unit): a carrier takes its grammars by a rule — its composition has none" }
    let selection = (by-rule $unit $comp.rule | where {|p| ($p | path basename) not-in $inst.pauses })
    if ($selection | any {|p| (nature-of $p) != grammar }) { stop $"($unit): a carrier carries grammars — its rule selects another nature" }
    let grammars = (ordered $unit $selection $inst.order | each {|piece|
        let upper = (product-of $piece)
        {name: ($upper | str lowercase), piece: $piece, upper: $upper, family: (places | where folder == ($piece | path dirname) | get name.0)}
    })
    let piece = $persona_piece
    unpaused $piece $inst.pauses
    let carried = ($grammars | each {|g| skill $unit $g.name (deliverable $g.piece $g.upper) $"($g.upper).md" (reading $r skills $g.name) })

    # persona — transformations 4 and 5, at the marks the persona declares
    let upper = (product-of $piece)
    let persona = ($upper | str lowercase)
    let src = (deliverable $piece $upper)
    let essence = (open --raw ($src | path join $"($upper).md"))
    let head = (title-block $piece $"($upper).md" $essence)
    let start = ($essence | str index-of "\n## ")
    if $start < 0 { stop $"($piece): ($upper).md has no section heading — the essence starts at its first" }
    let body = ($essence | str substring ($start + 1)..)
    let sub = ($head.subtitle | str trim --right --char ".")
    let opening = $"You are ($head.title) — ($sub | str substring 0..0 | str lowercase)($sub | str substring 1..)."
    let skills = ($grammars | each {|g| $"($unit):($g.name)" })
    write ([(unit-dir $unit) agents $"($persona).md"] | path join) ((frontmatter $persona (reading $r agents $persona) --skills $skills) + $"\n# ($head.title)\n\n($opening)\n\n" + $body)
    if not ($src | path join $ACTIVATION | path exists) { stop $"($piece): no ($ACTIVATION) beside its main document — the conduct the system file's marks expect" }
    let conduct = (open --raw ($src | path join $ACTIVATION))
    let chead = (title-block $piece $ACTIVATION $conduct)
    let cut = ($conduct | str index-of $"\n($CONDUCT_MARK)")
    if $cut < 0 { stop $"($piece): ($ACTIVATION) has no heading starting « ($CONDUCT_MARK) » — the conduct starts there" }
    write ([(unit-dir $unit) persona activation.md] | path join) ($"# ($chead.title)\n\n*($chead.subtitle)*\n\n*Derived, not authored here — `INVENTORY.md` declares the source and what it drops.*\n\n" + ($conduct | str substring ($cut + 1)..))

    # inventory, before the manifest: the manifest derives from it
    let rows = ($grammars | enumerate | each {|r| $"| ($r.index + 1) | `($r.item.name)` | ($r.item.family) |" } | str join "\n")
    let prov = ($grammars | zip $carried | each {|p| $"| `($p.0.name)` | `(source-of $p.0.piece $p.0.upper)` | (carried-list $p.1) |" } | str join "\n")
    write ([(unit-dir $unit) INVENTORY.md] | path join) (fill (template carrier) {UNIT: $unit, PERSONA: $persona, REV: (revision), N: ($grammars | length | into string), RULE: $comp.rule, ROWS: $rows, PROV: $prov, SOURCE: (source-of $piece $upper), MARK: $CONDUCT_MARK, CHANNELS: $channels})

    # manifest — transformation 6: the persona is the session's agent; the conduct is the one payload
    # injected at session start (the instance injects no grammar: none fits the ceiling whole)
    handler $unit
    let u = (reading $r units $unit)
    manifest $unit $version $u.description $owner --agent $"($unit):($persona)" --hooks {SessionStart: [(hook "--conduct" $"($persona) conduct")]} --extra (if ($u | get --optional glyph | default "") == "" { {} } else { {glyph: $u.glyph} })
}

# A persona's title and the italic subtitle under it, at the head of a document — the marks
# the persona declares; missing, the passage stops.
def title-block [piece: string, file: string, text: string]: nothing -> record {
    let ls = ($text | lines)
    let title = ($ls | where {|l| $l | str starts-with "# " } | get --optional 0 | default "" | str replace "# " "")
    let sub = ($ls | skip while {|l| not ($l | str starts-with "# ") } | skip 1 | where {|l| $l | str trim | is-not-empty } | get --optional 0 | default "" | str trim)
    if $title == "" or not ($sub =~ '^\*[^*].*[^*]\*$') { stop $"($piece): ($file) has no title and italic subtitle at its head — the marks it declares" }
    {title: $title, subtitle: ($sub | str trim --char "*")}
}

# ---------------------------------------------------------------- a method
# One piece, a method or a grammar, nothing added: one skill — or one skill per profile when
# the deliverable is partitioned into profiles, each with its own presentation. Whatever the
# unit: a unit more of this shape is a line more in the instance, nothing here.
def package-method [unit: string, version: string, r: record, owner: record, inst: record]: nothing -> nothing {
    let comp = ($inst.compositions | get $unit)
    let piece = (the-method $unit $inst)
    let upper = (product-of $piece)
    let base = (deliverable $piece $upper)
    let found = (ls $base | where type == dir | where {|e| ($e.name | path join ABOUT.md | path exists) } | get name | each {|e| $e | path basename })
    # profiles in the order the composition names them, the others after
    let named = ($comp.list | str lowercase)
    let profiles = ($found | sort-by {|p| let i = ($named | str index-of ($p | str lowercase)); if $i < 0 { 1000000 } else { $i } })
    let rows = (if ($profiles | is-empty) {
        let name = ($upper | str lowercase)
        let carried = (skill $unit $name $base $"($upper).md" (reading $r skills $name))
        [$"| `($name)` | `(source-of $piece $upper)` | (carried-list $carried) |"]
    } else {
        $profiles | each {|prof|
            unpaused $prof $inst.pauses
            let name = ($prof | str lowercase)
            let carried = (skill $unit $name ($base | path join $prof) $"($prof).md" (reading $r skills $name))
            $"| `($name)` | `(source-of $piece $upper)($prof)/` | (carried-list $carried) |"
        }
    })
    let shape = (if ($profiles | is-empty) { "one method, one skill" } else { $"one method, ($profiles | length) profiles — one skill each" })
    let composition = (if $comp.rule != "" { $"rule: ($comp.rule)" } else { $"list: ($comp.list)" })
    write ([(unit-dir $unit) INVENTORY.md] | path join) (fill (template method) {UNIT: $unit, REV: (revision), SHAPE: $shape, COMPOSITION: $composition, ROWS: ($rows | str join "\n")})
    manifest $unit $version (reading $r units $unit).description $owner
}

# The one piece a unit of one skill carries, by its list or its rule. Grammar and method render
# alike; a guardian holds a method only.
def the-method [unit: string, inst: record, --natures: list<string> = ["grammar" "method"]]: nothing -> string {
    let comp = ($inst.compositions | get $unit)
    let pieces = (if $comp.rule != "" { by-rule $unit $comp.rule } else { named-in $comp.list })
    if ($pieces | length) != 1 { stop $"($unit): its composition names ($pieces | length) pieces — a method unit carries one: « ($comp.list)($comp.rule) »" }
    let piece = $pieces.0
    unpaused $piece $inst.pauses
    let n = (nature-of $piece)
    if $n not-in $natures { stop $"($unit): ($piece) declares itself a ($n) — this shape carries a ($natures | str join ' or ')" }
    $piece
}

# ---------------------------------------------------------------- a method and its guardian
# One method, and the guardian that holds it, added by the instance: the skill, without the
# guardian; the guardian as the unit's agent, dispatchable only — no agent setting, no hook,
# no conduct. Its marks are the system file's: GUARDIAN.md beside the main document, its body
# after the first rule, under the main document's title.
def package-guardian [unit: string, version: string, r: record, owner: record, inst: record]: nothing -> nothing {
    let comp = ($inst.compositions | get $unit)
    let piece = (the-method $unit $inst --natures [method])
    let upper = (product-of $piece)
    let name = ($upper | str lowercase)
    let main = $"($upper).md"
    let src = (deliverable $piece $upper)
    if not ($src | path join $GUARDIAN | path exists) { stop $"($unit): it adds a guardian, and ($piece) carries no ($GUARDIAN) beside its main document" }
    # the guardian renders elsewhere — as the unit's agent — so it is not carried beside the skill
    let carried = (skill $unit $name $src $main (reading $r skills $name) --exclude [$GUARDIAN])
    let guardian = (open --raw ($src | path join $GUARDIAN))
    let at = ($guardian | str index-of $RULE)
    if $at < 0 { stop $"($piece): ($GUARDIAN) has no rule `---` — its body starts after the first" }
    let body = ($guardian | str substring ($at + ($RULE | str length)).. | str trim --left --char "\n")
    let title = (open --raw ($src | path join $main) | lines | where {|l| $l | str starts-with "# " } | get --optional 0 | default "")
    if $title == "" { stop $"($piece): ($main) has no title — the guardian takes it" }
    write ([(unit-dir $unit) agents $"($name).md"] | path join) ((frontmatter $name (reading $r agents $name)) + $"\n($title)\n\n" + $body)
    let refs = ($carried | each {|c| $"| `skills/($name)/($c)` | `($c)` | copied as-is |" } | str join "\n")
    let composition = (if $comp.rule != "" { $"rule: ($comp.rule)" } else { $"list: ($comp.list)" })
    write ([(unit-dir $unit) INVENTORY.md] | path join) (fill (template guardian) {UNIT: $unit, NAME: $name, MAIN: $main, GUARDIAN: $GUARDIAN, REV: (revision), COMPOSITION: $composition, ADDS: $comp.adds, REFS: $refs, SOURCE: (source-of $piece $upper)})
    manifest $unit $version (reading $r units $unit).description $owner
}

# ---------------------------------------------------------------- the destination

# Transformation 8 — one catalog per channel, generated from the instance's units of that
# channel's destination and the units' manifests. Nothing about the channel but the catalog's
# name. A unit that serves the corpus itself enters no catalog.
def catalogs [rows: list<record>, channels: list<record>, catalogue: record]: nothing -> nothing {
    for c in ($channels | where {|c| $c.Destination != $CORPUS_DESTINATION }) {
        let entries = ($rows | where Destination == $c.Destination | get Unit | each {|u|
            let m = (open ([(unit-dir $u) .claude-plugin plugin.json] | path join))
            {name: $u, displayName: ($u | str capitalize), description: $m.description, source: $"./($u)"}
        })
        let cat = {name: $c.Catalogue, owner: $catalogue.owner, metadata: {description: $catalogue.description}, plugins: $entries}
        write ([$env.APPARATUS $DESTINATION $c.Catalogue .claude-plugin marketplace.json] | path join) (($cat | to json --indent 2) + "\n")
    }
}

# A unit served to the corpus is installed as project skills: nothing but skills can go there.
# Rather stop than serve it amputated of an agent, a hook or an agent setting.
def corpus-servable [unit: string]: nothing -> nothing {
    let extra = (ls -a (unit-dir $unit) | get name | each {|n| $n | path basename } | where {|n| $n not-in $CORPUS_CARRIES })
    let m = (open ([(unit-dir $unit) .claude-plugin plugin.json] | path join))
    let wired = ([hooks settings] | where {|k| $k in ($m | columns) })
    if ($extra | is-not-empty) or ($wired | is-not-empty) {
        stop $"($unit) serves ($CORPUS_DESTINATION), installed as project skills — it carries more than skills: ($extra | append $wired | str join ', ')"
    }
}

# The files the instance names for the destination, copied from their source beside it (0. Colophon/).
def destination-files [files: list<record>, dir: path]: nothing -> nothing {
    for f in $files {
        let src = ($dir | path join $f.Source)
        if not ($src | path exists) { stop $"the instance names ($f.File) for the destination, from ($f.Source) — absent" }
        let dst = ([$env.APPARATUS $DESTINATION $f.File] | path join)
        mkdir ($dst | path dirname)
        cp $src $dst
    }
}

# The system's validator, which must pass without warnings (system file, "The gate"): --strict
# turns its warnings into a failure. The plugin-directory checks it prints besides do not
# change the result, and are not this gate.
def validate [unit: string]: nothing -> nothing {
    let r = (^claude plugin validate --strict (unit-dir $unit) | complete)
    if $r.exit_code != 0 {
        print ($r.stdout + $r.stderr)
        stop $"($unit): the validator does not pass clean"
    }
}

# At most one unit of a destination names the session's agent: the system would keep the
# last loaded in silence (system file, "Rendering of natures").
def one-helm [rows: list<record>]: nothing -> nothing {
    let helm = ($rows | each {|r|
        let m = (open ([(unit-dir $r.Unit) .claude-plugin plugin.json] | path join))
        {unit: $r.Unit, destination: $r.Destination, agent: ($m | get --optional settings.agent | default "")}
    } | where agent != "")
    for g in ($helm | group-by destination | transpose dest units) {
        if ($g.units | length) > 1 { stop $"($g.dest): ($g.units.unit | str join ', ') each name the session's agent — one unit per destination holds the main thread" }
    }
}

# Descriptions over the other client's ceiling: reported, since the same skill serves both.
def ceilings [units: list<string>]: nothing -> nothing {
    for u in $units {
        let files = (glob ([(unit-dir $u) "{skills/*/SKILL.md,agents/*.md}"] | path join))
        for f in $files {
            let fm = (open --raw $f | lines | skip 1 | take while {|l| $l != "---" })
            let d = ($fm | where {|l| $l | str starts-with "description: " } | first | str replace "description: " "")
            if ($d | str length) > $OTHER_CEILING { info $"($u): ($f | path basename) description is ($d | str length) characters — over the other client's ($OTHER_CEILING)" }
        }
    }
}

def current-version [unit: string]: nothing -> string {
    let m = ([(unit-dir $unit) .claude-plugin plugin.json] | path join)
    if not ($m | path exists) { stop $"($unit) is packaged for the first time — give it a number: ($unit)=<version>" }
    open $m | get version
}

# A unit's shape, read in its composition and in the natures of its pieces — never in its
# name. « nothing », and whatever the instance says after it, adds nothing; a piece the
# addition names that declares itself a persona makes a carrier; the word guardian, a method
# and its guardian. Anything else is a shape no rendering knows yet.
def shape [unit: string, inst: record]: nothing -> record {
    let comp = ($inst.compositions | get --optional $unit)
    if $comp == null { stop $"($unit): no composition in the instance" }
    let adds = ($comp.adds | str trim)
    if $adds == "" or ($adds | str lowercase | str starts-with "nothing") { return {shape: method} }
    let personas = (named-in $adds | where {|p| (nature-of $p) == persona })
    if ($personas | length) == 1 { return {shape: carrier, persona: $personas.0} }
    if ($personas | length) > 1 { stop $"($unit): its addition names ($personas | length) personas — a carrier carries one: « ($adds) »" }
    if ($adds | str lowercase | str contains "guardian") { return {shape: guardian} }
    stop $"($unit): it adds « ($adds) » — no shape the system file describes renders that"
}

# Regenerate the whole apparatus. Run from the corpus's place.
def main [
    ...bumps: string                         # unit=version, for each unit whose number changes at this passage
    --no-validate                            # skip the system's validator — only to inspect a rendering
] {
    let inst = (read-instance $INSTANCE)
    $env.APPARATUS = $inst.apparatus
    $env.PIECES = $inst.pieces
    let given = ($bumps | each {|b| let p = ($b | split row "="); if ($p | length) != 2 { stop $"not unit=version: ($b)" }; {unit: $p.0, version: $p.1} })
    for g in $given { if $g.unit not-in $inst.units { stop $"($g.unit) is not a unit of the instance" } }
    let versions = ($inst.units | each {|u|
        let g = ($given | where unit == $u)
        {unit: $u, version: (if ($g | is-empty) { current-version $u } else { $g.0.version })}
    })

    if not ($"($SYSTEM).json" | path exists) { stop $"no ($"($SYSTEM).json") beside ($INSTANCE) — the corpus's readings for this system, in the form the system file gives" }
    let readings = (open $"($SYSTEM).json")
    let catalogue = ($readings | get --optional catalogue | default {})
    if ($catalogue | get --optional owner) == null or ($catalogue | get --optional description) == null { stop $"($"($SYSTEM).json") holds no catalogue owner and description" }
    let owner = $catalogue.owner
    for v in $versions {
        rm -rf (unit-dir $v.unit)
        let s = (shape $v.unit $inst)
        match $s.shape {
            carrier => { package-carrier $v.unit $v.version $readings $owner $inst (channel-rows $v.unit $inst.rows $inst.channels) $s.persona }
            guardian => { package-guardian $v.unit $v.version $readings $owner $inst }
            method => { package-method $v.unit $v.version $readings $owner $inst }
        }
        if not $no_validate { validate $v.unit }
        if ($inst.rows | where Unit == $v.unit | get Destination.0) == $CORPUS_DESTINATION { corpus-servable $v.unit }
    }
    ceilings $inst.units
    one-helm $inst.rows

    # what the destination holds besides the units — the home page is DOCUMENT's, kept as it is
    let dest = ([$env.APPARATUS $DESTINATION] | path join)
    if ($dest | path exists) { ls -a $dest | where {|e| ($e.name | path basename) != "README.md" } | each {|e| rm -rf $e.name } | ignore }
    destination-files $inst.files $inst.dir
    catalogs $inst.rows $inst.channels $catalogue

    let summary = ($versions | each {|v| $"($v.unit) ($v.version)" } | str join ", ")
    let served = ($inst.channels | where {|c| $c.Destination != $CORPUS_DESTINATION } | get Catalogue | str join ', ')
    info $"apparatus regenerated in ($inst.apparatus) at corpus revision (revision): ($summary); catalogs: ($served)"
}
