// Total-function checks: malformed text and extreme numbers must come back as
// `None` or `false`, never as a panic. A panic fails the test, so the absence
// of one is the assertion.

///|
test "every parser survives malformed text" {
  let samples = [
    "",
    " ",
    "!!!",
    "+",
    "-",
    "++",
    "0",
    "zzzzzzzzzzzzz",
    "999999999999999999",
    "北京市",
    "geo:",
    "geo:abc",
    "geo:1,2,3,4",
    "1e999",
    "--",
    "NaN",
    "Infinity",
    "8FVC9G8F+",
    "8FVC9G8F+6W+",
    "18SUJ",
    "IO91",
    "u4pruydqqvj!",
    "a".repeat(10000),
  ]
  for s in samples {
    let _ = geohash_bounds(s)
    let _ = geohash_decode(s)
    let _ = pluscode_bounds(s)
    let _ = pluscode_is_valid(s)
    let _ = maidenhead_bounds(s)
    let _ = parse_location(s)
    let _ = parse_codes(s)
    let _ = describe_code(s)
    let _ = geouri_parse(s)
    let _ = parse_dms(s, true)
    let _ = parse_dms(s, false)
    let _ = parse_decimal(s)
  }
}

///|
test "extreme numeric inputs stay total" {
  let p = LatLng::new(0.0, 0.0).unwrap()
  assert_true(geohash_encode(p, 0) is None)
  assert_true(geohash_encode(p, 99) is None)
  assert_true(pluscode_encode(p, code_length=1) is None)
  assert_true(pluscode_encode(p, code_length=9) is None)
  assert_true(maidenhead_encode(p, precision=0) is None)
  assert_true(parse_dms("1e999", true) is None)
  assert_true(parse_decimal("1e999") is None)
  assert_true(geouri_parse("geo:0,0;u=1e999") is None)
}

///|
test "covers reject invalid sizes and precision" {
  let box = BoundingBox::new(-1.0, -1.0, 1.0, 1.0).unwrap()
  assert_true(geohash_cover(box, 0) is None)
  assert_true(geohash_cover(box, 13) is None)
  assert_true(geohash_cover(box, 6, max_cells=0) is None)
  assert_true(geohash_cover(box, 12, max_cells=10) is None)
  assert_true(
    geohash_cover(BoundingBox::new(0.0, 0.0, 0.0, 0.0).unwrap(), 12)
    .unwrap()
    .length() ==
    1,
  )
}

///|
test "random ASCII tokens never panic" {
  let alphabet = chars_of("abcdefghijklmnopqrstuvwxyz0123456789+-. ,;:°′″")
  let mut seed = 20261023L
  for _ in 0..<200 {
    seed = seed * 48271L % 2147483647L
    let length = (seed % 41L).to_int()
    let token : Array[Char] = []
    for _ in 0..<length {
      seed = seed * 48271L % 2147483647L
      token.push(alphabet[(seed % alphabet.length().to_int64()).to_int()])
    }
    let text = string_of(token)
    let _ = parse_location(text)
    let _ = parse_codes(text)
    let _ = describe_code(text)
    let _ = geohash_bounds(text)
    let _ = pluscode_bounds(text)
    let _ = maidenhead_bounds(text)
    let _ = geouri_parse(text)
    let _ = parse_dms(text, true)
  }
}
