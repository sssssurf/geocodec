# Plus Code conformance and decimal boundary contract

Repair version: 0.6.0, 2026-11-07. The reported input `(40.6,129.7)`, length 8,
must encode as **8QGFJP22+**. Version 0.5.0 instead emitted **8QGFJM2X+**.

## Root cause and repair

The digit emitter already used integers, but the entry point first computed
`floor(coordinate * scale)` in binary floating point. For 129.7 the longitude
product can be 1062502399.9999999 rather than the intended integer 1062502400.
The subsequent integer steps faithfully encoded the wrong, preceding cell.

0.6.0 defines coordinate quantization by the Double's **shortest round-trip
decimal representation**. It expands exponent notation and performs decimal
multiplication with integer digits and carries, then floors the exact product.
For negative nonintegral products it floors toward negative infinity.
No decimal places are truncated, no BigInt/runtime dependency is introduced,
and no uniform epsilon moves all nearby coordinates across the boundary.
After quantization, the existing integer pair/grid emitter remains unchanged.

Every fractional-step intermediate is below ten times the integer scale
(25,000,000 for latitude; 8,192,000 for longitude). The integer part is bounded
by the already validated latitude/normalized longitude, so Int64 arithmetic
does not overflow. The decimal expansion also handles very small exponents.

This is an explicit numerical input contract, not a claim that a Double
remembers the caller's original text. For exact decimal data, callers should
preserve their text independently; Location.raw retains parsed source text.
Distinct shortest decimal spellings immediately below/above a grid boundary
remain distinct under this contract.

## Independent expectations and unchanged fixtures

All four original Google OLC CSV files are retained **without changes** under
data/olc, pinned to commit
[83986da0156bbf51fba33d0327d8ca4b7f955c89](https://github.com/google/open-location-code/tree/83986da0156bbf51fba33d0327d8ca4b7f955c89/test_data).
Their Git blob identifiers, SHA-256 hashes and row counts are recorded in
data/olc/provenance.json. The upstream Apache-2.0 license is retained.

| Corpus | Cases | Assertion |
| --- | ---: | --- |
| encoding.csv | 302 | exact expected code string |
| decoding.csv | 420 | code length and all four bounds |
| validityTests.csv | 25 | valid/short/full verdicts |
| shortCodeTests.csv | 19 | shortening and/or nearest recovery as prescribed |
| Total | 766 | every published row is exercised |

Against the unmodified 0.5.0 encoder these encoding fixtures reproduced exactly
**13 incorrect codes**. Inputs, official expectations and observed old results
are retained in data/olc/encoding-regressions.json; none are treated as accepted
differences or deleted from the tests. All 302 encoding cases pass after repair.
The oracle is the published expected-code column, not a local round trip or a
new call to an upstream floating encoder that could reproduce the same defect.

Additional adjacent-IEEE754 tests cover the reported boundary at lengths 8,
10 and 15. Python Decimal applied to the shortest input representation supplies
exact integer coordinates; the pinned original Google encodeIntegers operation
supplies independent code digits. For example:

| Latitude | Longitude | Length 8 |
| --- | --- | --- |
| 40.6 | 129.7 | 8QGFJP22+ |
| 40.599999999999994 | 129.7 | 8QGFHPX2+ |
| 40.60000000000001 | 129.7 | 8QGFJP22+ |
| 40.6 | 129.69999999999996 | 8QGFJM2X+ |
| 40.6 | 129.70000000000002 | 8QGFJP22+ |

The private quantizer also has direct sign, negative-floor and tiny-exponent
regressions. These are additional checks, not substitutions for official rows.

## API adaptation and tolerances

- LatLng::new rejects latitude outside [-90,90], while upstream encoding
  fixtures include 24 cases for clipping out-of-range latitude. The fixture
  adapter explicitly calls clamp_lat before the validating constructor for
  every row. No such row is skipped or claimed to make LatLng accept it.
- Longitudes use LatLng's documented normalization; north-pole encoding uses
  the final legal cell. Code lengths and expected strings come from the CSV.
- Two upstream decoding rows serialize longitude bounds to only ten decimal
  places. Bounds use an absolute 1e-10-degree tolerance, below one thousandth
  of the finest longitude cell. Encoding strings and validity flags are exact.
- Whitespace/case normalization and invalid precision behavior retain the
  library's documented policy; the vector suite is bounded evidence, not a
  proof of complete agreement for every input and upstream language port.

## Continuous regression and reproduction

```bash
node scripts/gen-olc-tests.mjs --check
moon test --target js
moon test --target wasm
moon test --target wasm-gc
moon test --target native
moon run --target js examples/safety
```

CI verifies every original fixture hash, compares offline generated assertions,
runs all targets, and asserts the actual CLI boundary output. No network or
reference-language runtime is required by those tests. The separate registry
consumer runs the public safety example, including the boundary and its two
lower neighbors. Results: docs/verification-results.json and
docs/published-consumer-results.json. Official acceptance status is separate.


## November9 input-chain audit (0.7.0)

The previous direct-Double vector checks did not exercise text ingestion. The
same302 encoding blocks now also assert278 applicable decimal text paths and
256 valid geo URI paths. Core/string correctly rounded conversion replaces the
hand-accumulated fractional parser. These are extra entry assertions, not766
new independent vectors. See 完整复核.md for additional geometry/budget fixes.
