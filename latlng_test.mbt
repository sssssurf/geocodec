///|
test "a point validates its latitude and normalises its longitude" {
  let p = LatLng::new(39.9, 190.0).unwrap()
  assert_eq(p.lat(), 39.9)
  assert_eq(p.lng(), -170.0)
  assert_true(LatLng::new(90.0, 0.0) is Some(_))
  assert_true(LatLng::new(-90.0, 180.0) is Some(_))
  assert_true(LatLng::new(90.1, 0.0) is None)
  assert_true(LatLng::new(0.0, 0.0 / 0.0) is None)
}

///|
test "a box that crosses the antimeridian keeps a 20 degree width" {
  let b = BoundingBox::new(-10.0, 170.0, 10.0, -170.0).unwrap()
  assert_true(b.crosses_antimeridian())
  assert_eq(b.width(), 20.0)
  assert_true(b.contains(LatLng::new(0.0, 179.0).unwrap()))
  assert_true(b.contains(LatLng::new(0.0, -179.0).unwrap()))
  assert_false(b.contains(LatLng::new(0.0, 0.0).unwrap()))
  assert_eq(b.center().unwrap().lng(), -180.0)
}

///|
test "a full-world box contains every longitude" {
  let b = BoundingBox::new(-90.0, -180.0, 90.0, 180.0).unwrap()
  assert_eq(b.width(), 360.0)
  assert_true(b.contains(LatLng::new(12.0, 179.9).unwrap()))
  assert_true(b.contains(LatLng::new(-12.0, -179.9).unwrap()))
}

///|
test "boxes intersect across the date line" {
  let a = BoundingBox::new(0.0, 170.0, 10.0, -170.0).unwrap()
  let b = BoundingBox::new(5.0, 175.0, 15.0, 178.0).unwrap()
  let c = BoundingBox::new(5.0, 0.0, 15.0, 10.0).unwrap()
  assert_true(a.intersects(b))
  assert_false(a.intersects(c))
}
