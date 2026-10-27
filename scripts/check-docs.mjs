// Verify literal CLI snapshots; --update refreshes them from real runs.
import fs from 'node:fs';
import path from 'node:path';
import { tmpdir } from 'node:os';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const update = process.argv.includes('--update');
const scratch = fs.mkdtempSync(path.join(tmpdir(), 'geocodec-docs-'));
let sequence = 0;
function run(args) {
  const output = path.join(scratch, String(sequence++));
  const fd = fs.openSync(output, 'w');
  let result;
  try { result = spawnSync('moon', args, { cwd: root, stdio: ['ignore', fd, fd] }); }
  finally { fs.closeSync(fd); }
  if (result.error) throw result.error;
  const text = fs.readFileSync(output, 'utf8').replace(/\r\n/g, '\n').trim();
  if (result.status !== 0) throw new Error(`moon ${args.join(' ')} failed:\n${text}`);
  return text;
}
function argsOf(command) {
  return command.match(/"[^"]*"|'[^']*'|\S+/g).slice(1).map(s =>
    (s.startsWith('"') || s.startsWith("'")) ? s.slice(1, -1) : s);
}
let snapshots = 0;
try {
  const summary = run(['test', '--target', 'js']);
  const count = Number(summary.match(/Total tests:\s*(\d+)/)?.[1]);
  if (!count) throw new Error('Missing test summary');
  for (const relative of ['README.md', 'README.mbt.md', 'docs/reproducible-demo.md']) {
    const file = path.join(root, relative);
    const source = fs.readFileSync(file, 'utf8');
    let result = source.replace(/```text\r?\n([\s\S]*?)```/g, (block, body) => {
      if (!/^\$ moon run /m.test(body)) return block;
      const groups = body.trim().split(/\r?\n(?=\$ )/);
      const refreshed = groups.map(group => {
        const lines = group.split(/\r?\n/);
        const command = lines[0].slice(2);
        if (!command.startsWith('moon run ')) return group.trim();
        const actual = run(argsOf(command));
        snapshots++;
        if (!update && actual !== lines.slice(1).join('\n').trim()) {
          throw new Error(`${relative}: stale output for ${command}`);
        }
        return '$ ' + command + '\n' + actual;
      }).join('\n\n');
      return '```text\n' + refreshed + '\n```';
    });
    for (const match of result.matchAll(/(\d+)\s+test blocks/g)) {
      if (!update && Number(match[1]) !== count) throw new Error(`${relative}: stale test count`);
    }
    if (update) {
      result = result.replace(/\d+ test blocks/g, count + ' test blocks');
      fs.writeFileSync(file, result);
    }
  }
  console.log(`Documentation verified: ${count} tests, ${snapshots} real command snapshots`);
} finally {
  fs.rmSync(scratch, { recursive: true, force: true });
}
