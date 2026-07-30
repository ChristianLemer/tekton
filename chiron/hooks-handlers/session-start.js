#!/usr/bin/env node
// Chiron SessionStart activation hook (cross-platform).
//
// Invoked once per mode, from several SessionStart entries in plugin.json:
//
//   --persona            Inject the persona on the main thread by emitting
//                        agents/chiron.md (frontmatter stripped) on stdout —
//                        Claude Code splices it into the session context.
//                        Also deposits ~/.claude/.presence/chiron.json carrying
//                        {session_id, name, glyph, scope: "universal"} so the
//                        team statusline can render the 🐴 glyph alongside any
//                        local personas (Saul the Steward, …).
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
const PLUGIN_JSON = path.join(PLUGIN_DIR, '.claude-plugin', 'plugin.json');

// Kentauros first — the collaboration protocol frames how the other three are
// applied. Then Topos (Genesis → Praxis → Aisthesis): structure, then action,
// then readability. Hook entries are declared in this order; each grammar block
// is self-describing so it still reads correctly if the harness reorders them.
const GRAMMARS = ['kentauros', 'genesis', 'praxis', 'aisthesis'];

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

  process.stdout.write(`CHIRON ACTIVE — plugin v${version} • body sha ${bodySha} • plugin sha ${pluginSha}\n\n`);
  process.stdout.write(body);
  process.stdout.write(
    `\n\n--- The grammars you operate by ---\n\n` +
      `The four grammars of the tekton corpus (${GRAMMARS.join(', ')}) are injected ` +
      `in full alongside this card, one per message. You have read them — reason from ` +
      `them directly, cite their conventions precisely, and apply them without needing ` +
      `to invoke a skill first. The matching Skills remain available when you want to ` +
      `re-read one in isolation.\n`
  );

  // Presence card — only in persona mode, so the grammar invocations stay
  // read-only and stdin-free.
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
