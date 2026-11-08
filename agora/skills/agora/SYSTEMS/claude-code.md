# Claude Code plugins

*What a piece of the corpus becomes when the target system is a Claude Code plugin — and every fact of that system that constrains how a unit is composed, numbered, put into service and compared.*

> **Facts of the system only.** Everything below is verified on installed plugins — the corpus's own units and third-party ones — or on the units already built in the apparatus. A fact that changes is corrected here; a new measure is added here. The scripts that transport, compare and validate for this system live beside this file in the Agora deliverable; they are described, never reproduced.

The nine sections answer the same nine questions as every file in `SYSTEMS/`, in the same order, so that PACKAGE and DEPLOY know where to read.

---

## The unit

**The unit is a plugin: one directory, installed as a whole.** Its manifest is `.claude-plugin/plugin.json`. The system reads the directory by convention — it needs no list of files:

| Path in the unit | What the system does with it |
|---|---|
| `.claude-plugin/plugin.json` | the manifest — name, version, description, author, and the `hooks` the unit registers |
| `skills/<name>/SKILL.md` | one skill per folder; frontmatter `name:` / `description:`; the body is loaded on demand |
| `skills/<name>/<any other file or folder>` | carried with the skill, wherever it sits beside `SKILL.md`; links from the body resolve to it — `references/` is a habit, not a requirement |
| `agents/<name>.md` | every file here is read and validated as a subagent definition |
| `commands/` | slash commands; exists in the system, used by no unit of this corpus |
| `hooks-handlers/` | the carrier's activation code, invoked by the `hooks` entries of the manifest |
| `persona/` | the carrier's conduct payload — a folder of this corpus, invisible to the system |
| `INVENTORY.md` | a rendering written by PACKAGE and read at runtime by the carrier; invisible to the system |

**The catalog** that references units is a repository carrying `.claude-plugin/marketplace.json`. It names the catalog and its owner, and lists each plugin with a relative `source` (`./<unit>`). The catalog is the destination of DEPLOY; the units sit in it as sibling folders.

**A channel is a head of the catalog repository.** A consumer registers a catalog as a repository plus a reference to one of its heads, and the catalog takes the name its `marketplace.json` gives on that head — measured: one repository, one branch per channel, each branch's `marketplace.json` naming its catalog. Serving a version to all rather than to a few is therefore putting the same unit on another head; nothing in the unit changes. Which heads exist and whom each serves is declared once, in the instance's channels — never here, and never in a unit.

**Installation copies the unit into a cache keyed by version** — `<cache>/<catalog>/<unit>/<version>/` — and records, per installed plugin, its version, its install path and the commit identifier of the catalog at install time. The cached copy is what the consumer runs; the catalog is re-read, the unit is not.

**The home page** of a head is its root `README.md` — what a human reads on arriving at the repository: what it offers, where to start, how to install — and that one channel is installed, never both: the same components under two catalogs collide. DOCUMENT writes it into the apparatus; it is carried like the rest, never edited at the destination.

**The rules of an agent started at the destination** are its root `AGENTS.md` — which the system loads at start (measured) — a destination file written from the template `templates/destination-agents.md`: the repository is generated, nothing is edited or run there, and what is done there is committing and pushing what DEPLOY aligned.

**In the apparatus**, what a head holds besides the units sits in one folder:

```
<apparatus>/
├── <unit>/                     ← one per unit of the instance
└── _destination/
    ├── README.md               ← the home page — DOCUMENT's
    ├── <file>                  ← each destination file the instance names, copied — LICENSE, AGENTS.md
    └── <catalog>/.claude-plugin/marketplace.json   ← one per channel, generated
```

The image of a head is the units, the files of `_destination/`, and that head's catalog at the root. The apparatus's own `README.md`, for whoever opens the folder, is not carried.

**One unit per carrier, plus what reads without a carrier.** A unit takes one of three shapes, read in its composition and in the natures its pieces declare — never in its name:

| Shape | Recognised by | Becomes |
|---|---|---|
| **method** | one piece that declares itself a method — or a grammar, which renders alike; the composition adds nothing | one skill — or one per profile when the deliverable is partitioned into profiles, each with its own presentation; no agent, no hook |
| **method and its guardian** | one piece that declares itself a method; the composition adds a guardian | the skill, without the guardian; the guardian as the unit's agent, dispatchable only — no agent setting, no hook |
| **carrier** | a rule that selects grammars; the composition adds a piece that declares itself a persona | one skill per grammar, in the corpus's reading order; the persona as the session's agent (`settings.agent`); its conduct injected by one `SessionStart` hook entry |

