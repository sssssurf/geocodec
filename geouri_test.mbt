///|
test "geo uri parses coordinates and optional parameters" {
  let uri = geouri_parse("geo:48.198634,16.371648;crs=wgs84;u=40").unwrap()
  assert_true((uri.point.lat() - 48.198634).abs() < 1.0e-12)
  assert_true((uri.point.lng() - 16.371648).abs() < 1.0e-12)
  assert_eq(uri.uncertainty.unwrap(), 40.0)
  assert_eq(uri.crs.unwrap(), "wgs84")
  assert_true(uri.altitude is None)
}

///|
test "geo uri handles altitude and case-insensitive scheme" {
  let uri = geouri_parse("GEO:47.36559,8.524997,412.5").unwrap()
  assert_eq(uri.altitude.unwrap(), 412.5)
  assert_true(geouri_parse("geo:47.36559,8.524997,412.5") is Some(_))
}

///|
test "geo uri formatting round-trips" {
  let uri = geouri_parse("geo:48.198634,16.371648;u=40").unwrap()
  let text = geouri_format(uri)
  assert_eq(text, "geo:48.198634,16.371648;u=40")
  let back = geouri_parse(text).unwrap()
  assert_eq(back.point.lat(), uri.point.lat())
  assert_eq(back.point.lng(), uri.point.lng())
}

///|
test "geo uri rejects malformed input" {
  for
    input in [
      "geo:1,2;u", "geo:1,2;u=1;U=2", "geo:1,2;crs=wgs84;CRS=other", "geo:1,181",
      "geo:+1,2", "geo:1,2;u=+1", "geo:1,2;u=1.", "geo:1,2;",
    ] {
    assert_true(geouri_parse(input) is None)
  }
  assert_true(geouri_parse("geo:91,0") is None)
  assert_true(geouri_parse("geo:48.2") is None)
  assert_true(geouri_parse("geo:48.2,16.3;u=-1") is None)
  assert_true(geouri_parse("geo:48.2,16.3;crs=") is None)
  assert_true(geouri_parse("geo:") is None)
  assert_true(geouri_parse("http:48.2,16.3") is None)
  assert_true(geouri_parse("geo:abc,16.3") is None)
}
