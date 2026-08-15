#!/usr/bin/env node
// Chiron SessionStart activation hook (cross-platform).
//
// Invoked once per mode, from several SessionStart entries in plugin.json:
//
//   --persona            Inject the persona on the main thread by emitting
//                        agents/chiron.md (the essence, frontmatter stripped)
//                        followed by agents/activation.md (the conduct) on
//                        stdout — Claude Code splices them into the session
//                        context. Also deposits ~/.claude/.presence/chiron.json
//                        carrying {session_id, name, glyph, scope: "universal"}
//                        so the team statusline can render the 🐴 glyph
//                        alongside any local personas (Saul the Steward, …).
//
// WHY TWO FILES, ONE PAYLOAD — the essence (who Chiron is) and the activation
// (what makes it appear and keeps it there) are separate upstream, because
// merging them is what let a compiler amputate the bootstrap and silently drop
// the welcome card and the 🐴 rule. They ride in a single hook payload because
// the activation must be true at message zero: emitting it separately reopens
// the window where the persona exists without its signature. Together they are
// ~9 KB, well inside the ceiling described below — do not split them.
// Both files are REQUIRED: a persona without conduct is worse than none, so
// this exits non-zero rather than emitting a mute persona.
//
//   --grammar <name>     Inject one grammar (kentauros, genesis, praxis,
//                        aisthesis) in full, so Chiron actually *holds* the
//                        corpus instead of merely naming it. Skills stay
//                        installed for on-demand re-reading; this guarantees
//                        the knowledge is present even when the model wouldn't
//                        think to invoke them. Costs ~15k tokens per session —
//                        deliberate: a methodological companion that hasn't
//                        read its own method is a brochure, not a companion.
//
// WHY ONE MODE PER INVOCATION — Claude Code measures each hook's stdout
// independently, and persists any single output over ~60 KB to a file,
// splicing in only a ~2 KB preview in its place. The persona plus all four
// grammars is ~64 KB, so emitting them together silently truncated mid-persona:
// the session opening card, the 🐴 prefix rule, and every grammar were lost.
// Split across entries, the largest single payload is one grammar (~18 KB) and
// nothing is dropped. Keep it that way — if a grammar ever approaches 60 KB on
// its own, split that grammar rather than merging modes back together.

const fs = require('fs');
const path = require('path');
const os = require('os');
const crypto = require('crypto');

const PLUGIN_DIR = process.env.CLAUDE_PLUGIN_ROOT;
if (!PLUGIN_DIR) {
  console.error('CLAUDE_PLUGIN_ROOT is not set');
  process.exit(1);
}

const AGENT_FILE = path.join(PLUGIN_DIR, 'agents', 'chiron.md');
// Outside agents/ deliberately: the harness scans agents/ and validates every
// file there as an agent definition, and this is not one — it is a payload the
// handler composes onto the persona. Left in agents/ it raises a "no
// frontmatter" warning, and the publish gate fails on warnings, not just errors.
const ACTIVATION_FILE = path.join(PLUGIN_DIR, 'persona', 'activation.md');
const PLUGIN_JSON = path.join(PLUGIN_DIR, '.claude-plugin', 'plugin.json');

const INVENTORY_FILE = path.join(PLUGIN_DIR, 'INVENTORY.md');

// The carrier does not know what it carries — it reads the inventory deposited
// at the package root and injects what it finds, in the order it finds it.
//
// WHY A FILE AND NOT A GLOB OF skills/ — the inventory carries what discovery
// would lose: the load order (deliberate — Kentauros first, because the
// collaboration protocol frames how the others apply) and the reason for an
// absence. Sorting a directory listing would silently invent an order.
//
// WHY NOT A HARD-CODED LIST — the previous `const GRAMMARS` generated the
// phrase "The N grammars…" from its own length, so the count was always right
// and nothing could ever signal a missing grammar. A four-grammar package
// announced itself as a complete package of four; that is how Dialektikē
// stayed out of the payload for three weeks without a single warning.
//
// The inventory's load-order table is the contract:  | 1 | `kentauros` | … |
function readInventory() {
  if (!fs.existsSync(INVENTORY_FILE)) {
    console.error(`no INVENTORY.md at ${INVENTORY_FILE} — the carrier has nothing to read`);
    process.exit(1);
  }
  const rows = [];
  for (const line of fs.readFileSync(INVENTORY_FILE, 'utf8').split('\n')) {
    const m = line.match(/^\|\s*(\d+)\s*\|\s*`([a-z0-9-]+)`\s*\|/);
    if (m) rows.push({ rank: Number(m[1]), name: m[2] });
  }
  if (rows.length === 0) {
    console.error(`no load-order rows in ${INVENTORY_FILE} — expected rows like: | 1 | \`kentauros\` | …`);
    process.exit(1);
  }
  // Ranks must be 1..n with no gap: a hole means a row was hand-edited out, and
  // the inventory is meant to be regenerated rather than maintained.
  rows.sort((a, b) => a.rank - b.rank);
  const contiguous = rows.every((r, i) => r.rank === i + 1);
  if (!contiguous) {
    console.error(`load-order ranks are not contiguous: ${rows.map((r) => r.rank).join(', ')}`);
    process.exit(1);
  }
  return rows.map((r) => r.name);
}