A unit more of one of these shapes is a line more in the instance, nothing in the scripts. A shape more — a persona dispatched without holding the main thread, a method carrying grammars — is a rendering more, described here first; until then `package.nu` stops on it and names it. Which pieces form which unit, and in what order they are read, is an instance decision, declared in the instance — never here, and never in the scripts.

**A piece's nature is read in its README**: the *Nature* line of its *État* or *Status* section, its first word, recognised through Agora's lexicon — *grammar*, *method*, *persona* and their translations. A rule (« every grammar of the families … ») selects the pieces of the families it names that declare that nature. A nature absent, or one the lexicon does not know, stops the passage.

**The unit carries its inventory, not its generator.** Whoever receives it can read what composes it (`INVENTORY.md`); nobody can rebuild it from the unit alone. Regenerability is a property of the chain corpus → apparatus → destination, never of a served unit.

---

## Rendering of natures

| Nature | Becomes | Composed of |
|---|---|---|
| **grammar** | one skill `skills/<name>/` | `SKILL.md` = frontmatter + the deliverable's main document; **everything else the deliverable carries** beside it, at its place, as-is — the lexicon at the root if it is there, `references/` if the deliverable has one, folders of gestures or templates. Only the main document is renamed: `SKILL.md` is a name of the system, which the piece need not carry |
| **method** | one skill — or one skill per profile when the deliverable is partitioned into profiles, each with its own presentation | the same shape and the same rule as a grammar |
| **persona** | an agent file `agents/<name>.md`; when the persona must hold the main thread, the manifest names it under `settings.agent` | the agent file renders the essence, opened by an address derived from the persona's own title and subtitle; what the persona must have present at session start — its conduct, the grammars it carries — arrives by a `SessionStart` hook entry per payload, under the ceiling below |

**Two regimes for a persona, and the manifest decides which.** A file in `agents/` is a *subagent*: dispatched on demand, never present at message zero. A persona that must be active from the first reply — bootstrap, welcome, signature — is named by `settings.agent` in the manifest (`"<unit>:<agent>"`): the system makes it the session's agent from the first reply, without a launch option and without a hook, and its text replaces the default system prompt. Measured on version 2.1.301, twice; a `settings.json` at the plugin root takes precedence over the manifest key; what wins against an `agent` the user set themselves is not measured. **Two plugins that each name a `settings.agent`: the last loaded wins, silently** — measured on version 2.1.308, the winner following the load order; both units' `SessionStart` hooks still run and both payloads enter the context. The load order among installed plugins is not measured. The companion persona is the session's agent; the guardian of a method is dispatchable only. Since the last loaded wins in silence, **at most one unit of a destination names a `settings.agent`**: `package.nu` stops when two do, naming both.

**Every agent of a unit is also a dispatchable subagent** — the one `settings.agent` names included. The system dispatches on its own, reading the agent's `description:`; no field of the agent file or of the manifest withholds an agent from dispatch, and a plugin's settings accept only the agent key — a deny rule (`permissions.deny`, `Agent(<name>)`) can be set only in the user's or the project's settings. Read in the system's documentation, not measured. **The one lever left to the unit is the description**: for a persona that holds the main thread, it keeps the boundary of its presentation — when it does not serve —, which is what holds the system back from dispatching it out of place. An influence, not a guarantee; the unit's inventory states it as a limit.

**What a hook still does, and what `skills:` does not.** The agent file alone brings no body with it: the `skills:` field of its frontmatter hands the agent the listed skills' *descriptions*, not their content — measured twice, against what the documentation states. A body that must be present at session start — a conduct, a grammar — still arrives by a `SessionStart` hook, one entry per payload, under the ceiling below. Which bodies travel that way is a composition decision of the instance, not of this file.

**What a `SessionStart` hook receives, and what it can show.** Measured on version 2.1.308, with two probe plugins:

