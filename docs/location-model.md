# The unified location model

The library parses six notations, but they do not all mean the same kind of
thing. Treating all of them as "a point with a string around it" is the mistake
this model exists to prevent.

## Two families

| Family | Notations | Native value |
| --- | --- | --- |
| **Cell** | Geohash, Plus Code (OLC), Maidenhead | a rectangle at a resolution |
| **Point** | decimal pair, DMS pair, `geo:` URI | a coordinate; `geo:` may also carry `u=` |

A Geohash/Plus Code/Maidenhead string is not a point with decoration: the string
identifies an area. `wx4g0b` is a 938 m × 607 m cell; `8FVC9G8F+6X` is a 13.8 m ×
9.4 m cell. Turning either into its centre throws the area away. Conversely, a
decimal pair or a `geo:` URI is a point; encoding it as a cell necessarily
quantises it to the cell that contains it.

## The `Location` value

```moonbit
pub(all) struct Location {
  format : LocationFormat   // which notation produced it
  kind : LocationKind       // Cell or Point
  point : LatLng            // representative: cell centre, or the coordinate
  region : BoundingBox      // exact cell, uncertainty envelope, or degenerate point
  resolution_m : Double     // longer side of the region, metres
  uncertainty_m : Double    // max distance from point to the region boundary
  area_m2 : Double          // approximate ground area of the region
  altitude_m : Double?      // only from geo: URIs
  crs : String?             // only from geo: URIs
  raw : String              // the original text, never discarded
}
```

Invariants:

- `region` always contains `point`.
- `kind == Cell` means `region` is the exact cell and `point` is its centre.
- `kind == Point` with `u=` means `region` is the square envelope of that
  uncertainty; without `u=` it is a degenerate box at the point.
- `resolution_m` is 0 when the notation carries no extent. The library does not
  invent a precision from the number of decimal digits; a decimal pair is a
  point, and `u=` is the only uncertainty the `geo:` grammar defines.
- `uncertainty_m` is the radius that bounds the region around `point`: for a
  cell it is the distance to a corner; for `u=` it is `u`.
- `area_m2` is the rectangle's ground area; for a point it is 0.

## What conversion loses

| Conversion | What is kept | What is lost | API |
| --- | --- | --- | --- |
| cell → point | centre; `region` and `uncertainty_m` remain on the `Location` | the shape; the point alone is only accurate to `uncertainty_m` | `center()` |
| point → cell | the cell that contains the point, with its bounds | the exact point; error ≤ cell half-diagonal | codec `encode(point, precision)` |
| cell → `geo:` URI | centre plus `;u=<half diagonal>` | rectangle → circle; the circle covers the cell but also points outside it | `to_geouri()` |
| point + `u=` → cell | the cell containing the point | the uncertainty: a cell at finer resolution than `u` pretends to more accuracy than the source had | check `u` against cell size first |
| any notation → `raw` | original text | nothing | field `raw` |

The model never silently drops `region`: `parse_location` returns a `Location`,
not a `LatLng`. A caller that only wants a point calls `center()` and can read
`uncertainty_m` to see what that shortcut costs.

## Examples

### A cell

```text
$ geocodec parse "8FVC9G8F+6X"
format: plus-code
kind: cell
point: 47.365562, 8.524938
region: 47.365500,8.524875,47.365625,8.525000
resolution_m: 13.822
uncertainty_m: 8.365
area_m2: 130.268
raw: 8FVC9G8F+6X
as_geouri: geo:47.365562,8.524938;u=8.365
```

The Plus Code cell is 13.8 m × 9.4 m. If only the centre is kept, the position
is uncertain by up to 8.365 m (half the diagonal). `to_geouri` emits that radius,
so a consumer that only understands `geo:` still gets a bound; the rectangle
becomes a circle, which is a deliberate over-approximation.

### A point with uncertainty

```text
$ geocodec parse "geo:48.198634,16.371648;u=40"
format: geo-uri
kind: point
point: 48.198634, 16.371648
region: 48.198272,16.371109,48.198996,16.372187
resolution_m: 80.000
uncertainty_m: 40.000
area_m2: 6400.000
raw: geo:48.198634,16.371648;u=40
as_geouri: geo:48.198634,16.371648;u=40
```

Encoding this as a 10-digit Plus Code would quantise it to a 13.8 m cell and
silently discard the 40 m uncertainty. The model makes that visible: `u=` is
larger than the target cell, so the caller should keep the point form or choose
a coarser code.

### A plain point

```text
$ geocodec parse "39.9042,116.4074"
format: decimal
kind: point
resolution_m: 0.000
uncertainty_m: 0.000
area_m2: 0.000
```

No precision is invented. The notation says "here is a coordinate"; how many
digits the user typed is a property of the text, not a uniform semantic. If a
caller needs a bound, it should carry one explicitly (`u=` or a cell code).

## API surface

- `parse_location(text) -> Location?` — one notation, full model.
- `parse_codes(text) -> Array[Location]` — free-text scan, full model per hit.
- `describe_code(text) -> Location?` — cell codecs only.
- `Location::center()`, `bounds()`, `is_cell()`.
- `Location::contains_point(p)`, `contains(other)`, `intersects(other)`.
- `Location::to_geouri()` — the only lossy conversion in the API, and it writes
  `u=` so the loss is bounded.
- `Location::raw` — original notation text.

The codec encoders stay point-based: `geohash_encode(point, precision)` is the
explicit quantisation step. The model's job is to make the input semantics
visible, not to forbid quantisation.
