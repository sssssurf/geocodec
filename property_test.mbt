// Property checks over a deterministic pseudo-random walk. The generator is
// an LCG, so a failure can be reproduced from the seed printed in the test.

///|
fn next_seed(seed : Int64) -> Int64 {
  seed * 48271L % 2147483647L
}

///|
test "every codec round-trips a deterministic sample of the globe" {
  let mut seed = 12345L
  for _ in 0..<40 {
    seed = next_seed(seed)
    let lat = seed.to_double() / 2147483647.0 * 178.0 - 89.0
    seed = next_seed(seed)
    let lng = seed.to_double() / 2147483647.0 * 360.0 - 180.0
    let p = LatLng::new(lat, lng).unwrap()

    let gh = geohash_encode(p, 9).unwrap()
    assert_true(geohash_bounds(gh).unwrap().contains(p))

    let pc = pluscode_encode(p, code_length=10).unwrap()
    assert_true(pluscode_bounds(pc).unwrap().contains(p))

    let mh = maidenhead_encode(p, precision=8).unwrap()
    assert_true(maidenhead_bounds(mh).unwrap().contains(p))
  }
}

///|
test "a cover of a small box contains only cells that meet the box" {
  let mut seed = 4242L
  for _ in 0..<10 {
    seed = next_seed(seed)
    let lat = seed.to_double() / 2147483647.0 * 120.0 - 60.0
    seed = next_seed(seed)
    let lng = seed.to_double() / 2147483647.0 * 300.0 - 150.0
    let box = BoundingBox::new(lat, lng, lat + 0.02, lng + 0.02).unwrap()
    let cells = geohash_cover(box, 6, max_cells=1000).unwrap()
    assert_true(cells.length() > 0)
    for code in cells {
      assert_eq(code.length(), 6)
      assert_true(geohash_bounds(code).unwrap().intersects(box))
    }
  }
}