- **The payload arrives on standard input**, one JSON object: `session_id`, `transcript_path`, `cwd`, `hook_event_name` (`SessionStart`), `source` (`startup`, `resume`, …) and `agent_type` — the session's agent, as `<unit>:<agent>`. A handler run by hand receives none, unless one is forged. The hook runs again when a session is resumed, `source` then being `resume`.
- **The environment does not tell a session from a test.** The system sets `CLAUDE_CODE_SESSION_ID` for the hook, but the variable is inherited by the agent's own processes: a test run from a live session carries that session's id.
- **Three outputs, three readers.** Standard output goes to the model, never to the screen. A JSON object carrying `systemMessage` is shown to the user, one line per hook (*SessionStart:startup says: …*). The standard error of a hook that succeeds is not shown.
- **Enablement is spread.** A plugin is active by `enabledPlugins`, read in the user's settings, the project's and the local ones — later overriding earlier; a launch flag or managed settings can also decide, and cannot be read from a file. Installation is recorded apart, in `~/.claude/plugins/installed_plugins.json`: per plugin (`<unit>@<catalog>`), its scope — the user, or a project and its path —, its install folder and its version.

**Why the conduct lives in `persona/` and not `agents/`.** The system validates every file under `agents/` as an agent definition. A conduct payload has no frontmatter and is not an agent: placed there, the validator warns (*"No frontmatter block found"*), and the gate fails on warnings. `persona/` is a folder the system ignores; the carrier reads it by its own path.

**One rule for grammar and method, because publication is a complete copy.** The rendering does not sort what travels: a piece that does not want a document to travel removes it from its deliverable, through its cycle. *What verification reads:* every file of the deliverable, minus the exclusions below, is found at the same place in the skill — no more, no less. Placement is a promise of use the author made; rendering does not undo it, and the body's links resolve without rewriting.

**The marks a persona and a guardian carry.** Where rendering cuts, and what it derives the address and the title from, is a convention of this system — not a fact each piece declares its own way, and never a sentence written in a script. ADMIT hands it to the author with the three declarations:

| Mark | Where | What packaging does with it |
|---|---|---|
| the title, and the italic subtitle under it | head of the persona's main document | the agent's address: *You are <title> — <subtitle>* |
| the first `## ` | the persona's main document | the start of the essence; what precedes it is not carried |
| `ACTIVATION.md`, and its first heading starting `## 1.` | beside the persona's main document | the start of the injected conduct |
| `GUARDIAN.md` | beside the method's main document | the guardian: its body starts after the first rule `---`; its title is the main document's |

A mark missing stops the passage, named.

**What has no place in this system:**

- a piece's workshop, in whole — only the deliverable renders;
- the deliverable's presentation (`ABOUT.md`) — consumed for metadata, never carried;
- the deliverable's `README.md`, where it has one — the hub for whoever opens the folder;
- what another nature renders elsewhere — a method's guardian, which becomes an agent;
- the conduct's opening sections — those that explain the essence/conduct split to whoever packages, rather than instruct the agent. The boundary is the first executable heading;
- any hook event other than `SessionStart` — none is used.

---

## Metadata

The system imposes keys; the presentation (`ABOUT.md`, two texts: *what this is about* and *when it serves*) is where they derive from. The mapping lives here and nowhere else, so that the source stays generic.

**The system reads descriptions alone, at every turn**, to decide whether to open a skill or dispatch an agent; the body is read only after that decision. The description is therefore the text written for whoever decides to open — *when it serves* — and nothing else: what the piece is about is read once opened, in the body. A description that compresses the object instead of the occasions produces a skill that is installed and never present. **Compression keeps the boundary** when the presentation draws one — *when it does not serve, and who takes over*: dropped, the piece claims every nearby case, and an agent gets dispatched where it should not.

