// The unified model: cells, points, regions, resolution and uncertainty.

///|
test "a plus code parses as a cell with an exact region" {
  let loc = parse_location("8FVC9G8F+6X").unwrap()
  assert_eq(loc.format, @geocodec.PlusCode)
  assert_true(loc.is_cell())
  assert_eq(loc.kind, @geocodec.Cell)
  assert_true(loc.region.contains(loc.point))
  assert_true(loc.resolution_m > 13.0 && loc.resolution_m < 14.0)
  assert_true(loc.uncertainty_m > 7.0 && loc.uncertainty_m < 9.0)
  assert_true(loc.area_m2 > 120.0 && loc.area_m2 < 140.0)
  assert_eq(loc.raw, "8FVC9G8F+6X")
}

///|
test "a geohash parses as a cell whose resolution grows with length" {
  let short = parse_location("wx4g0b").unwrap()
  let long = parse_location("wx4g0bm6c").unwrap()
  assert_true(short.is_cell())
  assert_true(long.is_cell())
  assert_true(short.resolution_m > 800.0 && short.resolution_m < 1100.0)
  assert_true(long.resolution_m < short.resolution_m)
  assert_true(short.region.contains(short.point))
}

///|
test "a geo uri with u= parses as a point with an uncertainty envelope" {
  let loc = parse_location("geo:48.198634,16.371648;u=40").unwrap()
  assert_eq(loc.format, @geocodec.GeoUri)
  assert_eq(loc.kind, @geocodec.Point)
  assert_false(loc.is_cell())
  assert_eq(loc.uncertainty_m, 40.0)
  assert_eq(loc.resolution_m, 80.0)
  assert_true(loc.area_m2 > 6390.0 && loc.area_m2 < 6410.0)
  assert_true(loc.region.contains(loc.point))
  assert_eq(loc.to_geouri(), "geo:48.198634,16.371648;u=40")
}

///|
test "altitude and crs survive the unified model" {
  let loc = parse_location("geo:48.198634,16.371648,412.5;u=40;crs=wgs84").unwrap()
  assert_eq(loc.altitude_m.unwrap(), 412.5)
  assert_eq(loc.crs.unwrap(), "wgs84")
  assert_eq(loc.to_geouri(), "geo:48.198634,16.371648,412.5;u=40;crs=wgs84")
}

///|
test "a plain coordinate pair is a point without invented precision" {
  let loc = parse_location("39.9042,116.4074").unwrap()
  assert_eq(loc.format, @geocodec.Decimal)
  assert_eq(loc.kind, @geocodec.Point)
  assert_eq(loc.resolution_m, 0.0)
  assert_eq(loc.uncertainty_m, 0.0)
  assert_eq(loc.area_m2, 0.0)
  assert_eq(loc.to_geouri(), "geo:39.9042,116.4074")
}

///|
test "cell to geo uri keeps a radius that covers the cell" {
  let cell = parse_location("8FVC9G8F+6X").unwrap()
  let uri = cell.to_geouri()
  assert_true(uri.contains(";u="))
  let point = parse_location(uri).unwrap()
  assert_eq(point.kind, @geocodec.Point)
  assert_true((point.uncertainty_m - cell.uncertainty_m).abs() < 0.01)
  // The circle around the centre covers the rectangle, but its area is larger:
  // the shape is lost, and the model says so with region + uncertainty.
  assert_true(
    3.141592653589793 * cell.uncertainty_m * cell.uncertainty_m > cell.area_m2,
  )
}

///|
test "the model distinguishes containment of a cell and a point" {
  let cell = parse_location("8FVC9G8F+6X").unwrap()
  let inside = parse_location("47.3655,8.5249").unwrap()
  let outside = parse_location("0,0").unwrap()
  assert_true(cell.contains(inside))
  assert_true(cell.contains_point(inside.point))
  assert_false(cell.contains(outside))
  assert_true(cell.contains(cell))
  assert_false(inside.contains(cell))
  assert_true(cell.intersects(cell))
}

///|
test "point to cell quantises and reports the new resolution" {
  let point = parse_location("geo:48.198634,16.371648;u=40").unwrap()
  assert_true(point.is_point())
  assert_false(point.is_cell())
  let plus = point.to_cell(@geocodec.PlusCode, 10).unwrap()
  assert_true(plus.is_cell())
  assert_true(plus.region.contains(point.point))
  assert_true(plus.resolution_m < point.uncertainty_m)
  let coarse = point.to_cell(@geocodec.GeoHash, 5).unwrap()
  assert_true(coarse.resolution_m > plus.resolution_m)
  assert_true(point.to_cell(@geocodec.Decimal, 10) is None)
}

///|
test "cell to cell changes precision without pretending the old shape" {
  let cell = parse_location("8FVC9G8F+6X").unwrap()
  let coarse = cell.to_cell(@geocodec.GeoHash, 6).unwrap()
  assert_true(coarse.is_cell())
  assert_true(coarse.resolution_m > cell.resolution_m)
  assert_true(coarse.region.intersects(cell.region))
}

///|
test "describe_code uses the same model as parse_location" {
  let by_parse = parse_location("IO91WM").unwrap()
  let by_describe = describe_code("IO91WM").unwrap()
  assert_eq(by_parse.format, by_describe.format)
  assert_eq(by_parse.kind, by_describe.kind)
  assert_eq(by_parse.region.to_text(), by_describe.region.to_text())
  assert_eq(by_parse.resolution_m, by_describe.resolution_m)
  assert_true(describe_code("not a code") is None)
}
