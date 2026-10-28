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

///|
test "unknown CRSs never escape through either public parser" {
  for
    crs in ["custom-grid", "GCJ-02", "bd09", "epsg-3857", "epsg4326", "wgs-84"] {
    for coordinates in ["1,2", "500000,4649776", "1,2,3"] {
      let input = "geo:" + coordinates + ";crs=" + crs + ";u=40"
      assert_true(geouri_parse(input) is None)
      assert_true(parse_location(input) is None)
      assert_eq(parse_codes(input).length(), 0)
    }
  }
  for crs in ["wgs84", "WGS84", "WgS84"] {
    assert_true(geouri_parse("geo:1,2;crs=" + crs) is Some(_))
  }
}

///|
test "URI formatting never rounds a positive uncertainty to zero" {
  for
    text in [
      "geo:1.123456789123,2.987654321987;u=0.0000001", "geo:1,2,3.123456789;u=0",
      "GEO:1,180;CRS=WGS84;u=0.0004;label=a%20b", "geo:1,2;foo=bar;flag",
    ] {
    let uri = geouri_parse(text).unwrap()
    assert_eq(geouri_format(uri), text)
    assert_eq(parse_location(text).unwrap().to_geouri(), text)
  }
  assert_true(
    geouri_parse("geo:1,2;u=0.0000001").unwrap().uncertainty.unwrap() > 0.0,
  )
}

///|
test "RFC parameter ordering and extension syntax are validated" {
  for
    text in [
      "geo:1,2;u=40;crs=wgs84",
      "geo:1,2;foo=bar;u=40",
      "geo:1,2;foo=bar;crs=wgs84",
      "geo:1,2;foo=",
      "geo:1,2;foo=a=b",
      "geo:1,2;foo=%xx",
      "geo:1,2;foo=%2",
      "geo:1,2;foo=hello world",
      "geo:1,2;crs=wgs84;u=1;U=2",
      "geo:1,2;u=0." + "0".repeat(400) + "1",
    ] {
    assert_true(geouri_parse(text) is None)
  }
  assert_true(geouri_parse("geo:1,2;crs=wgs84;u=40;foo=%20;flag") is Some(_))
}
