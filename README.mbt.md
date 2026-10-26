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

## Boundaries

This is the notation layer only. It does not implement UTM/MGRS, ellipsoidal
geodesics, datum transformations (GCJ-02/BD-09), address lookup or polygon
operations; those belong to separate projection/geodesy layers.

## Tests

59 test blocks: published vectors, round-trips at every precision, deterministic
property tests, cover checks, unified-model conversion checks and a robustness
pass over malformed input. `moon test` passes on `js` and `wasm-gc`; CI also
builds `wasm` and `native`, runs `examples/basic`, the CLI smoke tests and
`moon bench`.

## License

Apache-2.0. Formulas come from the OLC specification, RFC 5870, the geohash
description and the IARU locator scheme; no code was ported.
