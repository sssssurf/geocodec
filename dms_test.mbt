///|
test "dms accepts the usual human spellings" {
  let a = parse_dms("51°30′26.5″N", true).unwrap()
  assert_true((a - 51.50736111111111).abs() < 1.0e-9)
  let b = parse_dms("51 30 26.5 S", true).unwrap()
  assert_true((b + 51.50736111111111).abs() < 1.0e-9)
  let c = parse_dms("51d30m26.5sN", true).unwrap()
  assert_true((c - 51.50736111111111).abs() < 1.0e-9)
  let d = parse_dms("51:30:26.5N", true).unwrap()
  assert_true((d - 51.50736111111111).abs() < 1.0e-9)
  assert_eq(parse_dms("-51.5", true).unwrap(), -51.5)
  assert_eq(parse_dms("116.4E", false).unwrap(), 116.4)
  assert_eq(parse_dms("116.4W", false).unwrap(), -116.4)
}

///|
test "dms rejects out-of-range components" {
  assert_true(parse_dms("51 60 0", true) is None)
  assert_true(parse_dms("51 30 60", true) is None)
  assert_true(parse_dms("91", true) is None)
  assert_true(parse_dms("181", false) is None)
  assert_true(parse_dms("", true) is None)
  assert_true(parse_dms("51N", false) is None)
  assert_true(parse_dms("51E", true) is None)
  assert_true(parse_dms("51 30 26.5 N extra", true) is None)
}

///|
test "dms formatting is stable" {
  assert_eq(format_dms(51.50736111111111, true), "51°30′26.50″N")
  assert_eq(format_dms(-0.5, false), "0°30′00.00″W")
  assert_eq(format_dms(0.0, true), "0°00′00.00″N")
}
