///|
test "decimal integer quantization handles signs fractions and exponents exactly" {
  for
    (value, expected) in [
      (40.6, 1015000000L),
      (-34.45, -861250000L),
      (0.00000004, 1L),
      (-0.00000004, -1L),
      (0.000000001, 0L),
      (-0.000000001, -1L),
      (1.0e-200, 0L),
      (-1.0e-200, -1L),
      (90.0, 2250000000L),
    ] {
    assert_eq(olc_decimal_floor(value, 25000000L), expected)
  }
  assert_eq(olc_decimal_floor(129.7, 8192000L), 1062502400L)
  assert_eq(olc_decimal_floor(-64.23, 8192000L), -526172160L)
}
