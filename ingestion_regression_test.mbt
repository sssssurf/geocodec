///|
test "text coordinates round identically to direct Double inputs" {
  for
    (text, lat, lng, length, expected) in [
      ("-2.804,7.003", -2.804, 7.003, 13, "6F9952W3+C6222"),
      ("-25.798,-59.812", -25.798, -59.812, 10, "5862652Q+R6"),
    ] {
    let point = parse_location(text).unwrap()
    assert_eq(point.point.lat(), lat)
    assert_eq(point.point.lng(), lng)
    assert_eq(point.to_cell(@geocodec.PlusCode, length).unwrap().raw, expected)
    let uri = parse_location("geo:" + text).unwrap()
    assert_eq(uri.to_cell(@geocodec.PlusCode, length).unwrap().raw, expected)
  }
}

///|
test "decimal conversion rejects overflow and keeps tiny positive u positive" {
  assert_true(parse_decimal("9".repeat(400)) is None)
  assert_true(geouri_parse("geo:1,2;u=" + "9".repeat(400)) is None)
  assert_eq(parse_decimal("0.0000001"), Some(0.0000001))
  assert_true(
    geouri_parse("geo:1,2;u=0.0000001").unwrap().uncertainty.unwrap() > 0.0,
  )
  assert_true(geouri_parse("geo:1,2;u=0." + "0".repeat(400) + "1") is None)
}

///|
test "known uncertainty cannot overflow derived fields or become unknown on conversion" {
  let maximum = "17976931348623157" + "0".repeat(292)
  let uri = "geo:0,0;u=" + maximum
  // The finite input and original text are still representable at the URI
  // layer. Location refuses an unrepresentable derived diameter explicitly.
  assert_true(geouri_parse(uri).unwrap().uncertainty is Some(_))
  assert_eq(geouri_format(geouri_parse(uri).unwrap()), uri)
  assert_true(parse_location(uri) is None)
  let huge = parse_location("geo:0,0;u=1" + "0".repeat(300)).unwrap()
  assert_true(is_finite(huge.resolution_m))
  assert_true(is_finite(huge.area_m2))
  let converted = huge.to_cell(@geocodec.PlusCode, 10).unwrap()
  assert_true(converted.uncertainty_m is Some(_))
  assert_true(is_finite(converted.uncertainty_m.unwrap()))
  let close_to_limit = parse_location(
    "geo:0,0;u=" + "8988465674311578" + "0".repeat(292),
  ).unwrap()
  assert_true(is_finite(close_to_limit.resolution_m))
  // An additional positive propagation margin cannot be represented while
  // keeping a finite diameter; the whole conversion fails, not just its u.
  assert_true(close_to_limit.to_cell(@geocodec.PlusCode, 10) is None)
}

///|
test "cover budgets are checked before a 32-bit product can overflow" {
  // At precision 10 this spans about 50,001 * 50,001 cells. The product
  // exceeds Int32.max; a multiply-first check wraps and attempts enumeration.
  let step_lat = 180.0 / 33554432.0
  let step_lng = 360.0 / 33554432.0
  let box = BoundingBox::new(
    -90.0,
    -180.0,
    -90.0 + 50000.0 * step_lat,
    -180.0 + 50000.0 * step_lng,
  ).unwrap()
  assert_true(geohash_cover(box, 10, max_cells=2147483647) is None)
}

///|
test "crossing cover budgets unique cells when coarse column intervals overlap" {
  let box = BoundingBox::new(-1.0, 170.0, 1.0, 160.0).unwrap()
  let cells = geohash_cover(box, 1, max_cells=16).unwrap()
  assert_eq(cells.length(), 16)
  let seen : Array[String] = []
  for cell in cells {
    assert_false(seen.contains(cell))
    seen.push(cell)
  }
  assert_true(geohash_cover(box, 1, max_cells=15) is None)
  assert_eq(geohash_cover(box, 1, max_cells=100).unwrap().length(), 16)
}

///|
test "inclusive date-line edges use the same longitude as normalized points" {
  let east = BoundingBox::new(-1.0, 179.0, 1.0, 180.0).unwrap()
  let west = BoundingBox::new(-1.0, -180.0, 1.0, -179.0).unwrap()
  let edge = LatLng::new(0.0, 180.0).unwrap()
  assert_eq(edge.lng(), -180.0)
  assert_true(east.contains(edge))
  assert_true(west.contains(edge))
  assert_true(east.intersects(west))
  assert_true(west.intersects(east))
  let only_edge = BoundingBox::new(-1.0, 180.0, 1.0, 180.0).unwrap()
  assert_true(only_edge.contains(only_edge.center().unwrap()))
  // Use a known east-edge cell rather than inventing a different longitude.
  let date_cell = describe_code(
    pluscode_encode(LatLng::new(0.0, 179.99999).unwrap(), code_length=10).unwrap(),
  ).unwrap()
  let date_point = parse_location("geo:0,-180;u=0").unwrap()
  assert_true(date_cell.contains_point(date_point.point))
  assert_true(date_cell.contains(date_point))
}

///|
test "DMS sign plus hemisphere cannot silently reverse the direction" {
  for text in ["-51S", "-51N", "+51S", "+51N"] {
    assert_true(parse_dms(text, true) is None)
  }
  assert_true(parse_location("-51S,2E") is None)
  assert_eq(parse_dms("51S", true), Some(-51.0))
  assert_eq(parse_dms("-51", true), Some(-51.0))
}

///|
test "lowercase seconds unit and uppercase south direction are distinguished" {
  let positive = parse_dms("51d30m26.5s", true).unwrap()
  assert_true(positive > 51.5 && positive < 51.51)
  assert_eq(parse_dms("-51d30m26.5s", true).unwrap(), -positive)
  assert_eq(parse_dms("51d30m26.5S", true).unwrap(), -positive)
  assert_eq(parse_dms("51d30m26.5sS", true).unwrap(), -positive)
  assert_true(parse_location("51d30m26.5s,2E").unwrap().point.lat() > 0.0)
}

///|
test "explicit DMS units cannot be reordered duplicated or start at minutes" {
  for
    input in [
      "51m30d", "51°30°", "30m", "26.5sN", "51d30sN", "51dd30m", "51d30m26.5m",
      "51°30′26.5′N",
    ] {
    assert_true(parse_dms(input, true) is None)
  }
  assert_true(parse_location("51m30d,2E") is None)
  assert_eq(parse_dms("51d30m", true), Some(51.5))
  assert_eq(parse_dms("51°30′N", true), Some(51.5))
  assert_eq(parse_dms("51 30 N", true), Some(51.5))
}
