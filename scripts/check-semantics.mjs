// Exercise the actual CLI consumed by map applications, independently of the
// library tests. No network, publishing or credentials are involved.
import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const directory = path.join(root, '.cache/semantic-checks');
fs.mkdirSync(directory, { recursive: true });
let sequence = 0;
function run(args, cwd = root, expectSuccess = true) {
  const file = path.join(directory, `${sequence++}.log`);
  const fd = fs.openSync(file, 'w');
  let result;
  try { result = spawnSync('moon', args, { cwd, stdio: ['ignore', fd, fd] }); }
  finally { fs.closeSync(fd); }
  if (result.error) throw result.error;
  const output = fs.readFileSync(file, 'utf8').replace(/\r\n/g, '\n').trim();
  assert.equal(result.status === 0, expectSuccess, output);
  return output;
}
function cli(...args) { return run(['run', '--target', 'js', 'cmd/main', '--', ...args]); }
const unknown = JSON.parse(cli('json', 'geo:1,2'));
assert.equal(unknown.uncertainty_m, null);
assert.equal(unknown.uncertainty_known, false);
assert.equal(unknown.cell_radius_m, null);
assert.equal(unknown.crs, 'wgs84');
assert.equal(unknown.as_geouri, 'geo:1,2');
const exact = JSON.parse(cli('json', 'geo:1,2;u=0'));
assert.equal(exact.uncertainty_m, 0);
assert.equal(exact.uncertainty_known, true);
assert.equal(exact.as_geouri, 'geo:1,2;u=0');
const tiny = 'geo:1.123456789123,2.987654321987;u=0.0000001';
const precise = JSON.parse(cli('json', tiny));
assert.ok(precise.uncertainty_m > 0 && precise.uncertainty_m < 0.000001);
assert.equal(precise.lat, 1.123456789123);
assert.equal(precise.as_geouri, tiny);
for (const crs of ['custom-grid', 'gcj02', 'epsg-3857']) {
  assert.ok(JSON.parse(cli('json', `geo:1,2;crs=${crs}`)).error);
  assert.equal(cli('geouri', `geo:1,2;crs=${crs}`), 'geouri: not a valid geo: URI');
}
const conversion = cli('convert', 'geo:1,2', 'plus', '10');
assert.equal((conversion.match(/uncertainty_m: \(unspecified\)/g) || []).length, 2);
assert.ok(!/as_geouri: .*;u=/.test(conversion));
const known = cli('convert', 'geo:48.198634,16.371648;u=40', 'plus', '15');
const targetBound = known.split('converted:')[1].match(/^uncertainty_m: ([\d.]+)/m);
assert.ok(Number(targetBound?.[1]) >= 40);
const example = run(['run', '--target', 'js', 'examples/safety']);
assert.equal(example, fs.readFileSync(path.join(root, 'examples/safety/expected.txt'), 'utf8').trim());

// A separate package cannot forge the validated CRS/accuracy state. This also
// prevents externally replacing None with zero via a functional struct update.
const consumer = path.join(directory, 'consumer');
fs.mkdirSync(consumer, { recursive: true });
const version = fs.readFileSync(path.join(root, 'moon.mod'), 'utf8').match(/version\s*=\s*"([^"]+)"/)[1];
fs.writeFileSync(path.join(consumer, 'moon.mod'),
  `name = "safety/consumer"\nimport { "sssssurf/geocodec@${version}", }\n`);
fs.writeFileSync(path.join(consumer, 'moon.pkg'),
  'import { "sssssurf/geocodec", }\noptions("is-main": true)\n');
fs.writeFileSync(path.join(consumer, 'moon.work'),
  `members = [".", "${root.replaceAll('\\', '/')}"]\n`);
const valid = 'fn main { let loc = @geocodec.parse_location("geo:1,2").unwrap(); println(loc.raw) }\n';
fs.writeFileSync(path.join(consumer, 'main.mbt'), valid);
run(['check', '--target', 'js'], consumer);
for (const forged of [
  'fn main { let loc = @geocodec.parse_location("geo:1,2").unwrap(); let bad = { ..loc, uncertainty_m: Some(0.0) }; println(bad.raw) }',
  'fn main { let uri = @geocodec.geouri_parse("geo:1,2").unwrap(); let bad = { ..uri, crs: Some("custom-grid") }; println(bad.raw) }',
]) {
  fs.writeFileSync(path.join(consumer, 'main.mbt'), forged + '\n');
  const rejected = run(['check', '--target', 'js'], consumer, false);
  assert.match(rejected, /readonly|read.only|not.*public|cannot.*creat|cannot.*construct/i);
}
fs.writeFileSync(path.join(consumer, 'main.mbt'), valid);
const report = { status: 'passed', checks: ['CLI null versus zero', 'tiny positive u and coordinate precision',
  'unsupported CRS in JSON/geouri', 'unknown and known conversion bounds',
  'public safety example', 'external Location and GeoUri forgery rejected'],
  date: new Date().toISOString() };
fs.writeFileSync(path.join(directory, 'report.json'), JSON.stringify(report, null, 2) + '\n');
console.log('Semantic consumer checks passed');
