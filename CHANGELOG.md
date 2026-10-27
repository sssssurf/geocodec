# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses
[Semantic Versioning](https://semver.org/).

## [0.4.0] - 2026-10-27

- Add LocationConversion retaining source/target and propagated uncertainty.
- Distinguish unspecified accuracy from explicit zero; retain point URI text.
- Use conservative cell-to-URI bounds with outward rounding and polar envelopes.
- Reject unsupported CRSs in the WGS84 model and malformed/duplicate URI fields.
- Normalize extreme finite longitudes without an unbounded subtraction loop.
- Add conversion, high-precision corner coverage and polar regression checks.
- Update the application, model design, reviewer response and recorded evidence.

## [0.3.0] - 2026-10-26

### Added

- CLI `json <code>`: one-line JSON with `format`, `kind`, `lat`, `lng`,
  `south`, `west`, `north`, `east`, `resolution_m`, `uncertainty_m`, `area_m2`,
  `altitude_m`, `crs`, `raw` and `as_geouri`, for scripts and AI agents.
- `examples/basic`: a runnable library example (parse, inspect, convert, scan).
- `benchmarks/`: ten `moon bench` cases covering encode, parse, cell conversions,
  covering, scanning and containment.
- CI now runs the example and the benchmark package in addition to the four
  target test matrix.

### Changed

- 59 test blocks (was 55).
- README/demo/application updated with the JSON output, example output and
  benchmark table.
- Version bumped to 0.3.0.

## [0.2.1] - 2026-10-26

### Added

- `Location::to_cell(format, precision)`: explicit point→cell quantisation. It
  returns a new `Location` for the containing cell, so callers can compare the
  new `resolution_m`/`uncertainty_m` with the source's.
- `Location::is_point`.
- CLI `convert <code> <geohash|plus|maidenhead> <precision>`, which prints the
  source and the quantised cell side by side.
- A point→cell example in `docs/location-model.md` showing the 40 m `u=` being
  replaced by a 13.822 m cell (8.323 m uncertainty).

### Changed

- 55 test blocks (was 53).
- README, reproducible demo and the application form describe the explicit
  `to_cell` step and the CLI `convert` command.

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
