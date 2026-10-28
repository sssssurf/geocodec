// The unified model: cells, points, regions, resolution and uncertainty.

///|
test "a plus code parses as a cell with an exact region" {
  let loc = parse_location("8FVC9G8F+6X").unwrap()
  assert_eq(loc.format, @geocodec.PlusCode)
  assert_true(loc.is_cell())
  assert_eq(loc.kind, @geocodec.Cell)
  assert_true(loc.region.contains(loc.point))
  assert_true(loc.resolution_m > 13.0 && loc.resolution_m < 14.0)
  assert_true(
    loc.uncertainty_m.unwrap() > 7.0 && loc.uncertainty_m.unwrap() < 9.0,
  )
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
  assert_eq(loc.uncertainty_m.unwrap(), 40.0)
  assert_eq(loc.resolution_m, 80.0)
  assert_true(loc.area_m2 > 6390.0 && loc.area_m2 < 6410.0)
  assert_true(loc.region.contains(loc.point))
  assert_eq(loc.to_geouri(), "geo:48.198634,16.371648;u=40")
}

///|
test "altitude and crs survive the unified model" {
  let loc = parse_location("geo:48.198634,16.371648,412.5;crs=wgs84;u=40").unwrap()
  assert_eq(loc.altitude_m.unwrap(), 412.5)
  assert_eq(loc.crs.unwrap(), "wgs84")
  assert_eq(loc.to_geouri(), "geo:48.198634,16.371648,412.5;crs=wgs84;u=40")
}

