# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses
[Semantic Versioning](https://semver.org/).

## [0.2.0] - 2026-10-26

### Added

- **Unified `Location` model.** Parsing now distinguishes a cell (Geohash, Plus
  Code, Maidenhead) from a point (decimal, DMS, `geo:` URI) and keeps the
  notation, representative point, exact region, resolution, uncertainty, area,
  altitude/CRS and original text. `LocationKind` is `Cell` or `Point`.
- `Location::center`, `bounds`, `is_cell`, `contains_point`, `contains`,
  `intersects` and `to_geouri`.
- `Location::to_geouri` converts a cell to a centre plus `;u=<half diagonal>`,
  making the rectangle→circle loss explicit instead of dropping the cell.
- `docs/location-model.md`: the model, its invariants, the conversion-loss table
  and worked examples.

### Changed

- **Breaking:** `parse_location`, `parse_codes` and `describe_code` now return
  `Location` instead of a bare point or `CodeInfo`; `CodeInfo` is removed.
  Callers that only need a point use `Location::center`.
- The CLI `parse`, `info` and `scan` commands print the kind, region, resolution,
  uncertainty, area and `as_geouri`.
- 53 test blocks (was 48).
- Version bumped to 0.2.0.

### Notes

- The model does not invent precision from decimal digits: a decimal or DMS pair
  is a point with resolution 0, and `u=` is the only uncertainty `geo:` defines.
- A point with `u=` larger than the target cell should stay a point; encoding it
  as a cell would pretend to more accuracy than the source had.

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
- 48 test blocks: published vectors, per-precision round-trips, deterministic
  property tests, cover checks and a robustness pass. `js` and `wasm-gc` targets
  pass locally; CI adds `wasm` and `native`.
- Documentation: `README.md`, `README.mbt.md`,
  `docs/reproducible-demo.md`, `docs/development-retrospective.md`.

### Notes

- No runtime dependencies; only the MoonBit core `math` package.
- No code was ported. Formulas come from OLC, RFC 5870, the geohash description
  and the IARU locator scheme; see the references in `README.md`.
- Scope is the notation layer only. UTM/MGRS, ellipsoidal geodesics and datum
  conversions are deliberately excluded because they belong to a separate
  projection/geodesy layer; see the scope section in the README.
- Short all-letter or all-digit geohashes are not recognised by `parse_codes`
  (which needs both a digit and a letter); direct calls to `parse_location`
  accept them.
