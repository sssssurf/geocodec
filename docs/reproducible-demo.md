# Reproducible demo

Every command below was run from the repository root on Windows with the
toolchain recorded in the first section. The output is copied from that run, so
a reviewer can compare it with a fresh run rather than trusting a screenshot.

## 1. Environment

```text
$ moon version --all
moon 0.1.20260608 (60bc8c3 2026-06-08)
moonc v0.10.0+e66899a54 (2026-06-09)
moonrun 0.1.20260608 (60bc8c3 2026-06-08)
```

The repository is built and tested with that toolchain locally. CI installs the
current release from `cli.moonbitlang.com` and runs the same commands, so the
code is also exercised on a newer compiler. `native` additionally needs a system
C compiler; the JS and wasm-gc targets do not.

## 2. Build, format and test

```text
$ moon fmt --check
Finished.

$ moon check --target js
Finished.

$ moon test --target js
Total tests: 53, passed: 53, failed: 0.

$ moon test --target wasm-gc
Total tests: 53, passed: 53, failed: 0.
```

The `Finished.` lines also carry a task count that depends on the build cache,
so it is omitted here; the exit status is what matters.

The CLI is an ordinary main package, so it is built by the same commands:

```text
$ moon build --target js cmd/main
Finished.
```

## 3. End-to-end demo

```text
$ moon run --target js cmd/main -- demo
== Beijing ==
point: 39.904200, 116.407400
dms: 39°54′15.12″N 116°24′26.64″E
geohash: wx4g0bm6c
plus: 8PFRWC34+MX
maidenhead: OM89EV87
== London ==
point: 51.507400, -0.127800
dms: 51°30′26.64″N 0°07′40.08″W
geohash: gcpvj0duq
plus: 9C3XGV4C+XV
maidenhead: IO91WM41
== Sydney ==
point: -33.868800, 151.209300
dms: 33°52′07.68″S 151°12′33.48″E
geohash: r3gx2f77b
plus: 4RRH46J5+FP
maidenhead: QF56OD51
```

The demo is deterministic: it uses three fixed points and no clock, locale or
random source.

## 4. Individual operations

### 4.1 Parse without being told the notation

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
```

`8FVC9G8F+6X` is a cell: the region is exact, the longer side is 13.822 m, and
reducing it to its centre costs up to 8.365 m (half the diagonal). `as_geouri`
writes that radius as `;u=`, so a `geo:`-only consumer still gets a covering
circle; the rectangle shape is kept in `region`.

### 4.2 Encode the three cell codecs

```text
$ moon run --target js cmd/main -- geohash 39.9042 116.4074 9
geohash: wx4g0bm6c
point: 39.904200, 116.407400
dms: 39°54′15.12″N 116°24′26.64″E
bounds: 39.904189,116.407399,39.904232,116.407442
center: 39.904211, 116.407421

$ moon run --target js cmd/main -- plus 39.9042 116.4074 10
plus: 8PFRWC34+MX
point: 39.904200, 116.407400
dms: 39°54′15.12″N 116°24′26.64″E
bounds: 39.904125,116.407375,39.904250,116.407500
center: 39.904188, 116.407438

