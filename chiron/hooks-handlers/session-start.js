#!/usr/bin/env node
// Chiron SessionStart activation hook (cross-platform).
//
// Reads agents/chiron.md, strips the YAML frontmatter, emits the body as
// plain text on stdout. Claude Code injects this into the main thread
// context at session start.
//
// Single source of truth: edits to agents/chiron.md propagate automatically
// to the next session — no hardcoded duplication to go stale.
//
// The activation header carries verification signals (version + content
// shas) for technical inspection. The welcome is composed by chiron itself
// — this hook supplies a curated palette (template tones + Greek fragments),
// chiron picks what resonates and comments briefly on its choice.

const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const PLUGIN_DIR = process.env.CLAUDE_PLUGIN_ROOT;
if (!PLUGIN_DIR) {
  console.error('CLAUDE_PLUGIN_ROOT is not set');
  process.exit(1);
}

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

// --- Welcome palette (chiron picks, integrates, comments) ---

const TEMPLATES = JSON.parse(fs.readFileSync(path.join(PLUGIN_DIR, 'data', 'templates.json'), 'utf8'));

const QUOTES = JSON.parse(fs.readFileSync(path.join(PLUGIN_DIR, 'data', 'greek-fragments.json'), 'utf8'));

// --- Output ---

process.stdout.write(`CHIRON ACTIVE — plugin v${version} • body sha ${bodySha} • plugin sha ${pluginSha}\n\n`);
process.stdout.write(body);

// Random pick happens in the script (not on chiron's side) so the variation
// is real across sessions. With prompt caching + LLM bias toward same answers
// on identical context, leaving the pick to chiron produced the same combo
// each time. Script-side Math.random() guarantees genuine session variation.

const pick = (arr) => arr[Math.floor(Math.random() * arr.length)];
const template = pick(TEMPLATES);
const quote = pick(QUOTES);

process.stdout.write('\n\n--- Welcome guidance for this session ---\n\n');
process.stdout.write('The hook has chosen one template and one Greek fragment for this session. Use them:\n\n');
process.stdout.write(`Template (${template.tone}):\n`);
process.stdout.write(`  greeting:   "${template.greeting}"\n`);
process.stdout.write(`  invitation: "${template.invitation}"\n\n`);
process.stdout.write('Greek fragment:\n');
process.stdout.write(`  greek:   ${quote.greek}\n`);
process.stdout.write(`  english: ${quote.english}\n`);
process.stdout.write(`  author:  ${quote.author}\n`);
process.stdout.write('\nCompose the welcome with this layout — the fragment opens, commentary frames, *then* chiron arrives:\n\n');
process.stdout.write('  <greek>\n  <english>\n  — <author>\n\n  <one-sentence commentary on why this fragment is on your tongue today — earned, not generic>\n\n  🐴 <greeting>\n\n  <invitation>\n');