| Key | File | Derives from | Regime |
|---|---|---|---|
| `name:` | `SKILL.md`, `agents/<name>.md` | the deliverable's name, lowercase ASCII | derived, mechanical |
| `description:` | `SKILL.md`, `agents/<name>.md` | *when it serves*, **compressed** — the occasions that call the piece, and its boundary when it has one, in one paragraph; the object stays in the body | derived by reading — never authored at the unit |
| `name` | `plugin.json` | the unit's name, as the instance declares it | from the instance |
| `version` | `plugin.json` | nothing upstream — decided at the gate (see *The number*) | decided |
| `description` | `plugin.json` | the carrying piece's `ABOUT.md`, both texts compressed shorter still — a catalog entry is read by a human choosing what to install | derived by reading |
| `author` | `plugin.json` | the catalog's owner — constant across the catalog's units; no piece carries it | from the readings file |
| `settings.agent` | `plugin.json` | the unit's main-thread persona, when it has one — `"<unit>:<agent>"` | from the instance |
| `hooks` | `plugin.json` | the inventory's load order — one entry per payload injected at session start | generated |
| `name`, `owner` | `marketplace.json` | the channel's catalog name, from the instance; the catalog's owner | from the instance; from the readings file |
| `plugins[]` | `marketplace.json` | one entry per unit the head carries once aligned — a unit more is a line more in the instance; each entry from the manifest of the unit that head serves | generated, then filtered at transport |
| `plugins[].name`, `source` | `marketplace.json` | the unit's name; `./<unit>` | from the instance |
| `plugins[].description`, `displayName` | `marketplace.json` | the unit's `plugin.json` description; its name, capitalised. **Nothing about the channel** — the catalog's name says it, and a sentence about the channel would differ from one head to the other while the unit does not | generated |
| `metadata.description` | `marketplace.json` | the catalog's purpose, the same on every head; the validator warns when it is absent | from the readings file |

**The readings file.** What a corpus has read for this system belongs to that corpus, not to this method: it is kept at the head of the corpus's place, beside the instance, in `claude-code.json` — named after this file, and never renamed. `package.nu` reads it there, and stops when it is absent or lacks what a unit asks for. It is keyed by what is read, so that a piece keeps its description when it changes unit:

```json
{
  "catalogue": { "owner": { "name": "<owner>", "url": "<url>" }, "description": "<the catalog's purpose>" },
  "units":  { "<unit>": { "description": "<both texts, compressed>", "glyph": "<a persona's glyph, when the unit carries one>" } },
  "skills": { "<skill>": "<when it serves, compressed, its boundary kept>" },
  "agents": { "<agent>": "<when it serves, compressed, its boundary kept>" }
}
```

PACKAGE writes it at its derivation step, when an `ABOUT.md` has moved, and rereads it against each `ABOUT.md` at every passage.

**Compression is a derivation, not a redaction.** A `description:` that says what `ABOUT.md` does not say is content born at the unit, hence not regenerable. The test for every key: *would a rule produce this value from the source?* If yes, it is a transformation. If no, the sentence goes up to the source and comes back down by derivation.

**Optional keys the system accepts and no unit of this corpus derives:** `license:` on a skill; `model:`, `color:`, `tools:` on an agent; `homepage`, `repository`, `license`, `keywords`, `lspServers` in `plugin.json`; `license`, `homepage`, `repository` on a catalog entry. None derives from a presentation; a unit sets one only if the instance says so.

**The form of a frontmatter is fixed, because a comparison needs one.** Values are written bare, single-quoted only when they contain a colon followed by a space — the one case the parser requires; the body starts on the line after the closing `---`, with no blank line. Both quoted and bare values parse, and served units have carried both: the rule exists so that two renderings of the same source are byte-identical.

---

## Declared transformations

What the rendering changes relative to the deliverable, and nothing else. Each one is replayable by a rule and verifiable by a comparison.

| # | Transformation | Replay | Verify |
|---|---|---|---|
| 1 | **Name mapping** — folder and `name:` are the deliverable's name in lowercase ASCII; diacritics drop (`Dialektikē` → `dialektike`) | apply the mapping | the mapped name equals the written name |
| 2 | **Frontmatter prepended** to a skill — the main document has none; the skill gets `name:` and `description:` | prepend | the body after the second `---` equals the main document, byte for byte |
| 3 | **Description compressed** from `ABOUT.md` | *not mechanical* — a reading | by reading: nothing in it that the presentation does not say |
| 4 | **Address shift** — an agent file opens by addressing the agent it instantiates (*"You are …"*), and the address derives from the persona: its title and the italic subtitle under it, at the head of its main document — *You are <title> — <subtitle>*. Verified on every agent file of installed plugins, this corpus's and others' | derive from title and subtitle | the essence body from its first section heading onward equals the source; the address equals the rule applied to title and subtitle |
| 5 | **Conduct cut at the first executable heading** — the sections that explain the split to whoever packages are dropped. The heading is the first of `ACTIVATION.md` starting `## 1.` — the system's mark | cut there | the conduct body from that heading onward equals the source |
| 6 | **Manifest generated** from the inventory — `settings.agent` when the unit has a main-thread persona; one `SessionStart` entry per payload injected at session start, in load order, each a `command` hook invoking the handler with `${CLAUDE_PLUGIN_ROOT}`, a five-second timeout and a status message | regenerate | regenerate and diff: zero lines |
| 7 | **Everything else the deliverable carries copied beside `SKILL.md`**, as-is, each at its place in the deliverable | copy | recursive diff against the deliverable, minus the exclusions: zero lines |
| 8 | **Catalog generated** per channel from the instance's units and the units' manifests | regenerate | regenerate and diff: zero lines |