$ moon run --target js cmd/main -- maidenhead 51.5074 -0.1278 6
maidenhead: IO91WM
point: 51.507400, -0.127800
dms: 51°30′26.64″N 0°07′40.08″W
bounds: 51.500000,-0.166667,51.541667,-0.083333
center: 51.520833, -0.125000
```

### 4.3 Scan prose for codes

```text
$ moon run --target js cmd/main -- scan "Meet at 8FVC9G8F+6X near IO91WM, or send geo:48.198634,16.371648;u=40 and wx4g0b."
found: 4
plus-code: 47.365562, 8.524938 [cell, 13.8 m]
maidenhead: 51.520833, -0.125000 [cell, 5772.2 m]
geo-uri: 48.198634, 16.371648 [point, 80.0 m]
geohash: 39.905090, 116.405640 [cell, 938.2 m]
```

The words "Meet", "at", "near", "or", "send" and "and" are not reported. Some of
them ("meet", "send") are legal geohash strings; the scanner requires a digit
and at least five characters before accepting a geohash, which is what keeps
the prose readable.

### 4.4 Cover a box with geohash cells

```text
$ moon run --target js cmd/main -- cover 39.900 116.400 39.905 116.405 7
cells: 20
wx4fbxx
wx4fbz8
wx4fbz9
wx4fbzd
wx4fbze
wx4fbxz
wx4fbzb
wx4fbzc
wx4fbzf
wx4fbzg
wx4g08p
wx4g0b0
wx4g0b1
wx4g0b4
wx4g0b5
wx4g08r
wx4g0b2
wx4g0b3
wx4g0b6
wx4g0b7
```

The order is ascending latitude, then ascending longitude (within the two
longitude segments when the box crosses the date line). The list is capped by
the optional `max` argument; exceeding the cap is an error, not a truncation.

### 4.5 Describe a cell

```text
$ moon run --target js cmd/main -- info "8FVC9G8F+6X"
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
```

The 10-digit Plus Code cell is 0.000125° on a side; at 47.4°N that is about
13.8 m of latitude and 9.4 m of longitude, so the reported longer side is 13.8 m,
the half-diagonal is 8.365 m and the area is about 130 m².

### 4.6 Geo URI and DMS

```text
$ moon run --target js cmd/main -- geouri "geo:48.198634,16.371648;u=40"
format: geo-uri
kind: point
point: 48.198634, 16.371648
dms: 48°11′55.08″N 16°22′17.93″E
region: 48.198272,16.371109,48.198996,16.372187
resolution_m: 80.000
uncertainty_m: 40.000
area_m2: 6400.000
altitude_m: (none)
crs: wgs84
raw: geo:48.198634,16.371648;u=40
as_geouri: geo:48.198634,16.371648;u=40

$ moon run --target js cmd/main -- dms 51.5074 lat
51°30′26.64″N
```

## 5. Error paths are part of the demo

These inputs are wrong on purpose; the point is that the program reports them
and exits normally instead of panicking.

```text
$ moon run --target js cmd/main -- parse "geo:91,0"
parse: not recognised

$ moon run --target js cmd/main -- geohash 0 0 13
geohash: precision must be between 1 and 12

$ moon run --target js cmd/main -- plus 0 0 7
plus: length must be 2, 4, 6, 8, 10, 11, 12, 13, 14 or 15

$ moon run --target js cmd/main -- cover 0 0 10 10 10 10
cover: too many cells, or an invalid precision

$ moon run --target js cmd/main -- bbox "not-a-code"
bbox: not a recognised code
```

## 6. What to check

1. `moon test` reports 53 passing tests.
2. `moon run --target js cmd/main -- demo` prints three blocks, and the codes
   match section 3.
3. `moon run --target js cmd/main -- parse "8FVC9G8F+6X"` reports
   `format: plus-code`, not `geohash`.
4. `moon run --target js cmd/main -- scan ...` reports exactly four results and
   does not return "Meet" or "send".
5. Bad input in section 5 returns a message, not a stack trace.

## 7. Acceptance evidence

| Requirement | Evidence in this repository |
| --- | --- |
| MoonBit is the main language | all source files are `.mbt`; `moon.mod` lists no third-party dependency |
| Public repository with traceable history | `git log` contains the feature/test/docs commits in development order |
| Buildable, runnable, reproducible | sections 1–5 above; `moon test`, `moon run` |
| Substantial work in this round | the whole module is new; `CHANGELOG.md` records 0.1.0 |
| Open-source compliance | `LICENSE` (Apache-2.0); `README.md` lists standards and states that no code was ported |
| Explainable AI use | `docs/development-retrospective.md` records the decisions, the rejected alternatives and the role of the AI assistant |
