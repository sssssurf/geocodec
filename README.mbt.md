# geocodec

[![CI](https://github.com/sssssurf/geocodec/actions/workflows/ci.yml/badge.svg)](https://github.com/ssssurf/geocodec/actions/workflows/ci.yml)

Location codes for MoonBit: Geohash, Plus Codes, Maidenhead locators, `geo:`
URIs and degrees/minutes/seconds.

`geocodec` converts between the short codes people read, print and text. A
Geohash/Plus Code/Maidenhead string denotes a cell with an extent; a decimal
pair, DMS pair or `geo:` URI denotes a point, optionally with `u=`. The parser
returns a `Location` that keeps the notation, the representative point, the
exact region, the resolution, the uncertainty and the original text, so a
conversion can say what it lost instead of silently returning a centre.

```moonbit nocheck
let p = @geocodec.LatLng::new(39.9042, 116.4074).unwrap()
@geocodec.geohash_encode(p, 9)                 // Some("wx4g0bm6c")
@geocodec.pluscode_encode(p, code_length=10)   // Some("8PFRWC34+MX")
@geocodec.maidenhead_encode(p, precision=8)    // Some("OM89EV87")
```

## Coverage

| Notation | Encoding | Decoding | Bounds | Extras |
| --- | --- | --- | --- | --- |
| Geohash | 1–12 characters | centre | yes | neighbours, covering, precision for metres |
| Plus Codes | 2–15 digits | centre | yes | shorten/recover, neighbours, padding |
| Maidenhead | 2–10 characters | centre | yes | fields through extended squares |
| Geo URI | RFC 5870 | RFC 5870 | — | altitude, uncertainty, CRS |
| DMS | format | parse | — | symbols, `d/m/s`, colons, hemispheres |

Plus `LatLng`, `BoundingBox` (antimeridian aware), the `Location` model
(`kind`, `region`, `resolution_m`, `uncertainty_m`, `area_m2`, `raw`),
`parse_location`, `parse_codes` for free text, `describe_code` for cell codes,
`Location::to_geouri` for a bounded cell→point conversion,
`Location::to_cell` for explicit point→cell quantisation, and `geohash_cover`
for box coverage.

## Install and run

```bash
moon add sssssurf/geocodec   # once the first mooncakes release is published
moon run --target js cmd/main -- demo
```

The CLI has the subcommands `parse`, `geohash`, `plus`, `maidenhead`, `bbox`,
`geouri`, `dms`, `scan`, `cover`, `info`, `convert`, `json` and `demo`; `json`
emits one line for scripts and AI agents. See `README.md` in the repository for
recorded output, the runnable `examples/basic` package and the `benchmarks`
package.

## One model, two families

Geohash, Plus Codes and Maidenhead denote **cells**. Decimal and DMS pairs and
`geo:` URIs denote **points**, optionally with explicit uncertainty.

| Field | Meaning |
| --- | --- |
| format / kind | notation and Cell/Point |
| point / region | representative point and exact cell or conservative u envelope |
| resolution_m | approximate cell size, point uncertainty diameter, or 0 |
| uncertainty_m / uncertainty_known | geometric/input bound; missing accuracy is distinct from u=0 |
| area_m2 | approximate or nominal envelope area |
| altitude_m / crs / raw | source altitude, CRS label and original notation |

`Location::convert_to_cell(format, precision)` returns a `LocationConversion`
containing `source`, `target`, `center_shift_bound_m` and an optional
`uncertainty_bound_m`. Converting a 40 m uncertain point to a 13.8 m cell
does not improve its accuracy: the original 40 m survives in source, and the
bound relative to the new centre is about 47.428 m. An unspecified source
accuracy remains unspecified. `to_cell` is the lower-level centre quantiser.

`to_geouri` on a cell emits a covering radius rounded outwards, with coordinate
rounding accounted for. It loses rectangle shape. Point geo URIs retain their
original text, including explicit u=0 and input precision. Unsupported CRSs are
rejected by the unified WGS84 model rather than silently reinterpreted.

The full semantics and conversion-loss table are in
[docs/location-model.md](docs/location-model.md). The resubmission response is
in [docs/初审补充说明.md](docs/初审补充说明.md).

## Boundaries

This is the notation layer only. It does not implement UTM/MGRS, ellipsoidal
geodesics, datum transformations (GCJ-02/BD-09), address lookup or polygon
operations; those belong to separate projection/geodesy layers.

## Tests

62 test blocks: published vectors, round-trips at every precision, deterministic
property tests, cover checks, unified-model conversion checks and a robustness
pass over malformed input. `moon test` passes on `js` and `wasm-gc`; CI also
builds `wasm` and `native`, runs `examples/basic`, the CLI smoke tests and
`moon bench`.

## License

Apache-2.0. Formulas come from the OLC specification, RFC 5870, the geohash
description and the IARU locator scheme; no code was ported.
