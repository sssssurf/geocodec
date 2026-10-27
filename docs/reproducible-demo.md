# Reproducible review evidence

Verified on 2026-10-27 with moon 0.1.20261023 and moonc 0.10.17.
Windows runs js/wasm/wasm-gc; native is tested in WSL Ubuntu 24.04 with GCC.

Run from the repository root:

```bash
moon check
moon test --target js
moon test --target wasm
moon test --target wasm-gc
moon test --target native
node scripts/check-docs.mjs
```

62 test blocks. Target-by-target results are also recorded in the workspace verification report.

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
uncertainty_m: 8.432
uncertainty_known: true
area_m2: 130.268
altitude_m: (none)
crs: wgs84
raw: 8FVC9G8F+6X
as_geouri: geo:47.3655625,8.5249375;u=8.432
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
uncertainty_m: 40.000
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
uncertainty_m: 8.390
uncertainty_known: true
area_m2: 128.197
altitude_m: (none)
crs: wgs84
raw: 8FWR59XC+FM
as_geouri: geo:48.1986875,16.3716875;u=8.391
source_uncertainty_bound_m: 47.428
```

```text
$ moon run --target js cmd/main -- json "geo:1,2"
{"format":"geo-uri","kind":"point","lat":1.000000000,"lng":2.000000000,"south":1.000000000,"west":2.000000000,"north":1.000000000,"east":2.000000000,"resolution_m":0.000,"uncertainty_m":0.000,"uncertainty_known":false,"area_m2":0.000,"altitude_m":null,"crs":null,"raw":"geo:1,2","as_geouri":"geo:1,2"}
```

```text
$ moon run --target js cmd/main -- json "geo:1,2;u=0"
{"format":"geo-uri","kind":"point","lat":1.000000000,"lng":2.000000000,"south":1.000000000,"west":2.000000000,"north":1.000000000,"east":2.000000000,"resolution_m":0.000,"uncertainty_m":0.000,"uncertainty_known":true,"area_m2":0.000,"altitude_m":null,"crs":null,"raw":"geo:1,2;u=0","as_geouri":"geo:1,2;u=0"}
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
as_geouri: geo:47.3655625,8.5249375;u=8.432
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
