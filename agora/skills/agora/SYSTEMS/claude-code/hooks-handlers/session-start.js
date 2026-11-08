#!/usr/bin/env node
// SessionStart handler — carried into a unit by PACKAGE, invoked by the manifest.
//
// The persona holds the main thread by `settings.agent` in the manifest: its
// essence (agents/<name>.md) is the session's system prompt from the first reply.
// What that leaves to a hook is the conduct — persona/activation.md — which must
// be true at message zero and which the agent file alone does not bring.
//
//   --conduct            Emit the conduct payload on stdout, under a card that
//                        names the unit version, the channel it was installed from
//                        when the install folder says so, and the shas of what
//                        was emitted.
//                        Then a note: which grammars this unit carries as skills,
//                        from INVENTORY.md — present by their descriptions, to be
//                        loaded in full when the situation calls for them.
//
//   --grammar <name>     Emit one grammar in full. Kept for a unit whose instance
//                        decides to inject a grammar under the system's ceiling; a
//                        grammar that does not fit it whole is not injected —
//                        splitting a grammar is its author's act.
//
// WHAT IT WRITES — one thing, and only under a real session. A statusline shows, in
// each session, the glyph of the personas it carries; --conduct deposits the card it
// reads, ~/.claude/.presence/<unit>-<session_id>.json, one per session, so that no
// shared file is ever rewritten; a session id that is not letters, digits and dashes
// names no file. The card is written only when stdin carries the
// system's session payload (session_id, hook_event_name SessionStart); the environment
// does not count, since a test run from a live session inherits its session id. Run
// by hand, the handler emits and writes nothing. Cards of this unit older than a few
// days are removed at start — a resumed session rewrites its own. Nothing else is
// written, and the card never fails the hook.
//
// ONE CHANNEL AT A TIME — the format has no exclusivity field, so the same unit can be
// enabled from two catalogs of its destination, each injecting its conduct. --conduct
// looks for that twin: the same unit under another catalog INVENTORY.md lists, installed
// for a scope that covers the session (user, or the session's project) and enabled in
// the user, project or local settings. When it finds one, the copy whose catalog serves
// all stands down for the one that serves a few: it emits nothing to the model and
// shows the user one line naming both. Each copy reaches that verdict alone. Out of
// reach: a twin enabled by a launch flag or managed settings.
//
// ONE PAYLOAD PER HOOK ENTRY — the system measures each hook's stdout separately
// and, past 10 000 characters, persists it to a file and splices in a ~2 KB
// preview, signalled only by an « Output too large » line. Never merge payloads.
//
// COPILOT CLI reads the same SessionStart entries and sets CLAUDE_PLUGIN_ROOT too;
// COPILOT_CLI tells the two apart. Measured on Copilot CLI 1.0.81: it keeps only
// the LAST non-empty `additionalContext` of an event and discards stdout that is
// not one JSON object. It does not read `settings.agent`. So under Copilot the
// --conduct invocation carries the essence, the conduct and every grammar in one
// JSON object, and --grammar stays silent. Two clients, opposite constraints.

const fs = require('fs');
const path = require('path');
const os = require('os');
const crypto = require('crypto');

const PLUGIN_DIR = process.env.CLAUDE_PLUGIN_ROOT;
if (!PLUGIN_DIR) {
  console.error('CLAUDE_PLUGIN_ROOT is not set');
  process.exit(1);
}
const COPILOT = Boolean(process.env.COPILOT_CLI);

const PLUGIN_JSON = path.join(PLUGIN_DIR, '.claude-plugin', 'plugin.json');
const INVENTORY_FILE = path.join(PLUGIN_DIR, 'INVENTORY.md');
const ACTIVATION_FILE = path.join(PLUGIN_DIR, 'persona', 'activation.md');

const manifest = JSON.parse(fs.readFileSync(PLUGIN_JSON, 'utf8'));
const UNIT = manifest.name;

// The number is bare; the channel is a fact of distribution, shown where it is read.
// Claude Code installs a unit at <cache>/<catalog>/<unit>/<version>/ — measured — so
// the catalog is the folder two levels above the root. A client whose install folder
// does not name it (another client, not measured) shows the number alone: one fact
// fewer, never a wrong one.
function catalog() {
  const parts = path.resolve(PLUGIN_DIR).split(path.sep);
  const n = parts.length;
  if (n >= 4 && parts[n - 1] === manifest.version && parts[n - 2] === UNIT && parts[n - 4] === 'cache') {
    return parts[n - 3];
  }
  return '';
}
const CATALOG = catalog();
function channel() { return CATALOG ? ` @${CATALOG}` : ''; }
const AGENT_FILE = path.join(PLUGIN_DIR, 'agents', `${UNIT}.md`);

