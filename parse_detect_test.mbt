///|
test "parse_location recognises each notation" {
  match parse_location("39.9042,116.4074") {
    Some(p) => {
      assert_eq(p.format, @geocodec.Decimal)
      assert_true((p.point.lat() - 39.9042).abs() < 1.0e-12)
    }
    None => assert_true(false)
  }
  match parse_location("39°54′15.1″N,116°24′26.6″E") {
    Some(p) => assert_eq(p.format, @geocodec.Dms)
    None => assert_true(false)
  }
  match parse_location("39°54′15.1″N 116°24′26.6″E") {
    Some(p) => assert_eq(p.format, @geocodec.Dms)
    None => assert_true(false)
  }
  match parse_location("wx4g0b") {
    Some(p) => assert_eq(p.format, @geocodec.GeoHash)
    None => assert_true(false)
  }
  match parse_location("8FVC9G8F+6X") {
    Some(p) => assert_eq(p.format, @geocodec.PlusCode)
    None => assert_true(false)
  }
  match parse_location("IO91WM") {
    Some(p) => assert_eq(p.format, @geocodec.Maidenhead)
    None => assert_true(false)
  }
  match parse_location("geo:48.198634,16.371648;u=40") {
    Some(p) => assert_eq(p.format, @geocodec.GeoUri)
    None => assert_true(false)
  }
}

///|
test "parse_location rejects rubbish" {
  assert_true(parse_location("") is None)
  assert_true(parse_location("not a coordinate") is None)
  assert_true(parse_location("geo:91,0") is None)
  assert_true(parse_location("99999,99999") is None)
}

///|
test "scan finds several codes in one sentence" {
  let text = "Meet at 8FVC9G8F+6X near IO91WM, or send geo:48.198634,16.371648;u=40 and wx4g0b."
  let found = parse_codes(text)
  assert_eq(found.length(), 4)
  assert_eq(found[0].format, @geocodec.PlusCode)
  assert_eq(found[1].format, @geocodec.Maidenhead)
  assert_eq(found[2].format, @geocodec.GeoUri)
  assert_eq(found[3].format, @geocodec.GeoHash)
}

///|
test "scan does not repeat a code and respects the limit" {
  let text = "wx4g0b wx4g0b wx4g0b 8FVC9G8F+6X"
  assert_eq(parse_codes(text).length(), 2)
  assert_eq(parse_codes(text, max_results=1).length(), 1)
}

///|
test "scan ignores bare numbers and all-letter words" {
  assert_eq(parse_codes("postcode 12345 and the word meet").length(), 0)
  assert_eq(parse_codes("zip 12345 and wx4g0b").length(), 1)
}
