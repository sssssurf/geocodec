// Benchmarks for the hot paths.
//
// Run them with:
//   moon bench benchmarks
//
// The numbers are not a machine-independent promise; they are here to catch an
// order-of-magnitude regression and to show where the time goes: string work in
// the codecs, arithmetic in the cell model, and token scanning in `parse_codes`.

///|
let bench_point : @geocodec.LatLng = @geocodec.LatLng::new(39.9042, 116.4074).unwrap()

///|
let bench_cell : @geocodec.Location = @geocodec.parse_location("8FVC9G8F+6X").unwrap()

///|
let bench_box : @geocodec.BoundingBox = @geocodec.BoundingBox::new(
  39.90, 116.40, 39.91, 116.41,
).unwrap()

///|
let bench_text : String = "Meet at 8FVC9G8F+6X near IO91WM, or send geo:48.198634,16.371648;u=40 and wx4g0b."

///|
test "bench: geohash encode" (it : @bench.T) {
  it.bench(fn() { it.keep(@geocodec.geohash_encode(bench_point, 9)) })
}

///|
test "bench: plus code encode" (it : @bench.T) {
  it.bench(fn() {
    it.keep(@geocodec.pluscode_encode(bench_point, code_length=10))
  })
}

///|
test "bench: maidenhead encode" (it : @bench.T) {
  it.bench(fn() {
    it.keep(@geocodec.maidenhead_encode(bench_point, precision=8))
  })
}

///|
test "bench: parse a plus code" (it : @bench.T) {
  it.bench(fn() { it.keep(@geocodec.parse_location("8FVC9G8F+6X")) })
}

///|
test "bench: parse a geo uri with u=" (it : @bench.T) {
  it.bench(fn() {
    it.keep(@geocodec.parse_location("geo:48.198634,16.371648;u=40"))
  })
}

///|
test "bench: cell to geo uri" (it : @bench.T) {
  it.bench(fn() { it.keep(bench_cell.to_geouri()) })
}

///|
test "bench: point to plus cell" (it : @bench.T) {
  it.bench(fn() { it.keep(bench_cell.to_cell(@geocodec.PlusCode, 10)) })
}

///|
test "bench: geohash cover" (it : @bench.T) {
  it.bench(fn() {
    it.keep(@geocodec.geohash_cover(bench_box, 7, max_cells=200))
  })
}

///|
test "bench: scan a sentence" (it : @bench.T) {
  it.bench(fn() { it.keep(@geocodec.parse_codes(bench_text)) })
}

///|
test "bench: region containment" (it : @bench.T) {
  it.bench(fn() { it.keep(bench_cell.contains(bench_cell)) })
}