///|
test "a plain coordinate pair is a point without invented precision" {
  let loc = parse_location("39.9042,116.4074").unwrap()
  assert_eq(loc.format, @geocodec.Decimal)
  assert_eq(loc.kind, @geocodec.Point)
  assert_eq(loc.resolution_m, 0.0)
  assert_true(loc.uncertainty_m is None)
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
  assert_true(
    (point.uncertainty_m.unwrap() - cell.uncertainty_m.unwrap()).abs() < 0.01,
  )
  // The circle around the centre covers the rectangle, but its area is larger:
  // the shape is lost, and the model says so with region + uncertainty.
  assert_true(
    3.141592653589793 *
    cell.uncertainty_m.unwrap() *
    cell.uncertainty_m.unwrap() >
    cell.area_m2,
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
  assert_true(plus.resolution_m < point.uncertainty_m.unwrap())
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
test "a point with u= contains nearby points and excludes far ones" {
  let envelope = parse_location("geo:48.198634,16.371648;u=40").unwrap()
  assert_true(envelope.contains_point(LatLng::new(48.1987, 16.3717).unwrap()))
  assert_false(envelope.contains_point(LatLng::new(48.1995, 16.3717).unwrap()))
}

///|
test "explicit zero uncertainty remains distinct from unspecified accuracy" {
  let loc = parse_location("geo:1,2;u=0").unwrap()
  assert_eq(loc.uncertainty_m.unwrap(), 0.0)
  assert_true(loc.uncertainty_known())
  assert_eq(loc.to_geouri(), "geo:1,2;u=0")
  let unknown = parse_location("geo:1,2").unwrap()
  assert_false(unknown.uncertainty_known())
  assert_eq(unknown.to_geouri(), "geo:1,2")
}

///|
test "an unsupported CRS is never silently interpreted as WGS84" {
  assert_true(parse_location("geo:1,2;crs=custom-grid") is None)
  assert_true(geouri_parse("geo:1,2;crs=custom-grid") is None)
  assert_true(parse_location("geo:1,2;crs=WGS84") is Some(_))
}

///|
test "a conversion retains original uncertainty and provenance" {
  let source = parse_location("geo:48.198634,16.371648;u=40").unwrap()
  let result = source.convert_to_cell(@geocodec.PlusCode, 10).unwrap()
  assert_eq(result.source.raw, source.raw)
  assert_eq(result.source.uncertainty_m.unwrap(), 40.0)
  assert_true(result.target.region.contains(source.point))
  assert_true(result.uncertainty_bound_m.unwrap() >= 40.0)
  let unknown = parse_location("1,2")
    .unwrap()
    .convert_to_cell(@geocodec.GeoHash, 6)
    .unwrap()
  assert_true(unknown.uncertainty_bound_m is None)
}

///|
test "a rendered cell circle covers all corners even at high precision" {
  for pair in [(47.36559, 8.524997), (89.999, 179.999), (-89.999, -179.999)] {
    let p = LatLng::new(pair.0, pair.1).unwrap()
    for length in [2, 6, 10, 15] {
      let code = pluscode_encode(p, code_length=length).unwrap()
      let cell = describe_code(code).unwrap()
      let back = parse_location(cell.to_geouri()).unwrap()
      assert_true(back.uncertainty_m.unwrap() >= cell.uncertainty_m.unwrap())
      let b = cell.region
      for
        corner in [
          (b.south(), b.west()),
          (b.south(), b.east()),
          (b.north(), b.west()),
          (b.north(), b.east()),
        ] {
        assert_true(
          back.region.contains(LatLng::new(corner.0, corner.1).unwrap()),
        )
      }
    }
  }
}

///|
test "uncertainty reaching a pole covers every longitude" {
  let loc = parse_location("geo:89.999,20;u=1000").unwrap()
  assert_true(loc.region.contains(LatLng::new(90.0, -150.0).unwrap()))
}

///|
test "point to cell rejects non-cell formats and invalid precision" {
  let point = parse_location("39.9042,116.4074").unwrap()
  assert_true(point.to_cell(@geocodec.GeoHash, 0) is None)
  assert_true(point.to_cell(@geocodec.PlusCode, 9) is None)
  assert_true(point.to_cell(@geocodec.Maidenhead, 3) is None)
  assert_true(point.to_cell(@geocodec.Dms, 10) is None)
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

///|
test "all point notations keep unknown accuracy optional" {
  for text in ["geo:1,2", "1,2", "1N,2E"] {
    let loc = parse_location(text).unwrap()
    assert_true(loc.uncertainty_m is None)
    assert_true(loc.cell_radius_m is None)
    assert_false(loc.uncertainty_known())
    assert_true(loc.uncertainty_bounds() is None)
    assert_false(loc.to_geouri().contains(";u="))
  }
  let exact = parse_location("geo:1,2;u=0").unwrap()
  assert_eq(exact.uncertainty_m, Some(0.0))
  assert_true(exact.uncertainty_bounds() is Some(_))
}

///|
test "unknown accuracy survives every grid conversion and URI round trip" {
  for p in ["geo:1,2", "89.999,179.999", "-89.999,-179.999"] {
    let source = parse_location(p).unwrap()
    let mut current = source
    for
      (format, precision) in [
        (@geocodec.GeoHash, 5),
        (@geocodec.PlusCode, 10),
        (@geocodec.Maidenhead, 8),
      ] {
      let result = current.convert_to_cell(format, precision).unwrap()
      assert_true(result.uncertainty_bound_m is None)
      let target = result.target
      assert_true(target.uncertainty_m is None)
      assert_true(target.cell_radius_m.unwrap() > 0.0)
      assert_true(target.uncertainty_bounds() is None)
      assert_false(target.to_geouri().contains(";u="))
      assert_true(
        parse_location(target.to_geouri()).unwrap().uncertainty_m is None,
      )
      current = target
    }
  }
}

///|
test "known uncertainty propagates on to_cell as well as conversion records" {
  let source = parse_location("geo:48.198634,16.371648;u=40").unwrap()
  let fine = source.to_cell(@geocodec.PlusCode, 15).unwrap()
  assert_true(fine.cell_radius_m.unwrap() < 0.01)
  assert_true(fine.uncertainty_m.unwrap() >= 40.0)
  let coarse = fine.to_cell(@geocodec.GeoHash, 5).unwrap()
  assert_true(coarse.uncertainty_m.unwrap() >= fine.uncertainty_m.unwrap())
  let back = parse_location(coarse.to_geouri()).unwrap()
  assert_true(back.uncertainty_m.unwrap() >= coarse.uncertainty_m.unwrap())
  assert_true(back.uncertainty_bounds().unwrap().contains(source.point))
}

///|
test "grid geometry cannot substitute for source uncertainty" {
  let target = parse_location("geo:1,2")
    .unwrap()
    .to_cell(@geocodec.GeoHash, 6)
    .unwrap()
  let independent_cell = describe_code(target.raw).unwrap()
  assert_true(target.region == independent_cell.region)
  assert_eq(target.cell_radius_m, independent_cell.cell_radius_m)
  assert_true(target.uncertainty_m is None)
  assert_true(independent_cell.uncertainty_m is Some(_))
}

///|
test "scanner preserves different accuracy and altitude at identical coordinates" {
  let found = parse_codes(
    "geo:1,2 geo:1,2;u=0 geo:1,2;u=40 geo:1,2,10;u=40 geo:1,2",
  )
  assert_eq(found.length(), 4)
  assert_true(found[0].uncertainty_m is None)
  assert_eq(found[1].uncertainty_m, Some(0.0))
  assert_eq(found[2].uncertainty_m, Some(40.0))
  assert_eq(found[3].altitude_m, Some(10.0))
}

///|
test "large finite uncertainty survives conversion and RFC decimal output" {
  let source = parse_location("geo:1,2;u=100000000000000000000").unwrap()
  let target = source.to_cell(@geocodec.PlusCode, 10).unwrap()
  let back = geouri_parse(target.to_geouri()).unwrap()
  assert_true(back.uncertainty.unwrap() >= source.uncertainty_m.unwrap())
  assert_true(
    target
    .uncertainty_bounds()
    .unwrap()
    .contains(LatLng::new(-90.0, 0.0).unwrap()),
  )
}
