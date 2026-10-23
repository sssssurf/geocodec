///|
test "describe_code reports the cell size of a ten digit plus code" {
  let info = describe_code("8FVC9G8F+6X").unwrap()
  assert_eq(info.format, @geocodec.PlusCode)
  assert_true(info.bounds.contains(info.point))
  // A 10-digit Plus Code cell is 0.000125 degrees on a side.
  assert_true(info.precision_m > 9.0 && info.precision_m < 14.0)
  assert_true(info.area_m2 > 80.0 && info.area_m2 < 160.0)
}

///|
test "describe_code reports a geohash and a locator" {
  let gh = describe_code("wx4g0b").unwrap()
  assert_eq(gh.format, @geocodec.GeoHash)
  assert_true(gh.precision_m > 800.0 && gh.precision_m < 1100.0)
  let mh = describe_code("IO91WM").unwrap()
  assert_eq(mh.format, @geocodec.Maidenhead)
  assert_true(mh.precision_m > 5000.0 && mh.precision_m < 6500.0)
}

///|
test "describe_code rejects text that is not a code" {
  assert_true(describe_code("") is None)
  assert_true(describe_code("not a code") is None)
  assert_true(describe_code("not+a+code") is None)
}
