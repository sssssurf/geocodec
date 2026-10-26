# geocodec

[![CI](https://github.com/sssssurf/geocodec/actions/workflows/ci.yml/badge.svg)](https://github.com/sssssurf/geocodec/actions/workflows/ci.yml)

Location codes for MoonBit: Geohash, Plus Codes, Maidenhead locators, `geo:`
URIs and degrees/minutes/seconds.

A place is written in more ways than one. A rescue dispatcher reads a Plus Code
off a phone, a radio operator logs a Maidenhead locator, a travel note carries a
geohash, a web link carries a `geo:` URI, and a map annotation carries degrees,
minutes and seconds. `geocodec` turns each of those into one validated `LatLng`,
converts between them, gives the bounds of every cell, and can find the codes
inside a sentence. Every public function is total: malformed input comes back as
`None` or `false`, never as an exception or a panic.

```moonbit
let p = @geocodec.LatLng::new(39.9042, 116.4074).unwrap()
@geocodec.geohash_encode(p, 9)                 // Some("wx4g0bm6c")
@geocodec.pluscode_encode(p, code_length=10)   // Some("8PFRWC34+MX")
@geocodec.maidenhead_encode(p, precision=8)    // Some("OM89EV87")
```

## 中文简介

`geocodec` 是一个纯 MoonBit 的「地点短码」库：支持 Geohash、Plus Codes
（Open Location Code）、Maidenhead 网格、RFC 5870 `geo:` URI 和度分秒，提供
单元边界、相邻单元、geohash 区域覆盖、自由文本中的代码扫描、单元地面尺寸报告。
它不依赖第三方包，不联网、不读文件，所有对外函数都是全函数。它**不**做
UTM/MGRS 投影、椭球测地线或坐标系转换——这些属于投影/测地线层，不在本库的
范围里。

## What it covers

| Notation | Standard / origin | Encode | Decode | Bounds | Extras |
| --- | --- | --- | --- | --- | --- |
| Geohash | Niemeyer, 2008 | 1–12 chars | centre | yes | neighbours, precision for metres, box covering |
| Plus Codes | Open Location Code | 2–15 digits | centre | yes | shorten/recover, neighbours, padding |
| Maidenhead | IARU locator scheme | 2–10 chars | centre | yes | fields through extended squares |
| Geo URI | RFC 5870 | format | parse | — | altitude, `u=`, `crs=` |
| DMS | conventional | format | parse | — | `°`, `'`, `"`, `d/m/s`, `:`, hemispheres |

On top of the codecs:

- `LatLng` and `BoundingBox`, both validated; boxes may cross the antimeridian.
- `Location`: the unified value. It keeps the notation, whether it is a cell or
  a point, the representative point, the exact region, the resolution, the
  uncertainty, the altitude/CRS and the original text.
- `parse_location`, which recognises any of the notations above from one string.
- `parse_codes`, which scans free text and returns every code it finds.
- `describe_code`, which reports the notation, the region, the ground size in
  metres and the approximate area in square metres.
- `Location::to_geouri`, which converts a cell to a point plus `;u=<half
  diagonal>` instead of silently dropping the cell.
- `geohash_cover`, which enumerates the geohash cells covering a bounding box,
  with a cell budget.
- A CLI that exposes every operation for a reviewer or a shell script.

## One model, two families

The notations are not interchangeable. Geohash, Plus Codes and Maidenhead denote
a **cell**: a rectangle at a resolution. A decimal pair, a DMS pair and a `geo:`
URI denote a **point**; `geo:` may also carry an explicit `u=` uncertainty.
`parse_location` returns a `Location`, never a bare `LatLng`:

| Field | Meaning |
| --- | --- |
| `format` | which notation produced the value |
| `kind` | `Cell` or `Point` |
| `point` | cell centre, or the coordinate itself |
| `region` | exact cell, `u=` envelope, or degenerate point |
| `resolution_m` | longer side of the region; 0 when the notation has no extent |
| `uncertainty_m` | max distance from `point` to the region boundary |
| `area_m2` | approximate ground area of the region |
| `altitude_m`, `crs` | only from `geo:` URIs |
| `raw` | the original text, never discarded |

Converting a cell to a point keeps the centre and the `region` but loses the
shape; the point is only accurate to `uncertainty_m`. Converting a point to a
cell quantises it; the cell contains the point and the error is at most the
cell's half-diagonal. `to_geouri` on a cell writes the centre plus
`;u=<half diagonal>`, so a `geo:`-only consumer gets a covering circle, at the
cost of the rectangle shape. A point with `u=` larger than the target cell
should stay a point: the code would pretend to more accuracy than the source.

```moonbit
let cell = @geocodec.parse_location("8FVC9G8F+6X").unwrap()
// cell.kind == Cell, cell.resolution_m ~ 13.8, cell.uncertainty_m ~ 8.4
let uri = cell.to_geouri()
// "geo:47.365562,8.524938;u=8.365"
let back = @geocodec.parse_location(uri).unwrap()
// back.kind == Point, back.uncertainty_m == 8.365
```

The full semantics, including the conversion-loss table and the no-invented-
precision rule, are in [docs/location-model.md](docs/location-model.md).

## Install

```bash
moon add sssssurf/geocodec   # once the first mooncakes release is published
```

`moon.mod` declares no dependencies. The only import is `moonbitlang/core/math`,
which ships with the toolchain.

## Library examples

### Geohash

```moonbit
let p = @geocodec.LatLng::new(57.64911, 10.40744).unwrap()
let code = @geocodec.geohash_encode(p, 11).unwrap()      // "u4pruydqqvj"
let box = @geocodec.geohash_bounds(code).unwrap()
let neighbours = @geocodec.geohash_neighbors("ezs42").unwrap() // 8 cells
let nearby = @geocodec.geohash_adjacent("ezs42", 1, -1).unwrap()
```

`geohash_cover` is the indexing primitive: give it a box, a precision and a
maximum number of cells, and it returns every cell that meets the box, or
`None` rather than an unbounded list.

```moonbit
let beijing = @geocodec.BoundingBox::new(39.90, 116.40, 39.91, 116.41).unwrap()
let cells = @geocodec.geohash_cover(beijing, 7, max_cells=100).unwrap()
```

### Plus Codes

```moonbit
let zurich = @geocodec.LatLng::new(47.365590, 8.524997).unwrap()
let full = @geocodec.pluscode_encode(zurich, code_length=10).unwrap()
// "8FVC9G8F+6X"
let near = @geocodec.LatLng::new(47.37, 8.52).unwrap()
let short = @geocodec.pluscode_shorten(full, near).unwrap()
let again = @geocodec.pluscode_recover(short, near).unwrap()
assert_eq(again, full)
```

The encoder and decoder work in the integer grid the OLC specification defines
(`20^3 * 5^5` and `20^3 * 4^5` units per degree), so a 15-digit code decodes to
exactly the cell it was encoded from rather than to a float approximation.

### Maidenhead

```moonbit
let london = @geocodec.LatLng::new(51.5074, -0.1278).unwrap()
@geocodec.maidenhead_encode(london, precision=6)  // Some("IO91WM")
@geocodec.maidenhead_bounds("IO91WM")             // 5' x 2.5' cell
```

### Anything in, point out

```moonbit
@geocodec.parse_location("8FVC9G8F+6X")      // plus-code
@geocodec.parse_location("IO91WM")           // maidenhead
@geocodec.parse_location("wx4g0b")           // geohash
@geocodec.parse_location("geo:48.198634,16.371648;u=40")
```

### Scanning a sentence

```moonbit
let text =
  "Meet at 8FVC9G8F+6X near IO91WM, or send geo:48.198634,16.371648;u=40 and wx4g0b."
let found = @geocodec.parse_codes(text)
// 4 results: plus-code, maidenhead, geo-uri, geohash
```

Short English words such as "meet" and "send" are legal geohash strings, and a
bare number such as "12345" can also decode as one. The scanner therefore
requires a digit and a letter in a token before treating it as a geohash, and
requires at least five characters. This rule is in the API docs and covered by
a test; it trades a few exotic all-letter or all-digit geohashes for a much
lower false-positive rate in prose.

### Describing a cell

```moonbit
let loc = @geocodec.describe_code("8FVC9G8F+6X").unwrap()
// loc.kind == Cell
// loc.resolution_m ~ 13.8
// loc.uncertainty_m ~ 8.4
// loc.area_m2 ~ 130
// loc.to_geouri() == "geo:47.365562,8.524938;u=8.365"
```

## Command line

```text
$ moon run --target js cmd/main -- parse "8FVC9G8F+6X"
format: plus-code
kind: cell
point: 47.365562, 8.524938
dms: 47°21′56.02″N 8°31′29.78″E
region: 47.365500,8.524875,47.365625,8.525000
resolution_m: 13.822
uncertainty_m: 8.365
area_m2: 130.268
altitude_m: (none)
crs: wgs84
raw: 8FVC9G8F+6X
as_geouri: geo:47.365562,8.524938;u=8.365

$ moon run --target js cmd/main -- scan "Meet at 8FVC9G8F+6X near IO91WM, or send geo:48.198634,16.371648;u=40 and wx4g0b."
found: 4
plus-code: 47.365562, 8.524938 [cell, 13.8 m]
maidenhead: 51.520833, -0.125000 [cell, 5772.2 m]
geo-uri: 48.198634, 16.371648 [point, 80.0 m]
geohash: 39.905090, 116.405640 [cell, 938.2 m]
```

The full command list:

```text
parse, geohash, plus, maidenhead, bbox, geouri, dms,
scan, cover, info, demo
```

The CLI finds its subcommand after any runtime/script path a backend inserts, so
the same invocation works for `js`, `wasm-gc` and `native` targets.

## Design notes

### Plus Codes in an integer grid

The first ten OLC digits are five latitude/longitude pairs in base 20; digits
eleven to fifteen refine the cell with a 5x4 grid. Doing that with repeated
floating-point additions loses precision exactly where the cells are smallest.
This implementation converts the point to `Int64` units first (latitude
`20^3 * 5^5 = 25,000,000` per degree, longitude `20^3 * 4^5 = 8,192,000`), does
all pair and grid arithmetic with integers, and converts back once. The
15-digit round-trip is therefore exact by construction.

### Covering without unbounded work

`geohash_cover` computes the row and column ranges, checks the product against
the caller's budget *before* generating anything, and handles a box that crosses
the date line as two column ranges. A request that would produce too many cells
returns `None`; there is no silent truncation and no risk of a multi-gigabyte
array from a precision-12 request.

### Antimeridian-aware boxes

`BoundingBox` allows `west > east` to mean "crosses 180°". `contains` has two
branches, `width` adds a full turn, and the centre is normalised. Containment
uses a `1e-9` degree tolerance so a point exactly on a decimal cell edge is not
lost to floating-point representation (1e-9 degrees is about 0.1 mm).

### Total functions

Every parser checks length, character set and numeric range and returns
`Option`; the decimal parser is hand-written to avoid a raising standard
function. `parse_dms("1e999")`, `geo:0,0;u=1e999` and a 10,000-character token
all return `None` without an exception.

## Scope and related work

This library stops at the notation layer:

- **No map projection.** UTM, UPS and MGRS are not implemented.
- **No ellipsoidal geodesics.** Distances, bearings and datum shifts are not
  implemented; `geocodec` is about where a code points, not how far away it is.
- **No datum transformation.** Coordinates are WGS84; NAD27, ETRS89 and
  GCJ-02/BD-09 are out of scope.
- **No address lookup.** It does not turn "Paris" into a point, or a point into
  a street address.
- **No polygon operations.** `BoundingBox` answers containment, intersection and
  centre; point-in-polygon, buffering and tiling are other libraries' work.

These are deliberate exclusions, not missing features. The library is an
independent implementation of the notation layer: no source code was ported, and
the formulas come from the public specifications listed below.

## Tests

```text
$ moon test --target js
Total tests: 53, passed: 53, failed: 0.

$ moon test --target wasm-gc
Total tests: 53, passed: 53, failed: 0.
```

The suite is in five layers:

1. **Published vectors.** `u4pruydqqvj` and `ezs42` for geohash,
   `849VCWC8+R9` and `8FVC9G8F+6X` for Plus Codes, `IO91WM` for Maidenhead,
   and the integer-grid round-trip at 10/11/15 digits.
2. **Round-trips.** Every codec, every precision, both hemispheres, the date
   line and the poles.
3. **Property tests.** Forty deterministic pseudo-random points run through
   all three cell codecs; covers of ten random boxes are checked cell by cell.
4. **Unified model.** Cell vs point kinds, region containment, the `u=` envelope,
   `to_geouri`'s half-diagonal radius, and the no-invented-precision rule for
   decimal/DMS.
5. **Robustness.** Garbage strings, non-ASCII text, 10,000-character input and
   extreme numbers go through every parser without a panic.

`moon fmt --check` is clean on the local `moonc 0.10.0` toolchain. CI does not
gate on the formatter, because newer `moon fmt` releases rewrite `Int` to
`Int32` and `options` to `pkgtype`; the test and build matrix is the gate that
matters for compatibility.

## Repository layout

```text
geo_math.mbt      angles, normalisation, fixed-point formatting
text.mbt          ASCII helpers and the exception-free decimal parser
latlng.mbt        LatLng, BoundingBox, antimeridian-aware containment
dms.mbt           degrees/minutes/seconds parsing and formatting
geohash.mbt       geohash encode/decode/bounds/neighbours/cover
pluscode.mbt      Open Location Code encode/decode/shorten/recover/neighbours
maidenhead.mbt    Maidenhead locators
geouri.mbt        RFC 5870 parser and formatter
parse.mbt         one-string detection and free-text scanning
location.mbt      the unified Location model and its conversions
location_format.mbt  notation names
cmd/main/         the CLI
docs/             model notes, reproducible demo and development retrospective
```

## Status

Version 0.2.0. The public API is intentionally small and may still change before
1.0. Issues and pull requests are welcome; please include a failing code string
and the notation you expected.

## License

Apache-2.0. See `LICENSE`.

## References

- Open Location Code specification and reference implementations:
  <https://github.com/google/open-location-code>
- RFC 5870, *A Uniform Resource Identifier for Geographic Locations*:
  <https://www.rfc-editor.org/rfc/rfc5870>
- G. Niemeyer, geohash (2008), as described in the geohash specification.
- IARU Maidenhead locator system.
- The MoonBit core library documentation for `math` and string handling.