**And nothing else.** The body is copied verbatim: no substitution (`C` stays `C` — the skills of the same unit keep it, with numbered instructions, and nothing breaks), no reflow, no link rewriting (links resolve because the deliverable's tree travels as it is), no added sentence. *A transformation may change who is addressed; it may not add what the source does not say.*

**The marks are the system's, the content the persona's.** Where rendering cuts and what it derives the address from — title and subtitle, the start of the essence, the start of the conduct — follow the marks above; the persona carries them, and `package.nu` finds them or stops, naming the one missing. It never falls back on a sentence of its own: an address written in a script is persona content without a source.

**The persona is verifiable like a skill because of 4 and 5.** The carrier concatenates essence (frontmatter stripped) and conduct into one payload at session start; each half equals its source from its first body heading onward. A rule that would shift only "clauses addressing the agent" is a reading judgment — no tool can replay it, so it is not a transformation of this system.

---

## Limits

**Injection by hook is what carries a body into the context at session start, and it is measured per hook.** The agent's `skills:` field carries descriptions only (see above). The system measures each hook's standard output separately. Past **10 000 characters** — the documented cap; an earlier measure of roughly 60 KB no longer holds — a single output is persisted to a file and only a **~2 KB preview** is spliced into the context. The context then shows « Output too large » with the file path; nothing else signals it, and the agent runs on the preview. Hence: **one payload per hook entry, never merged**, and no payload above the cap.

Order of magnitude, measured on a served unit: five grammars between 7 and 23 KB each, plus a persona payload of 10 KB — about **88 KB per session** if everything arrived. Under the cap as it stands, only payloads under 10 000 characters arrive whole: on the served unit, one grammar of five. The exact figures belong to the unit's inventory, not here; the consequence belongs to REVIEW — a composition whose payloads exceed the cap is not carried, whatever the manifest says.

**The cost follows the composition without anyone deciding it.** An attachment rule that admits every new grammar of a family adds a payload per grammar. REVIEW shows the sum when the rule brings a piece in; what is discussed when the sum hurts is *which grammars the carrier takes*, not how it loads them.

**Other facts that constrain composition:**

- **Names are lowercase ASCII** (`[a-z0-9-]`). A system that cannot carry a character decides the spelling, not the corpus.
- **`agents/` is scanned.** Every file there is validated as an agent; a file without frontmatter warns. Anything that is not an agent lives elsewhere.
- **No field withholds an agent from automatic dispatch** (see *Rendering of natures*): only its description can, by its boundary — an influence, not a guarantee.
- **The handler must find its files.** It exits non-zero rather than emit a persona without its conduct, and refuses an inventory whose load-order ranks are not contiguous `1..n` — a hole means a hand edit.
- **The handler writes one thing, and only under a real session.** A statusline shows, in each session, the glyph of the personas it carries, by reading the presence cards of a shared folder and keeping those of its session. The handler deposits one card per session — `~/.claude/.presence/<unit>-<session_id>.json` — so no shared file is ever rewritten: two live sessions do not overwrite each other, and a test touches nobody's card. It writes only when standard input carries the session payload (`session_id`, `hook_event_name` `SessionStart`); the environment does not count, since a test inherits it. A session id that is not letters, digits and dashes names no file — the card does not leave its folder. Run by hand, it emits and writes nothing. The unit's cards older than a few days are removed at start — a resumed session rewrites its own. The card never fails the hook, and the handler's header says what it writes, where, and when.
- **One channel at a time.** The format has no exclusivity field — neither `plugin.json` nor `marketplace.json` — so nothing prevents enabling the same unit from two catalogs, each injecting its conduct while one agent wins silently. The one executed guard is the handler. It looks for its **twin**: the same unit under another catalog of its destination, installed for a scope that covers the session — the user, or the session's project — and enabled. A unit installed but disabled is no twin. Both handlers run without seeing each other, so the rule is symmetric and each reaches it alone: **the copy whose catalog serves all stands down for the one that serves a few** — it emits nothing to the model and shows the user a `systemMessage` naming both catalogs; the copy that serves a few emits without a word, since the other says it; two catalogs with the same role both emit, and both say so. To read the roles, the unit carries **its destination's channels** — catalog, and whom it serves — written by PACKAGE into the inventory from the instance; the same on every head, so the unit stays byte-identical from one channel to the other. Out of reach, stated as such: a twin enabled by a launch flag or managed settings is not seen; and the session's agent may come from the copy that stood down, since nothing tells the handler which was loaded last.
- **Hook timeout** is declared per entry (five seconds on served units); a handler that reads a few files stays far under it.
- **Skill descriptions have no ceiling in this system.** Another client that reads the same units refuses a description past 1 024 characters; the packaging script reports it, since the same skill serves both.
- **The validator checks form, not identity.** `claude plugin validate` says the manifest parses and the keys are known; it does not say the body is the one intended. A green gate never replaces a diff.
- **Nothing named crosses.** No organisation, study, client or visual identifier, and no machine path, in anything the unit carries. The system does not check this; a sweep over a list of terms does, and the list is knowledge the operator holds.

---

## The number

**One place: `version` in `plugin.json`.** It is the unit that gets installed, hence cached, hence the one whose number says *reload*.

| Place | Regime |
|---|---|
| `<unit>/.claude-plugin/plugin.json` → `version` | **the only one** |
| `marketplace.json` → `metadata.version` | never — optional, nothing consumes it; the catalog is re-read on every refresh and an added plugin is seen without it. On installed catalogs, none sets it |
| `marketplace.json` → `plugins[].version` | never — it would double `plugin.json` for the same unit. Declared at both places, the validator warns and states that **`plugin.json` wins and the entry's value is silently ignored** |
| the unit in the apparatus | the same number — a reflection, not a duplicate: a source must say what it produces |
| the instance, any workshop document | none — a copied number is an inventory, and an inventory fails silently |
| a skill | none — `name:` and `description:` only; it travels inside its unit |

**The number is the cache key.** The consumer stores `<catalog>/<unit>/<version>/`. A consumer holding version *n* does not fetch again while the catalog serves *n*, whatever its content — so **a served number is consumed, definitively**, and a changed content under an unchanged number reaches nobody and signals nothing.

**The reference for a bump is the head the consumers read**, not the previous passage and not the apparatus. That head is read at the destination (see *The gate*), never assumed here. Ten passages that never reach the served head cost one number; once the working head *is* the served head, every passage that changes what the agent reads is a release and owes its number.

**The number is bare** — `0.0.9`, never `0.0.9-beta`. Whom a version is served to is a fact of distribution, not of content: going to all does not change the number, it is the same unit on another head.

**The carrier reads the number at runtime** from `plugin.json` and prints it in its activation line, with a digest of the payload and of the whole unit — the one place feeds the one display. **The channel is shown beside it, where it is read:** the install folder is `<cache>/<catalog>/<unit>/<version>/` (measured), so the carrier takes the catalog's name from its own root and prints `v0.0.9 @<catalog>`. A client whose install folder does not name the catalog — another client reading the same units, not measured — prints the number alone: one fact fewer, never a wrong one.

**What counts as a change** is what the agent reads; the minor/major line is the human's call at the moment of the bump. This file only fixes where the number lives and what it is compared against.

---

## The gate

**The destination is the catalog repository**, one head per channel. A unit reaches it as a folder beside `.claude-plugin/marketplace.json`; the apparatus is the complete image of what a head holds — units, catalog, home page, and the files the instance names.

**How a consumer reads it.** A consumer registers the catalog with a *source kind* and a *location* — a hosted repository with a reference to one of its heads, or a directory on a mounted drive. Which head serves whom is declared in the instance's channels; which head a consumer reads is in its registration — **never written in this file**, because a head can be renamed without any decision of the corpus moving.

**Transport — what `deploy.nu` does.** For one channel:

- reaches the working copy of that channel's head through `AGORA_DESTINATION`, with a default under the home directory named after the destination as the instance writes it (`~/<destination>`) — **never a machine path**: a path dies with a change of machine;
- carries **the units the review sent to this channel**, named at the call — nothing leaves by default; the other units on that head stay as they are served;
- checks, before anything, that the working copy is **on the channel's head** and **clean** — nothing modified, nothing pending: it does not align over work in progress;
- compares the apparatus to the working copy (see *The comparison*), and refuses a served number under another content;
- runs **dry by default**; an explicit flag applies a **complete synchronisation with deletion** of what version control tracks — whatever the head tracks without coming from the apparatus is shown first, then removed;
- reads the destination **through version control, never the disk**: the clean check sees nothing that is ignored, so what is ignored is named and never touched — and an ignore file is not removed while it still hides something, which its removal would leave one `git add` from published;
- **versions nothing and archives nothing.** It aligns the working copy and reports what remains to commit and push; committing and pushing are the operator's — push is conscious, and pushing to the head that serves all waits for the author's word; the trial head is free. The corpus's own repository is the home of the source, not the distribution channel.

**The corpus itself, as a destination.** A unit that serves only the corpus producing it — the workshop's tool rather than its product — has `this corpus` as its destination in the instance, and a channel row with no catalog and no head. It enters no catalog. `deploy.nu corpus <unit>` serves it to the working copy it runs from:

- **as project skills** — each skill of the unit in `.claude/skills/<skill>/` at **the root of the repository that holds the corpus**, which the system loads (measured, version 2.1.308). The system reads project skills in the folder a session starts from and in every folder above it (measured, same version): the repository root is the one place that serves wherever the agent starts — not the corpus's place, which need not be that root. `deploy.nu` takes the target as given, by default the root of the git repository it runs in. That folder holds skills and nothing else: a unit carrying an agent, hooks or an agent setting cannot be served this way, and `package.nu` stops rather than serve it amputated;
- **in a folder version control ignores**, by design: serving a unit is an installation, and each working copy serves itself. The clean check has no hold there; a **bound** takes its place — nothing is written or removed outside the folder of each skill the unit carries, and whatever else `.claude/` holds is left alone;
- **with no number consumed** — nothing caches by version; the copy is read as it is. The refusal of a served number has no object; the four-way comparison, dry by default, stays. A skill the unit stops carrying is not removed by side effect: the bound does not know it.

**What precedes putting into service, in order:**

| Step | Gesture | Check |
|---|---|---|
| 1 | PACKAGE | `claude plugin validate --strict <unit>` exits clean — strict turns warnings into failures, and a warning (a version declared twice, a stray file in `agents/`) is exactly what must be caught. The validator also prints the checks of a public plugin directory (a README, a licence, an icon per plugin); measured on version 2.1.308, they do not change the result, and they are not this gate. The gate belongs to packaging: refuse rather than produce a broken unit |
| 2 | PACKAGE | freshness — by construction: every passage regenerates the whole apparatus from the deliverables (see *The comparison*) |
| 3 | DEPLOY | the working copy is on the channel's head, and clean |
| 4 | DEPLOY | the four-way comparison, apparatus against destination |
| 5 | DEPLOY | **bump before transport** — refuse when a number already served, on this head or another, comes with another content: same number, two contents is the collision the validator cannot see |
| 6 | DEPLOY | transport, dry-run read, then applied |

**Two scripts, beside this file — and no other.** `package.nu` regenerates the whole apparatus from the deliverables and the instance — each unit's selection resolved from its composition and ordered by the instance's reading order, the units with the declared transformations and nothing else, their manifests, each channel's catalog — listing the units of that channel's destination only —, the files the instance names — runs the validator, and reports descriptions over the other client's ceiling; its inventory templates — one per shape — sit beside it; the descriptions read from each `ABOUT.md` sit with the corpus, in its readings file. `deploy.nu` is the transport above, with its checks — to a channel of the catalog repository, or to the corpus itself. The validator is the system's own command.

---

## The comparison

**Two properties, not one.** A unit can be regenerable and stale at the same time; the two checks see different defects.

| Property | What it guarantees | What it does not say | Checked by |
|---|---|---|---|
| **regenerable** | nothing was born at the destination | that what matured upstream followed | apparatus ↔ destination |
| **fresh** | each carried body equals its deliverable | that nothing was added at the destination | by construction — `package.nu` regenerates every unit at each passage; the apparatus's diff in version control shows what moved |

**Freshness — deliverable ↔ unit.** Regeneration is the check: an apparatus rebuilt from the deliverables cannot carry an older body. What remains to compare is the apparatus as committed against the apparatus regenerated — any line of difference means a passage was skipped. A body compared by size would say identical where a single word changed; a regeneration does not.

**Regenerability — apparatus ↔ destination, four cases in this order:**

| # | Case | Meaning |
|---|---|---|
| 1 | in the apparatus, absent at the destination | the unit gained something — to carry |
| 2 | at the destination, absent from the apparatus | **the dangerous case**: born at the destination, hence sourceless — goes *up* to a deliverable, then comes back by derivation; never copied down |
| 3 | present on both sides, different | decided piece by piece |
| 4 | different, **and the destination has authority** | normal — nothing to do |

**Case 4 contains what has no upstream source by decision:**

- the **version** — packaging does not version; seeing it differ is the circuit working, not a drift. Reading it as a defect produces a false positive at every release, and false positives are how a comparison stops being read;
- the **author block** — the catalog's owner, not a piece's; kept in the corpus's readings file, it is regenerated like the rest and compares equal.

The carrier's handler code and the catalog are not in case 4 any more: both have a source in this deliverable and the instance, and compare equal when the apparatus is fresh.

**What is compared is the destination's working head, not a guess at it.** The unit that will be served is the one at the destination on its current head; the apparatus may carry a number behind it without defect — it is not what is served. But the decided number comes back down to the apparatus, or the source stops saying what it produces.

**The destination distributes; it is not worked in.** Nothing is written or run there: what a head holds comes from the apparatus, and the only act there is committing and pushing. What a head tracks without coming from the apparatus is a remnant of a time it was worked in — a tool, a check that runs on push, an agent's rules, an ignore file — or a text retouched in place. The dry run names it; what still serves goes *up* before the alignment — to the tooling beside this file if it equips a gesture, to a destination file if it must be served — and the applied alignment removes what remains. **The public repository is the only output:** consumers install from it, and no copy leaves for anywhere else. Another output would be another destination, declared in the instance — never a tool set beside the first.

---

## The threshold

*How the system enters a piece of the corpus.* The sections above concern the unit this file helps produce; this one concerns the source — what the system reads when an agent is started inside a piece, and what form a piece's declared method takes for it.

**What the system reads when started in a piece.** Verified on a piece of this corpus, and confirmed by the system's documentation:

- **Instructions go up.** Started in a subfolder, the system loads at start every `AGENTS.md` of the current folder and of the folders above it — provided no `CLAUDE.md` exists above. An `AGENTS.md` in a subfolder loads when the agent opens a file there.
- **Settings do not.** The shared settings `.claude/settings.json` are read in the starting folder only; the repository root's are not read from a subfolder. Verified: a piece carrying its own settings, enabling the unit of its method, had the skill available while neither the user's settings nor the root's enabled it.
- **Writing is bounded** to the starting folder, unless folders are added at launch.

**The executable form of a declared method.** A piece whose README declares the method it follows also carries, at its root:

| File | Committed | Says |
|---|---|---|
| `AGENTS.md` | yes | which skill to load before any gesture — `<unit>:<skill>` |
| `.claude/settings.json` | yes | the unit that carries that skill, enabled — `"enabledPlugins": { "<unit>@<catalog>": true }` |

Local settings (`.claude/settings.local.json`) and the user's do not count: they do not travel with the piece. The declared method leads to its unit through the instance's composition, and to its skill's name through transformation n°1.

**The same form, one floor up, for a workspace that keeps a corpus.** Its README names Agora among the methods it follows and says where the corpus's place is; its root `AGENTS.md` says to load the skill `agora` before any gesture on the corpus. What makes the skill available is the unit served to the corpus itself — project skills at the repository root, read wherever a session starts below it (*The corpus itself, as a destination*). Instructions go up, so a session started in a piece receives both: its own method, and the corpus's.

**Two places for two readers — the duplicate name is deliberate.** The README says *which* method, to whoever opens the piece to understand it; `AGENTS.md` says *what to do*, to whoever acts in it. The README stays the authority; these are its executed form, and QUALIFY reads that the declared method, the named skill and the enabled unit agree.

---

*One system, nine questions. A fact of this system is verified on an installation, never deduced from the system's silence.*
