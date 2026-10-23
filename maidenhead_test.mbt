///|
test "maidenhead matches the London example" {
  let london = LatLng::new(51.5074, -0.1278).unwrap()
  assert_eq(maidenhead_encode(london, precision=6).unwrap(), "IO91WM")
  let b = maidenhead_bounds("IO91WM").unwrap()
  assert_true(b.contains(london))
  assert_true((b.width() - 2.0 / 24.0).abs() < 1.0e-12)
  assert_true((b.height() - 1.0 / 24.0).abs() < 1.0e-12)
}

///|
test "every maidenhead precision round-trips" {
  let points = [
    LatLng::new(0.0, 0.0).unwrap(),
    LatLng::new(-33.8688, 151.2093).unwrap(),
    LatLng::new(64.1466, -21.9426).unwrap(),
    LatLng::new(-89.99, 179.99).unwrap(),
    LatLng::new(89.99, -179.99).unwrap(),
  ]
  for p in points {
    for precision in [2, 4, 6, 8, 10] {
      let locator = maidenhead_encode(p, precision~).unwrap()
      assert_eq(locator.length(), precision)
      let b = maidenhead_bounds(locator).unwrap()
      assert_true(b.contains(p))
      assert_true(maidenhead_decode(locator) is Some(_))
    }
  }
}

///|
test "maidenhead validation rejects impossible pairs" {
  assert_true(maidenhead_bounds("IO91WM") is Some(_))
  assert_true(maidenhead_bounds("io91wm") is Some(_))
  assert_true(maidenhead_bounds("IO91W") is None)
  assert_true(maidenhead_bounds("ZZ91WM") is None)
  assert_true(maidenhead_bounds("IO9AWM") is None)
  assert_true(maidenhead_bounds("IO91W1") is None)
  assert_true(
    maidenhead_encode(LatLng::new(0.0, 0.0).unwrap(), precision=3) is None,
  )
  assert_true(
    maidenhead_encode(LatLng::new(0.0, 0.0).unwrap(), precision=12) is None,
  )
}
