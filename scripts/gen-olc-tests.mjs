// Offline, unmodified Google OLC CSV vectors. These expectations never come
// from the local implementation or from encode/decode round trips.
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const directory = path.join(root, 'data/olc');
const provenance = JSON.parse(fs.readFileSync(path.join(directory, 'provenance.json')));
const q = JSON.stringify;
const out = ['// Generated from pinned Google OLC CSV vectors by gen-olc-tests.mjs.',
  '// Out-of-range latitudes are explicitly clipped to adapt to validated LatLng.',
  '// No vector is skipped. See docs/pluscode-conformance.md for API boundaries.', ''];
const counts = {};
for (const [filename, metadata] of Object.entries(provenance.files)) {
  const bytes = fs.readFileSync(path.join(directory, filename));
  const actual = crypto.createHash('sha256').update(bytes).digest('hex');
  if (actual !== metadata.sha256) throw new Error('Changed upstream fixture: ' + filename);
  if (!filename.endsWith('.csv')) continue;
  const rows = bytes.toString('utf8').split(/\r?\n/).map((line, index) => ({line, number: index + 1}))
    .filter(row => row.line.trim() && !row.line.startsWith('#'));
  if (rows.length !== metadata.rows) throw new Error('Changed vector count: ' + filename);
  counts[filename] = rows.length;
  for (const {line, number} of rows) {
    const fields = line.split(',');
    out.push('///|', `test ${q(`official OLC ${filename}:${number}`)} {`);
    if (filename === 'encoding.csv') {
      const [lat, lng,,, length, expected] = fields;
      out.push(`  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(${Number(lat)}), ${Number(lng)}).unwrap()`,
        `  let actual = @geocodec.pluscode_encode(point, code_length=${length})`);
      if (expected) {
        out.push(`  if actual != Some(${q(expected)}) {`,
          `    match actual { Some(code) => println(${q('OLC_ENCODING_MISMATCH '+number+' ')} + code); None => println(${q('OLC_ENCODING_MISMATCH '+number+' NONE')}) }`,
          '  }', `  assert_eq(actual, Some(${q(expected)}))`);
      } else out.push('  assert_true(actual is None)');
      // Numeric literals alone did not exercise the real ingestion path.
      // Verify both decimal and geo: text through parsing and conversion.
      if (Math.abs(Number(lat)) <= 90 && expected) {
        out.push(`  let decimal = @geocodec.parse_location(${q(lat + ',' + lng)}).unwrap()`,
          `  assert_eq(decimal.to_cell(@geocodec.PlusCode, ${length}).unwrap().raw, ${q(expected)})`);
        if (Math.abs(Number(lng)) <= 180) {
          out.push(`  let uri = @geocodec.parse_location(${q('geo:' + lat + ',' + lng)}).unwrap()`,
            `  assert_eq(uri.to_cell(@geocodec.PlusCode, ${length}).unwrap().raw, ${q(expected)})`);
        }
      }
    } else if (filename === 'decoding.csv') {
      const [code, length, south, west, north, east] = fields;
      out.push(`  let box = @geocodec.pluscode_bounds(${q(code)}).unwrap()`,
        `  assert_eq(@geocodec.pluscode_code_length(${q(code)}), ${length})`);
      for (const [name, expected] of Object.entries({south, west, north, east})) {
        out.push(`  assert_true((box.${name}() - (${Number(expected)})).abs() <= 1.0e-10)`);
      }
    } else if (filename === 'validityTests.csv') {
      const [code, valid, short, full] = fields;
      for (const [name, expected] of Object.entries({is_valid:valid, is_short:short, is_full:full})) {
        out.push(`  assert_eq(@geocodec.pluscode_${name}(${q(code)}), ${expected})`);
      }
    } else {
      const [full, lat, lng, short, kind] = fields;
      out.push(`  let reference = @geocodec.LatLng::new(${Number(lat)}, ${Number(lng)}).unwrap()`);
      if (kind === 'B' || kind === 'S') out.push(`  assert_eq(@geocodec.pluscode_shorten(${q(full)}, reference), Some(${q(short)}))`);
      if (kind === 'B' || kind === 'R') out.push(`  assert_eq(@geocodec.pluscode_recover(${q(short)}, reference), Some(${q(full)}))`);
    }
    out.push('}', '');
  }
}
// Some upstream decoding bounds are recorded to only ten decimal places.
// A 1e-10-degree tolerance covers that serialization, well below a finest cell.
const content = out.join('\n');
const target = path.join(root, 'olc_official_test.mbt');
if (process.argv.includes('--check')) {
  if (fs.readFileSync(target, 'utf8') !== content) throw new Error('Official OLC tests are stale');
} else fs.writeFileSync(target, content);
console.log('Official OLC vectors: ' + JSON.stringify(counts));
