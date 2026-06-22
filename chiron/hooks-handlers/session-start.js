#!/usr/bin/env node
// Chiron SessionStart activation hook (cross-platform).
//
// Three jobs:
//
//   1. Inject the persona on the main thread by emitting agents/chiron.md
//      (frontmatter stripped) on stdout — Claude Code splices it into
//      the session context.
//
//   2. Inject the four grammars in full (Kentauros, Genesis, Praxis,
//      Aisthesis) so Chiron actually *holds* the corpus instead of merely
//      naming it. Skills stay installed for on-demand re-reading; this
//      guarantees the knowledge is present even when the model wouldn't
//      think to invoke them. Costs ~15k tokens per session — deliberate:
//      a methodological companion that hasn't read its own method is a
//      brochure, not a companion.
//
//   3. Deposit ~/.claude/.presence/chiron.json carrying {session_id, name,
//      glyph, scope: "universal"} so the team statusline can render the
//      🐴 glyph alongside any local personas (Saul the Steward, …).

const fs = require('fs');
const path = require('path');
const os = require('os');
const crypto = require('crypto');

const PLUGIN_DIR = process.env.CLAUDE_PLUGIN_ROOT;
if (!PLUGIN_DIR) {
  console.error('CLAUDE_PLUGIN_ROOT is not set');
  process.exit(1);
}

const input = JSON.parse(fs.readFileSync(0, 'utf8'));

const AGENT_FILE = path.join(PLUGIN_DIR, 'agents', 'chiron.md');
const PLUGIN_JSON = path.join(PLUGIN_DIR, '.claude-plugin', 'plugin.json');

// --- Plugin version + content shas ---

const plugin = JSON.parse(fs.readFileSync(PLUGIN_JSON, 'utf8'));
const version = plugin.version;

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

const body = stripFrontmatter(fs.readFileSync(AGENT_FILE, 'utf8'));
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

// --- Grammars: read them, don't just name them ---

// Kentauros first — the collaboration protocol frames how the other three
// are applied. Then Topos (Genesis → Praxis → Aisthesis): structure, then
// action, then readability.
const GRAMMARS = ['kentauros', 'genesis', 'praxis', 'aisthesis'];

function readGrammar(name) {
  const file = path.join(PLUGIN_DIR, 'skills', name, 'SKILL.md');
  if (!fs.existsSync(file)) return null;
  return stripFrontmatter(fs.readFileSync(file, 'utf8')).trim();
}

// --- Output ---

process.stdout.write(`CHIRON ACTIVE — plugin v${version} • body sha ${bodySha} • plugin sha ${pluginSha}\n\n`);
process.stdout.write(body);

process.stdout.write('\n\n--- The grammars you operate by ---\n\n');
process.stdout.write(
  'The four grammars of the tekton corpus follow in full. You have read them — ' +
    'reason from them directly, cite their conventions precisely, and apply them ' +
    'without needing to invoke a skill first. The matching Skills remain available ' +
    'when you want to re-read one in isolation.\n'
);

for (const name of GRAMMARS) {
  const text = readGrammar(name);
  if (!text) continue;
  process.stdout.write(`\n\n${'='.repeat(70)}\n`);
  process.stdout.write(`GRAMMAR — ${name.toUpperCase()}\n`);
  process.stdout.write(`${'='.repeat(70)}\n\n`);
  process.stdout.write(text);
  process.stdout.write('\n');
}

// --- Presence card ---

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
