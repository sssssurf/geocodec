# geocodec

Location codes for MoonBit: Geohash, Plus Codes, Maidenhead locators, `geo:`
URIs and degrees/minutes/seconds.

`geocodec` converts between the short codes people read, print and text, and
returns a validated `LatLng`, the bounds of the cell, its neighbours, the cells
covering a box, and the codes found inside a sentence. It is dependency-free,
does no I/O, and every public function is total: invalid input becomes `None` or
`false`, never an exception.

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

Plus `LatLng`, `BoundingBox` (antimeridian aware), `parse_location`,
`parse_codes` for free text, `describe_code` for cell size and `geohash_cover`
for box coverage.

## Install and run

```bash
moon add sssssurf/geocodec   # once the first mooncakes release is published
moon run --target js cmd/main -- demo
```

The CLI has the subcommands `parse`, `geohash`, `plus`, `maidenhead`, `bbox`,
`geouri`, `dms`, `scan`, `cover`, `info` and `demo`. See `README.md` in the
repository for recorded output.

## Boundaries

This is the notation layer only. It does not implement UTM/MGRS, ellipsoidal
geodesics, datum transformations (GCJ-02/BD-09), address lookup or polygon
operations. For geodesy and grid references, use `ChrisTu117/moongeodesy`; this
library deliberately does not duplicate it.

## Tests

46 test blocks: published vectors, round-trips at every precision, deterministic
property tests, cover checks and a robustness pass over malformed input.
`moon test` passes on `js` and `wasm-gc`; CI also builds `wasm` and `native`.

## License

Apache-2.0. Formulas come from the OLC specification, RFC 5870, the geohash
description and the IARU locator scheme; no code was ported.