// The carrier does not know what it carries: it reads the inventory PACKAGE wrote.
// The grammar table is the contract — rows like: | 1 | `<grammar>` | … |
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
  rows.sort((a, b) => a.rank - b.rank);
  if (rows.length === 0 || !rows.every((r, i) => r.rank === i + 1)) {
    console.error(`INVENTORY.md grammar table missing or not contiguous: ${rows.map((r) => r.rank).join(', ')}`);
    process.exit(1);
  }
  return rows.map((r) => r.name);
}
const GRAMMARS = readInventory();

// The channels of this unit's destination, as PACKAGE wrote them from the instance —
// rows like: | `<catalog>` | a few — trial |. Read by role, never by name.
function readChannels() {
  const channels = {};
  let inside = false;
  for (const line of fs.readFileSync(INVENTORY_FILE, 'utf8').split('\n')) {
    if (line.startsWith('## ')) inside = line.startsWith('## Channels');
    const m = inside && line.match(/^\|\s*`([^`]+)`\s*\|\s*([^|]*?)\s*\|/);
    if (m) channels[m[1]] = m[2];
  }
  return channels;
}

// The session payload the system writes on stdin — absent when run by hand.
function readPayload() {
  if (process.stdin.isTTY) return null;
  try {
    const input = JSON.parse(fs.readFileSync(0, 'utf8'));
    if (input && typeof input.session_id === 'string' && /^[A-Za-z0-9-]+$/.test(input.session_id) &&
        input.hook_event_name === 'SessionStart') return input;
  } catch (err) { /* no payload */ }
  return null;
}

function readJson(file) {
  try { return JSON.parse(fs.readFileSync(file, 'utf8')); } catch (err) { return null; }
}

// Another catalog of this destination serving the same unit, installed for a scope that
// covers the session and enabled there. Returns its catalog name, or ''.
function twin(channels, cwd) {
  if (!CATALOG || !(CATALOG in channels)) return '';
  const config = path.join(os.homedir(), '.claude');
  const installed = readJson(path.join(config, 'plugins', 'installed_plugins.json'));
  const plugins = installed && installed.plugins || {};
  // later settings override earlier ones: user, project, local
  const settings = [path.join(config, 'settings.json'),
    path.join(cwd, '.claude', 'settings.json'), path.join(cwd, '.claude', 'settings.local.json')]
    .map(readJson).filter(Boolean);
  for (const other of Object.keys(channels)) {
    if (other === CATALOG) continue;
    const key = `${UNIT}@${other}`;
    const covers = (plugins[key] || []).some((i) => i.scope === 'user' ||
      (i.projectPath && path.resolve(i.projectPath) === path.resolve(cwd)));
    if (!covers) continue;
    let enabled = false;
    for (const s of settings) if (s.enabledPlugins && key in s.enabledPlugins) enabled = s.enabledPlugins[key] === true;
    if (enabled) return other;
  }
  return '';
}

const PRESENCE_TTL_DAYS = 7;
function depositPresence(payload) {
  try {
    const presenceDir = path.join(os.homedir(), '.claude', '.presence');
    fs.mkdirSync(presenceDir, { recursive: true });
    const cutoff = Date.now() - PRESENCE_TTL_DAYS * 86400000;
    for (const name of fs.readdirSync(presenceDir)) {
      if (name !== `${UNIT}.json` && !(name.startsWith(`${UNIT}-`) && name.endsWith('.json'))) continue;
      const file = path.join(presenceDir, name);
      if (fs.statSync(file).mtimeMs < cutoff) fs.unlinkSync(file);
    }
    fs.writeFileSync(path.join(presenceDir, `${UNIT}-${payload.session_id}.json`),
      JSON.stringify({ session_id: payload.session_id, name: UNIT, glyph: manifest.metadata && manifest.metadata.glyph || '', scope: 'universal' }, null, 2) + '\n');
  } catch (err) {
    console.error(`${UNIT}: presence card skipped (${err.message})`);
  }
}

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

function sha8(text) {
  return crypto.createHash('sha256').update(text).digest('hex').substring(0, 8);
}

function pluginSha() {
  const EXCLUDED = new Set(['.git', '.jj', 'image']);
  const files = [];
  (function walk(dir) {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, entry.name);
      if (entry.isDirectory()) { if (!EXCLUDED.has(entry.name)) walk(full); }
      else if (entry.isFile()) files.push(full);
    }
  })(PLUGIN_DIR);
  const combined = crypto.createHash('sha256');
  for (const abs of files.sort()) {
    const rel = path.relative(PLUGIN_DIR, abs).replace(/\\/g, '/');
    combined.update(`${crypto.createHash('sha256').update(fs.readFileSync(abs)).digest('hex')}  ${rel}\n`);
  }
  return combined.digest('hex').substring(0, 8);
}

function grammarBlock(name) {
  if (!GRAMMARS.includes(name)) {
    console.error(`unknown grammar: ${name} (expected one of ${GRAMMARS.join(', ')})`);
    process.exit(1);
  }
  const file = path.join(PLUGIN_DIR, 'skills', name, 'SKILL.md');
  if (!fs.existsSync(file)) {
    console.error(`grammar file not found: ${file}`);
    process.exit(1);
  }
  const rule = '='.repeat(70);
  return `${rule}\n${UNIT.toUpperCase()} GRAMMAR — ${name.toUpperCase()} (${GRAMMARS.indexOf(name) + 1} of ${GRAMMARS.length}, in full)\n${rule}\n\n` +
    stripFrontmatter(fs.readFileSync(file, 'utf8')).trim() + '\n';
}

function emitConduct() {
  if (!fs.existsSync(ACTIVATION_FILE)) {
    console.error(`activation file not found: ${ACTIVATION_FILE}`);
    process.exit(1);
  }
  const conduct = stripFrontmatter(fs.readFileSync(ACTIVATION_FILE, 'utf8')).trim();
  const card = `${UNIT.toUpperCase()} ACTIVE — plugin v${manifest.version}${channel()} • conduct sha ${sha8(conduct)} • plugin sha ${pluginSha()}\n\n`;
  const note =
    `\n\n--- The grammars you operate by ---\n\n` +
    `This unit carries ${GRAMMARS.length} grammars as skills, in this framing order: ` +
    `${GRAMMARS.map((g) => `${UNIT}:${g}`).join(', ')}. Their descriptions are with you from the first reply; ` +
    `their bodies are not — load a grammar in full before you act on it. ` +
    `INVENTORY.md at the unit root says where each one comes from and what the packaging left out.\n`;

  if (COPILOT) {
    // One object, one invocation, everything inside: Copilot reads no settings.agent
    // and keeps only the last non-empty additionalContext.
    const essence = stripFrontmatter(fs.readFileSync(AGENT_FILE, 'utf8')).trim();
    process.stdout.write(JSON.stringify({
      additionalContext: card + essence + '\n\n' + conduct + '\n' + note + '\n' + GRAMMARS.map(grammarBlock).join('\n'),
    }));
    return;
  }

  const payload = readPayload();
  const channels = readChannels();
  const other = twin(channels, payload && payload.cwd || process.cwd());
  if (other) {
    const warning = `${UNIT} is enabled from two catalogs, ${CATALOG} and ${other} — disable one.`;
    if (channels[CATALOG] === 'all' && channels[other] !== 'all') {
      // the copy that serves all stands down: nothing to the model, one line to the user
      process.stdout.write(JSON.stringify({ systemMessage: `${warning} This copy (@${CATALOG}) stands down for @${other}.` }));
      return;
    }
    if (channels[CATALOG] === channels[other]) {
      // no role to decide between them: both emit, and both say so
      process.stdout.write(JSON.stringify({ systemMessage: warning,
        hookSpecificOutput: { hookEventName: 'SessionStart', additionalContext: card + conduct + '\n' + note } }));
      if (payload) depositPresence(payload);
      return;
    }
  }

  process.stdout.write(card + conduct + '\n' + note);
  if (payload) depositPresence(payload);
}

const argv = process.argv.slice(2);
if (argv[0] === '--conduct') emitConduct();
else if (argv[0] === '--grammar') { if (!COPILOT) process.stdout.write(grammarBlock(argv[1])); }
else { console.error('usage: session-start.js --conduct | --grammar <name>'); process.exit(1); }
