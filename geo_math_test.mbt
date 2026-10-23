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
}
