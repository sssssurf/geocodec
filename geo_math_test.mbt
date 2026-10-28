///|
test "format_fixed keeps a stable number of decimals" {
  assert_eq(format_fixed(39.9, 4), "39.9000")
  assert_eq(format_fixed(-0.125, 2), "-0.13")
  assert_eq(format_fixed(0.0, 3), "0.000")
  assert_eq(format_fixed(1234.0, 0), "1234")
}

///|
test "longitudes normalise into the half-open range" {
  assert_eq(normalize_lng(190.0), -170.0)
  assert_eq(normalize_lng(-190.0), 170.0)
  assert_eq(normalize_lng(180.0), -180.0)
  assert_eq(normalize_lng(0.0), 0.0)
  assert_true(normalize_lng(1.0e100) >= -180.0)
  assert_true(normalize_lng(-1.0e100) < 180.0)
}

///|
test "RFC decimal formatting preserves small and large finite doubles" {
  for value in [0.0, 0.0000001, -0.0000001, 1.0e20, 1.0e-200] {
    let text = decimal_notation(value)
    assert_false(text.contains("e"))
    let back = parse_decimal(text).unwrap()
    if value == 0.0 {
      assert_eq(back, 0.0)
    } else {
      assert_true((back / value - 1.0).abs() < 1.0e-12)
    }
  }
}