const GRAMMARS = readInventory();

function stripFrontmatter(content) {
  const lines = content.split('\n');
  let count = 0;
  for (let i = 0; i < lines.length; i++) {
    if (lines[i] === '---') {
      count++;
      if (count === 2) return lines.slice(i + 1).join('\n');
    }
  }
  return content;
}

// --- Modes ---

function emitPersona() {
  const version = JSON.parse(fs.readFileSync(PLUGIN_JSON, 'utf8')).version;

  // Essence + conduct. The activation is not optional: a persona that loads
  // without its bootstrap, welcome and signature looks active while being mute,
  // which is the failure this separation exists to prevent. Fail loudly.
  if (!fs.existsSync(ACTIVATION_FILE)) {
    console.error(`activation file not found: ${ACTIVATION_FILE}`);
    process.exit(1);
  }
  const essence = stripFrontmatter(fs.readFileSync(AGENT_FILE, 'utf8')).trim();
  const activation = stripFrontmatter(fs.readFileSync(ACTIVATION_FILE, 'utf8')).trim();
  const body = `${essence}\n\n${activation}\n`;
  const bodySha = crypto.createHash('sha256').update(body).digest('hex').substring(0, 8);

  const EXCLUDED_DIRS = new Set(['.git', '.jj', 'image']);
  function walk(dir, list = []) {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        if (EXCLUDED_DIRS.has(entry.name)) continue;
        walk(full, list);
      } else if (entry.isFile()) {
        list.push(full);
      }
    }
    return list;
  }

  const files = walk(PLUGIN_DIR)
    .map((abs) => ({ rel: path.relative(PLUGIN_DIR, abs).replace(/\\/g, '/'), abs }))
    .sort((a, b) => (a.rel < b.rel ? -1 : a.rel > b.rel ? 1 : 0));

  const combined = crypto.createHash('sha256');
  for (const { rel, abs } of files) {
    const fileSha = crypto.createHash('sha256').update(fs.readFileSync(abs)).digest('hex');
    combined.update(`${fileSha}  ${rel}\n`);
  }
  const pluginSha = combined.digest('hex').substring(0, 8);

  process.stdout.write(`CHIRON ACTIVE — plugin v${version} • body sha ${bodySha} • plugin sha ${pluginSha}\n\n`);
  process.stdout.write(body);
  process.stdout.write(
    `\n\n--- The grammars you operate by ---\n\n` +
      `These ${GRAMMARS.length} grammars of the tekton corpus are injected in full ` +
      `alongside this card, one per message, in this load order: ${GRAMMARS.join(', ')}. ` +
      `They are what this package carries — not the whole corpus, and not a fixed list: ` +
      `read INVENTORY.md at the package root for their provenance and for anything the ` +
      `packaging left out. You have read them — reason from them directly, cite their ` +
      `conventions precisely, and apply them without needing to invoke a skill first. ` +
      `The matching Skills remain available when you want to re-read one in isolation.\n`
  );

  // Presence card — only in persona mode, so the grammar invocations stay
  // read-only and stdin-free.
  //
  // Never let this fail the hook. The persona above is the activation and it
  // has already been written; presence is a convenience on top. A bare parse
  // here made the handler exit 1 whenever stdin was absent or malformed — the
  // whole payload emitted, then a non-zero exit that reads as a failed hook.
  // It also made the handler untestable by hand, which is how the defect hid.
  try {
    const input = JSON.parse(fs.readFileSync(0, 'utf8'));
    const presenceDir = path.join(os.homedir(), '.claude', '.presence');
    fs.mkdirSync(presenceDir, { recursive: true });
    fs.writeFileSync(
      path.join(presenceDir, 'chiron.json'),
      JSON.stringify(
        {
          session_id: input.session_id,
          name: 'chiron',
          glyph: '🐴',
          scope: 'universal',
        },
        null,
        2
      ) + '\n'
    );
  } catch (err) {
    // Diagnostic only: stderr does not affect the hook's exit status.
    console.error(`chiron: presence card skipped (${err.message})`);
  }
}

function emitGrammar(name) {
  if (!GRAMMARS.includes(name)) {
    console.error(`unknown grammar: ${name} (expected one of ${GRAMMARS.join(', ')})`);
    process.exit(1);
  }
  const file = path.join(PLUGIN_DIR, 'skills', name, 'SKILL.md');
  if (!fs.existsSync(file)) {
    console.error(`grammar file not found: ${file}`);
    process.exit(1);
  }
  const text = stripFrontmatter(fs.readFileSync(file, 'utf8')).trim();
  const rule = '='.repeat(70);
  process.stdout.write(
    `${rule}\nCHIRON GRAMMAR — ${name.toUpperCase()} ` +
      `(${GRAMMARS.indexOf(name) + 1} of ${GRAMMARS.length}, in full)\n${rule}\n\n`
  );
  process.stdout.write(text);
  process.stdout.write('\n');
}

// --- Dispatch ---

const argv = process.argv.slice(2);
if (argv[0] === '--persona') {
  emitPersona();
} else if (argv[0] === '--grammar') {
  emitGrammar(argv[1]);
} else {
  console.error('usage: session-start.js --persona | --grammar <name>');
  process.exit(1);
}
