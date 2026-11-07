// Adjacent IEEE-754 inputs around the reported decimal boundary.
// Expectations: Python Decimal(str(input)) for quantization, pinned Google
// encodeIntegers for code digits. The official CSV remains the primary oracle.

///|
test "reported decimal boundary is stable through public conversion" {
  let p = LatLng::new(40.6, 129.7).unwrap()
  assert_eq(pluscode_encode(p, code_length=8), Some("8QGFJP22+"))
  let loc = parse_location("40.6,129.7")
    .unwrap()
    .to_cell(@geocodec.PlusCode, 8)
    .unwrap()
  assert_eq(loc.raw, "8QGFJP22+")
}

///|
test "adjacent doubles on both sides of a decimal boundary stay distinct" {
  assert_eq(
    pluscode_encode(LatLng::new(40.6, 129.7).unwrap(), code_length=8),
    Some("8QGFJP22+"),
  )
  assert_eq(
    pluscode_encode(LatLng::new(40.6, 129.7).unwrap(), code_length=10),
    Some("8QGFJP22+22"),
  )
  assert_eq(
    pluscode_encode(LatLng::new(40.6, 129.7).unwrap(), code_length=15),
    Some("8QGFJP22+2222222"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.599999999999994, 129.7).unwrap(),
      code_length=8,
    ),
    Some("8QGFHPX2+"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.599999999999994, 129.7).unwrap(),
      code_length=10,
    ),
    Some("8QGFHPX2+X2"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.599999999999994, 129.7).unwrap(),
      code_length=15,
    ),
    Some("8QGFHPX2+X2RRRRR"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.60000000000001, 129.7).unwrap(),
      code_length=8,
    ),
    Some("8QGFJP22+"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.60000000000001, 129.7).unwrap(),
      code_length=10,
    ),
    Some("8QGFJP22+22"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.60000000000001, 129.7).unwrap(),
      code_length=15,
    ),
    Some("8QGFJP22+2222222"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.6, 129.69999999999996).unwrap(),
      code_length=8,
    ),
    Some("8QGFJM2X+"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.6, 129.69999999999996).unwrap(),
      code_length=10,
    ),
    Some("8QGFJM2X+2X"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.6, 129.69999999999996).unwrap(),
      code_length=15,
    ),
    Some("8QGFJM2X+2X55555"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.6, 129.70000000000002).unwrap(),
      code_length=8,
    ),
    Some("8QGFJP22+"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.6, 129.70000000000002).unwrap(),
      code_length=10,
    ),
    Some("8QGFJP22+22"),
  )
  assert_eq(
    pluscode_encode(
      LatLng::new(40.6, 129.70000000000002).unwrap(),
      code_length=15,
    ),
    Some("8QGFJP22+2222222"),
  )
}
