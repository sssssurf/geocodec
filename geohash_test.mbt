///|
test "geohash matches the published examples" {
  let a = LatLng::new(57.64911, 10.40744).unwrap()
  assert_eq(geohash_encode(a, 11).unwrap(), "u4pruydqqvj")
  let b = LatLng::new(42.6, -5.6).unwrap()
  assert_eq(geohash_encode(b, 5).unwrap(), "ezs42")
}

///|
test "geohash decodes to the centre of its cell" {
  let p = geohash_decode("ezs42").unwrap()
  assert_true((p.lat() - 42.60498046875).abs() < 1.0e-12)
  assert_true((p.lng() - -5.60302734375).abs() < 1.0e-12)
  let b = geohash_bounds("ezs42").unwrap()
  assert_true((b.south() - 42.5830078125).abs() < 1.0e-12)
  assert_true((b.north() - 42.626953125).abs() < 1.0e-12)
  assert_true((b.west() - -5.625).abs() < 1.0e-12)
  assert_true((b.east() - -5.5810546875).abs() < 1.0e-12)
}

///|
test "every precision round-trips through the cell centre" {
  let points = [
    LatLng::new(0.0, 0.0).unwrap(),
    LatLng::new(39.9042, 116.4074).unwrap(),
    LatLng::new(-33.8688, 151.2093).unwrap(),
    LatLng::new(64.1466, -21.9426).unwrap(),
    LatLng::new(-89.9, 179.9).unwrap(),
  ]
  for p in points {
    for precision in 1..<13 {
      let code = geohash_encode(p, precision).unwrap()
      assert_eq(code.length(), precision)
      let back = geohash_decode(code).unwrap()
      let b = geohash_bounds(code).unwrap()
      assert_true(b.contains(p))
      assert_true(back.lat() >= b.south() && back.lat() <= b.north())
    }
  }
}

///|
test "geohash neighbours are distinct and one cell away" {
  let code = "ezs42"
  let ns = geohash_neighbors(code).unwrap()
  assert_eq(ns.length(), 8)
  let b = geohash_bounds(code).unwrap()
  let c = b.center().unwrap()
  for n in ns {
    assert_eq(n.length(), 5)
    let nb = geohash_bounds(n).unwrap()
    let nc = nb.center().unwrap()
    assert_true((nc.lat() - c.lat()).abs() <= b.height() * 1.01)
    assert_true(lng_delta(c.lng(), nc.lng()).abs() <= b.width() * 1.01)
  }
}

///|
test "geohash rejects malformed input" {
  assert_true(geohash_bounds("") is None)
  assert_true(geohash_bounds("ezs4a") is None)
  assert_true(geohash_bounds("ezs4i") is None)
  assert_true(geohash_bounds("ezs42!") is None)
  assert_true(geohash_encode(LatLng::new(0.0, 0.0).unwrap(), 0) is None)
  assert_true(geohash_encode(LatLng::new(0.0, 0.0).unwrap(), 13) is None)
  assert_true(geohash_decode("ezs42") is Some(_))
}

///|
test "uppercase geohashes are accepted" {
  assert_eq(
    geohash_bounds("EZS42").unwrap().to_text(),
    geohash_bounds("ezs42").unwrap().to_text(),
  )
}

///|
test "precision for metres picks a cell no larger than the request" {
  assert_eq(geohash_precision_for_meters(5.0).unwrap(), 9)
  assert_true(geohash_precision_for_meters(0.0) is None)
}

///|
test "cover enumerates every cell that meets a small box" {
  let box = BoundingBox::new(39.9, 116.4, 39.91, 116.41).unwrap()
  let cells = geohash_cover(box, 7, max_cells=100).unwrap()
  assert_true(cells.length() > 1)
  for i = 0; i < cells.length(); i = i + 1 {
    assert_eq(cells[i].length(), 7)
    assert_true(geohash_bounds(cells[i]).unwrap().intersects(box))
    for j = i + 1; j < cells.length(); j = j + 1 {
      assert_true(cells[i] != cells[j])
    }
  }
}

///|
test "cover refuses a request above its cell budget" {
  let box = BoundingBox::new(0.0, 0.0, 10.0, 10.0).unwrap()
  assert_true(geohash_cover(box, 10, max_cells=10) is None)
  assert_true(geohash_cover(box, 0) is None)
}

///|
test "cover splits a box that crosses the date line" {
  let box = BoundingBox::new(-1.0, 170.0, 1.0, -170.0).unwrap()
  let cells = geohash_cover(box, 3, max_cells=1000).unwrap()
  assert_true(cells.length() > 0)
  let mut west = 0
  let mut east = 0
  for code in cells {
    let b = geohash_bounds(code).unwrap()
    assert_true(b.intersects(box))
    if b.center().unwrap().lng() < 0.0 {
      east = east + 1
    } else {
      west = west + 1
    }
  }
  assert_true(west > 0)
  assert_true(east > 0)
}
