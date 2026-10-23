# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses
[Semantic Versioning](https://semver.org/).

## [0.1.0] - 2026-10-23

First release. The whole module is new in this round.

### Added

- `LatLng` and `BoundingBox`: validated WGS84 points, antimeridian-aware
  containment/intersection/centre, fixed-point rendering.
- `parse_dms` and `format_dms`: decimal degrees and degrees/minutes/seconds in
  the common human spellings (`° ' "`, `d/m/s`, `:`, hemisphere suffixes).
- Geohash: encode at 1–12 characters, decode to centre, cell bounds, eight
  neighbours, arbitrary adjacent cells, precision selection for a target size,
  and `geohash_cover` for the cells covering a bounding box with a cell budget.
- Open Location Code / Plus Codes: encode at 2–15 significant digits, decode,
  cell bounds, validation of full/short/padded codes, `shorten`, `recover`, and
  the eight neighbours. The implementation works in the integer grid from the
  specification.
- Maidenhead locators: encode/decode/bounds at 2–10 characters, including
  extended squares.
- RFC 5870 `geo:` URI parsing and formatting with altitude, `u=` uncertainty and
  `crs=`.
- `parse_location`, which recognises any of the notations above from one string,
  and `parse_codes`, which scans free text for codes with a documented
  false-positive guard.
- `describe_code`: notation, centre, bounds, ground size in metres and
  approximate area for a cell.
- `cmd/main`: 11 subcommands (`parse`, `geohash`, `plus`, `maidenhead`, `bbox`,
  `geouri`, `dms`, `scan`, `cover`, `info`, `demo`).
- 46 test blocks: published vectors, per-precision round-trips, deterministic
  property tests, cover checks and a robustness pass. `js` and `wasm-gc` targets
  pass locally; CI adds `wasm` and `native`.
- Documentation: `README.md`, `README.mbt.md`,
  `docs/reproducible-demo.md`, `docs/development-retrospective.md`.

### Notes

- No runtime dependencies; only the MoonBit core `math` package.
- No code was ported. Formulas come from OLC, RFC 5870, the geohash description
  and the IARU locator scheme; see the references in `README.md`.
- Scope is the notation layer only. UTM/MGRS, ellipsoidal geodesics and datum
  conversions are deliberately excluded because `ChrisTu117/moongeodesy`
  already covers them; see the duplicate check in the README.
- Short all-letter geohashes are not recognised by `parse_codes` (which needs a
  digit); direct calls to `parse_location` accept them.
