# Reproducible review evidence

Verified on 2026-10-28 with moon 0.1.20261023 and moonc 0.10.17.
Windows runs js/wasm/wasm-gc; native is tested in WSL Ubuntu 24.04 with GCC.

Run from the repository root:

```bash
moon check
moon test --target js
moon test --target wasm
moon test --target wasm-gc
moon test --target native
node scripts/check-docs.mjs
node scripts/check-semantics.mjs
```

72 test blocks. Actual target results are recorded in docs/verification-results.json.

The snapshots below are checked by scripts/check-docs.mjs; --update refreshes
them from actual commands, never manually invented values.

```text
$ moon run --target js cmd/main -- parse "8FVC9G8F+6X"
format: plus-code
kind: cell
point: 47.365562, 8.524938
dms: 47°21′56.02″N 8°31′29.78″E
region: 47.365500,8.524875,47.365625,8.525000
resolution_m: 13.822
uncertainty_m: 8.431896801848
cell_radius_m: 8.431896801848
uncertainty_known: true
area_m2: 130.268
altitude_m: (none)
crs: wgs84
raw: 8FVC9G8F+6X
as_geouri: geo:47.3655625,8.5249375;u=8.433
```

```text
$ moon run --target js cmd/main -- convert "geo:48.198634,16.371648;u=40" plus 10
source:
format: geo-uri
kind: point
point: 48.198634, 16.371648
dms: 48°11′55.08″N 16°22′17.93″E
region: 48.198272,16.371105,48.198996,16.372191
resolution_m: 80.000
uncertainty_m: 40
cell_radius_m: (none)
uncertainty_known: true
area_m2: 6400.000
altitude_m: (none)
crs: wgs84
raw: geo:48.198634,16.371648;u=40
as_geouri: geo:48.198634,16.371648;u=40
converted:
format: plus-code
kind: cell
point: 48.198688, 16.371688
dms: 48°11′55.27″N 16°22′18.08″E
region: 48.198625,16.371625,48.198750,16.371750
resolution_m: 13.822
uncertainty_m: 47.42825996046298
cell_radius_m: 8.38996791079724
uncertainty_known: true
area_m2: 128.197
altitude_m: (none)
crs: wgs84
raw: 8FWR59XC+FM
as_geouri: geo:48.1986875,16.3716875;u=47.429
source_uncertainty_bound_m: 47.42825996046298
```

```text
$ moon run --target js cmd/main -- json "geo:1,2"
{"format":"geo-uri","kind":"point","lat":1,"lng":2,"south":1,"west":2,"north":1,"east":2,"resolution_m":0,"uncertainty_m":null,"cell_radius_m":null,"uncertainty_known":false,"area_m2":0,"altitude_m":null,"crs":"wgs84","raw":"geo:1,2","as_geouri":"geo:1,2"}
```

```text
$ moon run --target js cmd/main -- json "geo:1,2;u=0"
{"format":"geo-uri","kind":"point","lat":1,"lng":2,"south":1,"west":2,"north":1,"east":2,"resolution_m":0,"uncertainty_m":0,"cell_radius_m":null,"uncertainty_known":true,"area_m2":0,"altitude_m":null,"crs":"wgs84","raw":"geo:1,2;u=0","as_geouri":"geo:1,2;u=0"}
```

```text
$ moon run --target js cmd/main -- parse "geo:1,2;crs=custom-grid"
parse: not recognised
```

```text
$ moon run --target js examples/basic
format: plus-code
kind: cell
point: 47.365562, 8.524938
region: 47.365500,8.524875,47.365625,8.525000
resolution_m: 13.822
uncertainty_m: 8.432
as_geouri: geo:47.3655625,8.5249375;u=8.433
as_geohash6: u0qj3y (828.4 m)
scanned: 3
  plus-code 47.365562, 8.524938
  maidenhead 51.520833, -0.125000
  geo-uri 48.198634, 16.371648
```

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

The 40 m source accuracy remains in the conversion record. The target cell
geometry is finer; source_uncertainty_bound_m is the propagated bound around
the new centre. Unknown accuracy differs from explicit u=0 in JSON. Unsupported
CRSs are rejected by the WGS84 model. See location-model.md for approximation
and conversion-loss semantics.


The following safety example uses only the public library API:

```text
$ moon run --target js examples/safety
unknown_is_none: true
chained_unknown_is_none: true
chained_URI_omits_u: true
explicit_zero: true
unknown_CRS_rejected: true
tiny_u_preserved: true
fine_grid_keeps_40m_bound: true
grid_radius_below_1cm: true
```

Unknown accuracy also remains unknown after quantisation:

```text
$ moon run --target js cmd/main -- convert "geo:1,2" plus 10
source:
format: geo-uri
kind: point
point: 1.000000, 2.000000
dms: 1°00′00.00″N 2°00′00.00″E
region: 1.000000,2.000000,1.000000,2.000000
resolution_m: 0.000
uncertainty_m: (unspecified)
cell_radius_m: (none)
uncertainty_known: false
area_m2: 0.000
altitude_m: (none)
crs: wgs84
raw: geo:1,2
as_geouri: geo:1,2
converted:
format: plus-code
kind: cell
point: 1.000062, 2.000063
dms: 1°00′00.22″N 2°00′00.23″E
region: 1.000000,2.000000,1.000125,2.000125
resolution_m: 13.913
uncertainty_m: (unspecified)
cell_radius_m: 9.872226609732248
uncertainty_known: false
area_m2: 192.300
altitude_m: (none)
crs: wgs84
raw: 6FH42222+22
as_geouri: geo:1.0000625,2.0000625
source_uncertainty_bound_m: (unspecified)
```

Tiny positive uncertainty survives JSON and URI formatting:

```text
$ moon run --target js cmd/main -- json "geo:1.123456789123,2;u=0.0000001"
{"format":"geo-uri","kind":"point","lat":1.123456789123,"lng":2,"south":1.1234567891220957,"west":1.9999999999990954,"north":1.1234567891239045,"east":2.0000000000009046,"resolution_m":0.00000020000000000000004,"uncertainty_m":0.00000010000000000000002,"cell_radius_m":null,"uncertainty_known":true,"area_m2":0.00000000000004000000000000002,"altitude_m":null,"crs":"wgs84","raw":"geo:1.123456789123,2;u=0.0000001","as_geouri":"geo:1.123456789123,2;u=0.0000001"}
```
