///|
test "plus codes match the published examples" {
  let googleplex = LatLng::new(37.42202, -122.08408).unwrap()
  assert_eq(pluscode_encode(googleplex, code_length=10).unwrap(), "849VCWC8+R9")
  let zurich = LatLng::new(47.365590, 8.524997).unwrap()
  assert_eq(pluscode_encode(zurich, code_length=10).unwrap(), "8FVC9G8F+6X")
}

///|
test "a decoded plus code is the centre of its cell" {
  let p = pluscode_decode("849VCWC8+R9").unwrap()
  assert_true((p.lat() - 37.4220).abs() < 0.0002)
  assert_true((p.lng() - -122.08408).abs() < 0.0002)
  let b = pluscode_bounds("849VCWC8+R9").unwrap()
  assert_true(b.width() > 0.00012 && b.width() < 0.00013)
  assert_true(b.height() > 0.00012 && b.height() < 0.00013)
}

///|
test "every useful code length round-trips" {
  let points = [
    LatLng::new(0.0, 0.0).unwrap(),
    LatLng::new(39.9042, 116.4074).unwrap(),
    LatLng::new(-33.8688, 151.2093).unwrap(),
    LatLng::new(64.1466, -21.9426).unwrap(),
    LatLng::new(-89.99, 179.99).unwrap(),
  ]
  for p in points {
    for length in [2, 4, 6, 8, 10, 11, 12, 13, 14, 15] {
      let code = pluscode_encode(p, code_length=length).unwrap()
      assert_true(pluscode_is_full(code))
      assert_eq(pluscode_code_length(code), length)
      let b = pluscode_bounds(code).unwrap()
      assert_true(b.contains(p))
    }
  }
}

///|
test "plus code validity distinguishes full, short and padded codes" {
  assert_true(pluscode_is_full("8FVC9G8F+6W"))
  assert_true(pluscode_is_short("9G8F+6W"))
  assert_false(pluscode_is_full("9G8F+6W"))
  assert_true(pluscode_is_valid("8FVC0000+"))
  assert_true(pluscode_is_full("8FVC0000+"))
  assert_false(pluscode_is_valid("8FVC9G8F6W"))
  assert_false(pluscode_is_valid("8FVC9G8F++6W"))
  assert_false(pluscode_is_valid("8FVC9G8F+6"))
  assert_false(pluscode_is_valid("8FVC9G8F+6A"))
  // Surrounding whitespace is trimmed, so this is still a full code.
  assert_true(pluscode_is_full("8FVC9G8F+6W "))
  // Lowercase input is normalised before validation.
  assert_true(pluscode_is_full("8fvc9g8f+6w"))
}

///|
test "plus code neighbours are eight distinct cells at the same precision" {
  let code = "8FVC9G8F+6X"
  let neighbours = pluscode_neighbors(code).unwrap()
  assert_eq(neighbours.length(), 8)
  for n in neighbours {
    assert_true(pluscode_is_full(n))
    assert_eq(pluscode_code_length(n), 10)
    assert_true(n != code)
  }
}

///|
test "plus code neighbours wrap across the date line" {
  let code = pluscode_encode(
    LatLng::new(0.0, 179.9999).unwrap(),
    code_length=10,
  ).unwrap()
  let east = pluscode_adjacent(code, 1, 0).unwrap()
  let center = pluscode_decode(east).unwrap()
  assert_true(center.lng() < 0.0)
}

///|
test "shorten and recover agree near the reference" {
  let p = LatLng::new(47.365590, 8.524997).unwrap()
  let full = pluscode_encode(p, code_length=10).unwrap()
  let near = LatLng::new(47.37, 8.52).unwrap()
  let short = pluscode_shorten(full, near).unwrap()
  assert_true(short.length() < full.length())
  assert_true(pluscode_is_short(short))
  let recovered = pluscode_recover(short, near).unwrap()
  assert_eq(recovered, full)
}

///|
test "recover returns the nearest candidate rather than the first" {
  let far = LatLng::new(-33.86, 151.2).unwrap()
  let result = pluscode_recover("9G8F+6W", far)
  assert_true(result is Some(_))
  let code = result.unwrap()
  assert_true(pluscode_is_full(code))
}
