// Generated from pinned Google OLC CSV vectors by gen-olc-tests.mjs.
// Out-of-range latitudes are explicitly clipped to adapt to validated LatLng.
// No vector is skipped. See docs/pluscode-conformance.md for API boundaries.

///|
test "official OLC encoding.csv:16" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.375), 2.775).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("7FG49Q00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 16 " + code); None => println("OLC_ENCODING_MISMATCH 16 NONE") }
  }
  assert_eq(actual, Some("7FG49Q00+"))
}

///|
test "official OLC encoding.csv:17" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.3700625), 2.7821875).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("7FG49QCJ+2V") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 17 " + code); None => println("OLC_ENCODING_MISMATCH 17 NONE") }
  }
  assert_eq(actual, Some("7FG49QCJ+2V"))
}

///|
test "official OLC encoding.csv:18" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.3701125), 2.782234375).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("7FG49QCJ+2VX") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 18 " + code); None => println("OLC_ENCODING_MISMATCH 18 NONE") }
  }
  assert_eq(actual, Some("7FG49QCJ+2VX"))
}

///|
test "official OLC encoding.csv:19" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.3701135), 2.78223535156).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("7FG49QCJ+2VXGJ") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 19 " + code); None => println("OLC_ENCODING_MISMATCH 19 NONE") }
  }
  assert_eq(actual, Some("7FG49QCJ+2VXGJ"))
}

///|
test "official OLC encoding.csv:20" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(47.0000625), 8.0000625).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("8FVC2222+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 20 " + code); None => println("OLC_ENCODING_MISMATCH 20 NONE") }
  }
  assert_eq(actual, Some("8FVC2222+22"))
}

///|
test "official OLC encoding.csv:21" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-41.2730625), 174.7859375).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("4VCPPQGP+Q9") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 21 " + code); None => println("OLC_ENCODING_MISMATCH 21 NONE") }
  }
  assert_eq(actual, Some("4VCPPQGP+Q9"))
}

///|
test "official OLC encoding.csv:22" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(0.5), -179.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("62G20000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 22 " + code); None => println("OLC_ENCODING_MISMATCH 22 NONE") }
  }
  assert_eq(actual, Some("62G20000+"))
}

///|
test "official OLC encoding.csv:23" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-89.5), -179.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("22220000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 23 " + code); None => println("OLC_ENCODING_MISMATCH 23 NONE") }
  }
  assert_eq(actual, Some("22220000+"))
}

///|
test "official OLC encoding.csv:24" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.5), 2.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("7FG40000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 24 " + code); None => println("OLC_ENCODING_MISMATCH 24 NONE") }
  }
  assert_eq(actual, Some("7FG40000+"))
}

///|
test "official OLC encoding.csv:25" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-89.9999375), -179.9999375).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("22222222+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 25 " + code); None => println("OLC_ENCODING_MISMATCH 25 NONE") }
  }
  assert_eq(actual, Some("22222222+22"))
}

///|
test "official OLC encoding.csv:26" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(0.5), 179.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("6VGX0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 26 " + code); None => println("OLC_ENCODING_MISMATCH 26 NONE") }
  }
  assert_eq(actual, Some("6VGX0000+"))
}

///|
test "official OLC encoding.csv:27" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(1), 1).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("6FH32222+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 27 " + code); None => println("OLC_ENCODING_MISMATCH 27 NONE") }
  }
  assert_eq(actual, Some("6FH32222+222"))
}

///|
test "official OLC encoding.csv:33" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(90), 1).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("CFX30000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 33 " + code); None => println("OLC_ENCODING_MISMATCH 33 NONE") }
  }
  assert_eq(actual, Some("CFX30000+"))
}

///|
test "official OLC encoding.csv:34" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(92), 1).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("CFX30000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 34 " + code); None => println("OLC_ENCODING_MISMATCH 34 NONE") }
  }
  assert_eq(actual, Some("CFX30000+"))
}

///|
test "official OLC encoding.csv:35" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(90), 1).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("CFX3X2X2+X2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 35 " + code); None => println("OLC_ENCODING_MISMATCH 35 NONE") }
  }
  assert_eq(actual, Some("CFX3X2X2+X2"))
}

///|
test "official OLC encoding.csv:41" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(1), 180).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("62H20000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 41 " + code); None => println("OLC_ENCODING_MISMATCH 41 NONE") }
  }
  assert_eq(actual, Some("62H20000+"))
}

///|
test "official OLC encoding.csv:42" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(1), 181).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("62H30000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 42 " + code); None => println("OLC_ENCODING_MISMATCH 42 NONE") }
  }
  assert_eq(actual, Some("62H30000+"))
}

///|
test "official OLC encoding.csv:43" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.3701135), 362.78223535156).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("7FG49QCJ+2VXGJ") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 43 " + code); None => println("OLC_ENCODING_MISMATCH 43 NONE") }
  }
  assert_eq(actual, Some("7FG49QCJ+2VXGJ"))
}

///|
test "official OLC encoding.csv:44" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(47.0000625), 728.0000625).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("8FVC2222+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 44 " + code); None => println("OLC_ENCODING_MISMATCH 44 NONE") }
  }
  assert_eq(actual, Some("8FVC2222+22"))
}

///|
test "official OLC encoding.csv:45" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-41.2730625), 1254.7859375).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("4VCPPQGP+Q9") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 45 " + code); None => println("OLC_ENCODING_MISMATCH 45 NONE") }
  }
  assert_eq(actual, Some("4VCPPQGP+Q9"))
}

///|
test "official OLC encoding.csv:46" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.3701135), -357.217764648).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("7FG49QCJ+2VXGJ") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 46 " + code); None => println("OLC_ENCODING_MISMATCH 46 NONE") }
  }
  assert_eq(actual, Some("7FG49QCJ+2VXGJ"))
}

///|
test "official OLC encoding.csv:47" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(47.0000625), -711.9999375).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("8FVC2222+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 47 " + code); None => println("OLC_ENCODING_MISMATCH 47 NONE") }
  }
  assert_eq(actual, Some("8FVC2222+22"))
}

///|
test "official OLC encoding.csv:48" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-41.2730625), -905.2140625).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("4VCPPQGP+Q9") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 48 " + code); None => println("OLC_ENCODING_MISMATCH 48 NONE") }
  }
  assert_eq(actual, Some("4VCPPQGP+Q9"))
}

///|
test "official OLC encoding.csv:54" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(1.2), 3.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("6FH56C22+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 54 " + code); None => println("OLC_ENCODING_MISMATCH 54 NONE") }
  }
  assert_eq(actual, Some("6FH56C22+22"))
}

///|
test "official OLC encoding.csv:61" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(37.539669125), -122.375069724).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("849VGJQF+VX7QR3J") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 61 " + code); None => println("OLC_ENCODING_MISMATCH 61 NONE") }
  }
  assert_eq(actual, Some("849VGJQF+VX7QR3J"))
}

///|
test "official OLC encoding.csv:62" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(37.539669125), -122.375069724).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=16)
  if actual != Some("849VGJQF+VX7QR3J") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 62 " + code); None => println("OLC_ENCODING_MISMATCH 62 NONE") }
  }
  assert_eq(actual, Some("849VGJQF+VX7QR3J"))
}

///|
test "official OLC encoding.csv:63" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(37.539669125), -122.375069724).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=100)
  if actual != Some("849VGJQF+VX7QR3J") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 63 " + code); None => println("OLC_ENCODING_MISMATCH 63 NONE") }
  }
  assert_eq(actual, Some("849VGJQF+VX7QR3J"))
}

///|
test "official OLC encoding.csv:69" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(35.6), 3.033).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("8F75J22M+26") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 69 " + code); None => println("OLC_ENCODING_MISMATCH 69 NONE") }
  }
  assert_eq(actual, Some("8F75J22M+26"))
}

///|
test "official OLC encoding.csv:70" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-48.71), 142.78).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("4R347QRJ+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 70 " + code); None => println("OLC_ENCODING_MISMATCH 70 NONE") }
  }
  assert_eq(actual, Some("4R347QRJ+"))
}

///|
test "official OLC encoding.csv:71" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-70), 163.7).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("3V252P22+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 71 " + code); None => println("OLC_ENCODING_MISMATCH 71 NONE") }
  }
  assert_eq(actual, Some("3V252P22+"))
}

///|
test "official OLC encoding.csv:72" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-2.804), 7.003).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("6F9952W3+C6222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 72 " + code); None => println("OLC_ENCODING_MISMATCH 72 NONE") }
  }
  assert_eq(actual, Some("6F9952W3+C6222"))
}

///|
test "official OLC encoding.csv:73" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(13.9), 164.88).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("7V56WV2J+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 73 " + code); None => println("OLC_ENCODING_MISMATCH 73 NONE") }
  }
  assert_eq(actual, Some("7V56WV2J+2222"))
}

///|
test "official OLC encoding.csv:74" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-13.23), 172.77).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("5VRJQQCC+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 74 " + code); None => println("OLC_ENCODING_MISMATCH 74 NONE") }
  }
  assert_eq(actual, Some("5VRJQQCC+"))
}

///|
test "official OLC encoding.csv:75" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(40.6), 129.7).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("8QGFJP22+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 75 " + code); None => println("OLC_ENCODING_MISMATCH 75 NONE") }
  }
  assert_eq(actual, Some("8QGFJP22+"))
}

///|
test "official OLC encoding.csv:76" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-52.166), 13.694).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("3FVMRMMV+JJ2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 76 " + code); None => println("OLC_ENCODING_MISMATCH 76 NONE") }
  }
  assert_eq(actual, Some("3FVMRMMV+JJ2222"))
}

///|
test "official OLC encoding.csv:77" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-14), 106.9).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("5PR82W00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 77 " + code); None => println("OLC_ENCODING_MISMATCH 77 NONE") }
  }
  assert_eq(actual, Some("5PR82W00+"))
}

///|
test "official OLC encoding.csv:78" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(70.3), -87.64).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("C62J8926+22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 78 " + code); None => println("OLC_ENCODING_MISMATCH 78 NONE") }
  }
  assert_eq(actual, Some("C62J8926+22222"))
}

///|
test "official OLC encoding.csv:79" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(66.89), -106).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("95RPV2R2+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 79 " + code); None => println("OLC_ENCODING_MISMATCH 79 NONE") }
  }
  assert_eq(actual, Some("95RPV2R2+22"))
}

///|
test "official OLC encoding.csv:80" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(2.5), -64.23).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("67JQGQ2C+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 80 " + code); None => println("OLC_ENCODING_MISMATCH 80 NONE") }
  }
  assert_eq(actual, Some("67JQGQ2C+222"))
}

///|
test "official OLC encoding.csv:81" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-56.7), -47.2).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("38MJ8R22+222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 81 " + code); None => println("OLC_ENCODING_MISMATCH 81 NONE") }
  }
  assert_eq(actual, Some("38MJ8R22+222222"))
}

///|
test "official OLC encoding.csv:82" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-34.45), -93.719).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("46Q8H700+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 82 " + code); None => println("OLC_ENCODING_MISMATCH 82 NONE") }
  }
  assert_eq(actual, Some("46Q8H700+"))
}

///|
test "official OLC encoding.csv:83" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-35.849), -93.75).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("46P85722+C222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 83 " + code); None => println("OLC_ENCODING_MISMATCH 83 NONE") }
  }
  assert_eq(actual, Some("46P85722+C222"))
}

///|
test "official OLC encoding.csv:84" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(65.748), 24.316).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("9GQ6P8X8+6C22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 84 " + code); None => println("OLC_ENCODING_MISMATCH 84 NONE") }
  }
  assert_eq(actual, Some("9GQ6P8X8+6C22"))
}

///|
test "official OLC encoding.csv:85" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-57.32), 130.43).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("3QJGMCJJ+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 85 " + code); None => println("OLC_ENCODING_MISMATCH 85 NONE") }
  }
  assert_eq(actual, Some("3QJGMCJJ+2222"))
}

///|
test "official OLC encoding.csv:86" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(17.6), -44.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("789QJJ00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 86 " + code); None => println("OLC_ENCODING_MISMATCH 86 NONE") }
  }
  assert_eq(actual, Some("789QJJ00+"))
}

///|
test "official OLC encoding.csv:87" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-27.6), -104.8).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("554QC600+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 87 " + code); None => println("OLC_ENCODING_MISMATCH 87 NONE") }
  }
  assert_eq(actual, Some("554QC600+"))
}

///|
test "official OLC encoding.csv:88" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(41.87), -145.59).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("83HPVCC6+22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 88 " + code); None => println("OLC_ENCODING_MISMATCH 88 NONE") }
  }
  assert_eq(actual, Some("83HPVCC6+22222"))
}

///|
test "official OLC encoding.csv:89" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-4.542), 148.638).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("6R7CFJ5Q+66222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 89 " + code); None => println("OLC_ENCODING_MISMATCH 89 NONE") }
  }
  assert_eq(actual, Some("6R7CFJ5Q+66222"))
}

///|
test "official OLC encoding.csv:90" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-37.014), -159.936).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("43J2X3P7+CJ") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 90 " + code); None => println("OLC_ENCODING_MISMATCH 90 NONE") }
  }
  assert_eq(actual, Some("43J2X3P7+CJ"))
}

///|
test "official OLC encoding.csv:91" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-57.25), 125.49).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("3QJ7QF2R+2222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 91 " + code); None => println("OLC_ENCODING_MISMATCH 91 NONE") }
  }
  assert_eq(actual, Some("3QJ7QF2R+2222222"))
}

///|
test "official OLC encoding.csv:92" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(48.89), -80.52).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("86WXVFRJ+22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 92 " + code); None => println("OLC_ENCODING_MISMATCH 92 NONE") }
  }
  assert_eq(actual, Some("86WXVFRJ+22222"))
}

///|
test "official OLC encoding.csv:93" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(53.66), 170.97).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("9V5GMX6C+222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 93 " + code); None => println("OLC_ENCODING_MISMATCH 93 NONE") }
  }
  assert_eq(actual, Some("9V5GMX6C+222222"))
}

///|
test "official OLC encoding.csv:94" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(0.49), -76.97).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("67G5F2RJ+2222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 94 " + code); None => println("OLC_ENCODING_MISMATCH 94 NONE") }
  }
  assert_eq(actual, Some("67G5F2RJ+2222222"))
}

///|
test "official OLC encoding.csv:95" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(40.44), -36.7).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("89G5C8R2+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 95 " + code); None => println("OLC_ENCODING_MISMATCH 95 NONE") }
  }
  assert_eq(actual, Some("89G5C8R2+2222"))
}

///|
test "official OLC encoding.csv:96" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(58.73), 69.95).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("9JCFPXJ2+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 96 " + code); None => println("OLC_ENCODING_MISMATCH 96 NONE") }
  }
  assert_eq(actual, Some("9JCFPXJ2+"))
}

///|
test "official OLC encoding.csv:97" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(16.179), 150.075).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("7R8G53HG+J222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 97 " + code); None => println("OLC_ENCODING_MISMATCH 97 NONE") }
  }
  assert_eq(actual, Some("7R8G53HG+J222"))
}

///|
test "official OLC encoding.csv:98" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-55.574), -70.061).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("37PFCWGQ+CJ22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 98 " + code); None => println("OLC_ENCODING_MISMATCH 98 NONE") }
  }
  assert_eq(actual, Some("37PFCWGQ+CJ22"))
}

///|
test "official OLC encoding.csv:99" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(76.1), -82.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("C68V4G22+2222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 99 " + code); None => println("OLC_ENCODING_MISMATCH 99 NONE") }
  }
  assert_eq(actual, Some("C68V4G22+2222222"))
}

///|
test "official OLC encoding.csv:100" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(58.66), 149.17).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("9RCFM56C+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 100 " + code); None => println("OLC_ENCODING_MISMATCH 100 NONE") }
  }
  assert_eq(actual, Some("9RCFM56C+22"))
}

///|
test "official OLC encoding.csv:101" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-67.2), 48.6).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("3H4CRJ00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 101 " + code); None => println("OLC_ENCODING_MISMATCH 101 NONE") }
  }
  assert_eq(actual, Some("3H4CRJ00+"))
}

///|
test "official OLC encoding.csv:102" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-5.6), -54.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("6867CG22+222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 102 " + code); None => println("OLC_ENCODING_MISMATCH 102 NONE") }
  }
  assert_eq(actual, Some("6867CG22+222222"))
}

///|
test "official OLC encoding.csv:103" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-34), 145.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("4RR72G22+222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 103 " + code); None => println("OLC_ENCODING_MISMATCH 103 NONE") }
  }
  assert_eq(actual, Some("4RR72G22+222222"))
}

///|
test "official OLC encoding.csv:104" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-34.2), 66.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("4JQ8RC22+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 104 " + code); None => println("OLC_ENCODING_MISMATCH 104 NONE") }
  }
  assert_eq(actual, Some("4JQ8RC22+2222"))
}

///|
test "official OLC encoding.csv:105" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(17.8), -108.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("759HRG00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 105 " + code); None => println("OLC_ENCODING_MISMATCH 105 NONE") }
  }
  assert_eq(actual, Some("759HRG00+"))
}

///|
test "official OLC encoding.csv:106" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(10.734), -168.294).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("722HPPM4+JC") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 106 " + code); None => println("OLC_ENCODING_MISMATCH 106 NONE") }
  }
  assert_eq(actual, Some("722HPPM4+JC"))
}

///|
test "official OLC encoding.csv:107" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-28.732), 54.32).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("5H3P789C+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 107 " + code); None => println("OLC_ENCODING_MISMATCH 107 NONE") }
  }
  assert_eq(actual, Some("5H3P789C+"))
}

///|
test "official OLC encoding.csv:108" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(64.1), 107.9).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("9PP94W22+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 108 " + code); None => println("OLC_ENCODING_MISMATCH 108 NONE") }
  }
  assert_eq(actual, Some("9PP94W22+2222"))
}

///|
test "official OLC encoding.csv:109" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(79.7525), 6.9623).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("CFF8QX36+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 109 " + code); None => println("OLC_ENCODING_MISMATCH 109 NONE") }
  }
  assert_eq(actual, Some("CFF8QX36+"))
}

///|
test "official OLC encoding.csv:110" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-63.6449), -25.1475).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("398P9V43+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 110 " + code); None => println("OLC_ENCODING_MISMATCH 110 NONE") }
  }
  assert_eq(actual, Some("398P9V43+"))
}

///|
test "official OLC encoding.csv:111" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(35.019), 148.827).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("8R7C2R9G+JR2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 111 " + code); None => println("OLC_ENCODING_MISMATCH 111 NONE") }
  }
  assert_eq(actual, Some("8R7C2R9G+JR2"))
}

///|
test "official OLC encoding.csv:112" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(71.132), -98.584).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("C6334CJ8+RC22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 112 " + code); None => println("OLC_ENCODING_MISMATCH 112 NONE") }
  }
  assert_eq(actual, Some("C6334CJ8+RC22222"))
}

///|
test "official OLC encoding.csv:113" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(53.38), -51.34).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("985C9MJ6+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 113 " + code); None => println("OLC_ENCODING_MISMATCH 113 NONE") }
  }
  assert_eq(actual, Some("985C9MJ6+2222"))
}

///|
test "official OLC encoding.csv:114" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-1.2), 170.2).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("6VCGR622+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 114 " + code); None => println("OLC_ENCODING_MISMATCH 114 NONE") }
  }
  assert_eq(actual, Some("6VCGR622+2222"))
}

///|
test "official OLC encoding.csv:115" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(50.2), -162.8).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("922V6622+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 115 " + code); None => println("OLC_ENCODING_MISMATCH 115 NONE") }
  }
  assert_eq(actual, Some("922V6622+222"))
}

///|
test "official OLC encoding.csv:116" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-25.798), -59.812).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("5862652Q+R6") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 116 " + code); None => println("OLC_ENCODING_MISMATCH 116 NONE") }
  }
  assert_eq(actual, Some("5862652Q+R6"))
}

///|
test "official OLC encoding.csv:117" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(81.654), -162.422).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("C2HVMH3H+J62222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 117 " + code); None => println("OLC_ENCODING_MISMATCH 117 NONE") }
  }
  assert_eq(actual, Some("C2HVMH3H+J62222"))
}

///|
test "official OLC encoding.csv:118" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-75.7), -35.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("29P68J22+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 118 " + code); None => println("OLC_ENCODING_MISMATCH 118 NONE") }
  }
  assert_eq(actual, Some("29P68J22+"))
}

///|
test "official OLC encoding.csv:119" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(67.2), 115.1).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("9PVQ6422+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 119 " + code); None => println("OLC_ENCODING_MISMATCH 119 NONE") }
  }
  assert_eq(actual, Some("9PVQ6422+222"))
}

///|
test "official OLC encoding.csv:120" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-78.137), -42.995).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("28HVV274+6222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 120 " + code); None => println("OLC_ENCODING_MISMATCH 120 NONE") }
  }
  assert_eq(actual, Some("28HVV274+6222"))
}

///|
test "official OLC encoding.csv:121" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-56.3), 114.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("3PMPPG22+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 121 " + code); None => println("OLC_ENCODING_MISMATCH 121 NONE") }
  }
  assert_eq(actual, Some("3PMPPG22+222"))
}

///|
test "official OLC encoding.csv:122" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(10.767), -62.787).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("772VQ687+R6222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 122 " + code); None => println("OLC_ENCODING_MISMATCH 122 NONE") }
  }
  assert_eq(actual, Some("772VQ687+R6222"))
}

///|
test "official OLC encoding.csv:123" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-19.212), 107.423).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("5PG9QCQF+66") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 123 " + code); None => println("OLC_ENCODING_MISMATCH 123 NONE") }
  }
  assert_eq(actual, Some("5PG9QCQF+66"))
}

///|
test "official OLC encoding.csv:124" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(21.192), -45.145).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("78HP5VR4+R222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 124 " + code); None => println("OLC_ENCODING_MISMATCH 124 NONE") }
  }
  assert_eq(actual, Some("78HP5VR4+R222222"))
}

///|
test "official OLC encoding.csv:125" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(16.701), 148.648).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("7R8CPJ2X+C62222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 125 " + code); None => println("OLC_ENCODING_MISMATCH 125 NONE") }
  }
  assert_eq(actual, Some("7R8CPJ2X+C62222"))
}

///|
test "official OLC encoding.csv:126" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(52.25), -77.45).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("97447H22+2222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 126 " + code); None => println("OLC_ENCODING_MISMATCH 126 NONE") }
  }
  assert_eq(actual, Some("97447H22+2222222"))
}

///|
test "official OLC encoding.csv:127" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-68.54504), -62.81725).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("373VF53M+X4J") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 127 " + code); None => println("OLC_ENCODING_MISMATCH 127 NONE") }
  }
  assert_eq(actual, Some("373VF53M+X4J"))
}

///|
test "official OLC encoding.csv:128" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(76.7), -86.172).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("C68MPR2H+2622") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 128 " + code); None => println("OLC_ENCODING_MISMATCH 128 NONE") }
  }
  assert_eq(actual, Some("C68MPR2H+2622"))
}

///|
test "official OLC encoding.csv:129" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-6.2), 96.6).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("6M5RRJ22+22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 129 " + code); None => println("OLC_ENCODING_MISMATCH 129 NONE") }
  }
  assert_eq(actual, Some("6M5RRJ22+22222"))
}

///|
test "official OLC encoding.csv:130" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(59.32), -157.21).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("93F48QCR+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 130 " + code); None => println("OLC_ENCODING_MISMATCH 130 NONE") }
  }
  assert_eq(actual, Some("93F48QCR+2222"))
}

///|
test "official OLC encoding.csv:131" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(29.7), 39.6).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("7GXXPJ22+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 131 " + code); None => println("OLC_ENCODING_MISMATCH 131 NONE") }
  }
  assert_eq(actual, Some("7GXXPJ22+2222"))
}

///|
test "official OLC encoding.csv:132" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-18.32), 96.397).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("5MHRM9JW+2R") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 132 " + code); None => println("OLC_ENCODING_MISMATCH 132 NONE") }
  }
  assert_eq(actual, Some("5MHRM9JW+2R"))
}

///|
test "official OLC encoding.csv:133" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-30.3), 76.5).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("4JXRPG22+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 133 " + code); None => println("OLC_ENCODING_MISMATCH 133 NONE") }
  }
  assert_eq(actual, Some("4JXRPG22+222"))
}

///|
test "official OLC encoding.csv:134" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(50.342), -112.534).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("95298FR8+RC22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 134 " + code); None => println("OLC_ENCODING_MISMATCH 134 NONE") }
  }
  assert_eq(actual, Some("95298FR8+RC22222"))
}

///|
test "official OLC encoding.csv:141" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(80.0100000001), 58.57).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("CHGW2H6C+2222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 141 " + code); None => println("OLC_ENCODING_MISMATCH 141 NONE") }
  }
  assert_eq(actual, Some("CHGW2H6C+2222222"))
}

///|
test "official OLC encoding.csv:142" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(80.00999996), 58.57).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("CHGW2H5C+X2RRRRR") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 142 " + code); None => println("OLC_ENCODING_MISMATCH 142 NONE") }
  }
  assert_eq(actual, Some("CHGW2H5C+X2RRRRR"))
}

///|
test "official OLC encoding.csv:143" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-80.0099999999), 58.57).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("2HFWXHRC+2222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 143 " + code); None => println("OLC_ENCODING_MISMATCH 143 NONE") }
  }
  assert_eq(actual, Some("2HFWXHRC+2222222"))
}

///|
test "official OLC encoding.csv:144" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-80.0100000399), 58.57).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("2HFWXHQC+X2RRRRR") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 144 " + code); None => println("OLC_ENCODING_MISMATCH 144 NONE") }
  }
  assert_eq(actual, Some("2HFWXHQC+X2RRRRR"))
}

///|
test "official OLC encoding.csv:150" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(47.00000008), 8.00022229).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("8FVC2222+235235C") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 150 " + code); None => println("OLC_ENCODING_MISMATCH 150 NONE") }
  }
  assert_eq(actual, Some("8FVC2222+235235C"))
}

///|
test "official OLC encoding.csv:151" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(68.3500147997595), 113.625636875353).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("9PWM9J2G+272FWJV") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 151 " + code); None => println("OLC_ENCODING_MISMATCH 151 NONE") }
  }
  assert_eq(actual, Some("9PWM9J2G+272FWJV"))
}

///|
test "official OLC encoding.csv:152" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(38.1176000887231), 165.441989844555).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("8VC74C9R+2QX445C") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 152 " + code); None => println("OLC_ENCODING_MISMATCH 152 NONE") }
  }
  assert_eq(actual, Some("8VC74C9R+2QX445C"))
}

///|
test "official OLC encoding.csv:153" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-28.1217794010122), -154.066811473758).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("5337VWHM+77PR2GR") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 153 " + code); None => println("OLC_ENCODING_MISMATCH 153 NONE") }
  }
  assert_eq(actual, Some("5337VWHM+77PR2GR"))
}

///|
test "official OLC encoding.csv:159" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(37.539669125), -122.375069724).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("84000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 159 " + code); None => println("OLC_ENCODING_MISMATCH 159 NONE") }
  }
  assert_eq(actual, Some("84000000+"))
}

///|
test "official OLC encoding.csv:168" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(51.1276857), -184.2279861).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("9V3Q4QHC+3RC") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 168 " + code); None => println("OLC_ENCODING_MISMATCH 168 NONE") }
  }
  assert_eq(actual, Some("9V3Q4QHC+3RC"))
}

///|
test "official OLC encoding.csv:169" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-93.8414), -162.0682).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("222V2W2J+2P") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 169 " + code); None => println("OLC_ENCODING_MISMATCH 169 NONE") }
  }
  assert_eq(actual, Some("222V2W2J+2P"))
}

///|
test "official OLC encoding.csv:170" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-25.1585965), -176.4414937).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("5265RHR5+HC62QC") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 170 " + code); None => println("OLC_ENCODING_MISMATCH 170 NONE") }
  }
  assert_eq(actual, Some("5265RHR5+HC62QC"))
}

///|
test "official OLC encoding.csv:171" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(82.80655), 30.229187).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("CGJGR64H+JMF55") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 171 " + code); None => println("OLC_ENCODING_MISMATCH 171 NONE") }
  }
  assert_eq(actual, Some("CGJGR64H+JMF55"))
}

///|
test "official OLC encoding.csv:172" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(52.67256), -4.55204).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("9C4QMCFX+25GG5") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 172 " + code); None => println("OLC_ENCODING_MISMATCH 172 NONE") }
  }
  assert_eq(actual, Some("9C4QMCFX+25GG5"))
}

///|
test "official OLC encoding.csv:173" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(14.9420223132), -24.1698775963).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("79000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 173 " + code); None => println("OLC_ENCODING_MISMATCH 173 NONE") }
  }
  assert_eq(actual, Some("79000000+"))
}

///|
test "official OLC encoding.csv:174" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(50.46), 112.02).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("9P2JF26C+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 174 " + code); None => println("OLC_ENCODING_MISMATCH 174 NONE") }
  }
  assert_eq(actual, Some("9P2JF26C+2222"))
}

///|
test "official OLC encoding.csv:175" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-72.929463), 42.000964).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("2HV40000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 175 " + code); None => println("OLC_ENCODING_MISMATCH 175 NONE") }
  }
  assert_eq(actual, Some("2HV40000+"))
}

///|
test "official OLC encoding.csv:176" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(76.091456), -125.608062).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("C48P39RR+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 176 " + code); None => println("OLC_ENCODING_MISMATCH 176 NONE") }
  }
  assert_eq(actual, Some("C48P39RR+"))
}

///|
test "official OLC encoding.csv:177" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-94.103), -38.308).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("29232M2R+2R2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 177 " + code); None => println("OLC_ENCODING_MISMATCH 177 NONE") }
  }
  assert_eq(actual, Some("29232M2R+2R2222"))
}

///|
test "official OLC encoding.csv:178" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(88.1), 86).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("CMW80000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 178 " + code); None => println("OLC_ENCODING_MISMATCH 178 NONE") }
  }
  assert_eq(actual, Some("CMW80000+"))
}

///|
test "official OLC encoding.csv:179" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-44.545247), -40.700335).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("487XF73X+WV") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 179 " + code); None => println("OLC_ENCODING_MISMATCH 179 NONE") }
  }
  assert_eq(actual, Some("487XF73X+WV"))
}

///|
test "official OLC encoding.csv:180" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.67), -133.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("74G8MJC2+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 180 " + code); None => println("OLC_ENCODING_MISMATCH 180 NONE") }
  }
  assert_eq(actual, Some("74G8MJC2+"))
}

///|
test "official OLC encoding.csv:181" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(91.3759), -96.45974).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("C6X5XGXR+X4") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 181 " + code); None => println("OLC_ENCODING_MISMATCH 181 NONE") }
  }
  assert_eq(actual, Some("C6X5XGXR+X4"))
}

///|
test "official OLC encoding.csv:182" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(64.61), -192.97).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("9VP9J26J+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 182 " + code); None => println("OLC_ENCODING_MISMATCH 182 NONE") }
  }
  assert_eq(actual, Some("9VP9J26J+2222"))
}

///|
test "official OLC encoding.csv:183" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-19.427), -156.355).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("53G5HJFW+6222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 183 " + code); None => println("OLC_ENCODING_MISMATCH 183 NONE") }
  }
  assert_eq(actual, Some("53G5HJFW+6222"))
}

///|
test "official OLC encoding.csv:184" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-77.172610657), -122.783537134).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("24JVR6G8+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 184 " + code); None => println("OLC_ENCODING_MISMATCH 184 NONE") }
  }
  assert_eq(actual, Some("24JVR6G8+"))
}

///|
test "official OLC encoding.csv:185" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-48), -141).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("434X2222+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 185 " + code); None => println("OLC_ENCODING_MISMATCH 185 NONE") }
  }
  assert_eq(actual, Some("434X2222+22"))
}

///|
test "official OLC encoding.csv:186" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-48), -111).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("45000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 186 " + code); None => println("OLC_ENCODING_MISMATCH 186 NONE") }
  }
  assert_eq(actual, Some("45000000+"))
}

///|
test "official OLC encoding.csv:187" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(34.59271625), 33.43832676).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("8G6MHCVQ+38PM976") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 187 " + code); None => println("OLC_ENCODING_MISMATCH 187 NONE") }
  }
  assert_eq(actual, Some("8G6MHCVQ+38PM976"))
}

///|
test "official OLC encoding.csv:188" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-18.70036), -9.64681).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("5CHG7900+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 188 " + code); None => println("OLC_ENCODING_MISMATCH 188 NONE") }
  }
  assert_eq(actual, Some("5CHG7900+"))
}

///|
test "official OLC encoding.csv:189" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(82.14), 194.83).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("C2JP4R00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 189 " + code); None => println("OLC_ENCODING_MISMATCH 189 NONE") }
  }
  assert_eq(actual, Some("C2JP4R00+"))
}

///|
test "official OLC encoding.csv:190" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-83.0611), -53.5201).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("2888WF00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 190 " + code); None => println("OLC_ENCODING_MISMATCH 190 NONE") }
  }
  assert_eq(actual, Some("2888WF00+"))
}

///|
test "official OLC encoding.csv:191" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-90.5), -61.8).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("272W2622+222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 191 " + code); None => println("OLC_ENCODING_MISMATCH 191 NONE") }
  }
  assert_eq(actual, Some("272W2622+222222"))
}

///|
test "official OLC encoding.csv:192" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(23.857492947), -38.922971931).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("79M3V34G+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 192 " + code); None => println("OLC_ENCODING_MISMATCH 192 NONE") }
  }
  assert_eq(actual, Some("79M3V34G+"))
}

///|
test "official OLC encoding.csv:193" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(71.301289), -127.202151).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("C43J8Q2X+G49CW45") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 193 " + code); None => println("OLC_ENCODING_MISMATCH 193 NONE") }
  }
  assert_eq(actual, Some("C43J8Q2X+G49CW45"))
}

///|
test "official OLC encoding.csv:194" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(22.61341), -65.531218).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("77000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 194 " + code); None => println("OLC_ENCODING_MISMATCH 194 NONE") }
  }
  assert_eq(actual, Some("77000000+"))
}

///|
test "official OLC encoding.csv:195" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-59.5), 100.8).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("3P000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 195 " + code); None => println("OLC_ENCODING_MISMATCH 195 NONE") }
  }
  assert_eq(actual, Some("3P000000+"))
}

///|
test "official OLC encoding.csv:196" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(87.021195762), -199.388732204).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("CVV22JC6+FGCW3JV") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 196 " + code); None => println("OLC_ENCODING_MISMATCH 196 NONE") }
  }
  assert_eq(actual, Some("CVV22JC6+FGCW3JV"))
}

///|
test "official OLC encoding.csv:197" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(58.5932701), 172.4650093).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("9VCJHFV8+822V") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 197 " + code); None => println("OLC_ENCODING_MISMATCH 197 NONE") }
  }
  assert_eq(actual, Some("9VCJHFV8+822V"))
}

///|
test "official OLC encoding.csv:198" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-31.1761), 41.37565).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("4HW3R9FG+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 198 " + code); None => println("OLC_ENCODING_MISMATCH 198 NONE") }
  }
  assert_eq(actual, Some("4HW3R9FG+"))
}

///|
test "official OLC encoding.csv:199" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(44), 58).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("8HPW2200+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 199 " + code); None => println("OLC_ENCODING_MISMATCH 199 NONE") }
  }
  assert_eq(actual, Some("8HPW2200+"))
}

///|
test "official OLC encoding.csv:200" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-4.007), 154.7493).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("6R7PXP00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 200 " + code); None => println("OLC_ENCODING_MISMATCH 200 NONE") }
  }
  assert_eq(actual, Some("6R7PXP00+"))
}

///|
test "official OLC encoding.csv:201" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(2.8), -119.9).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("65J2R422+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 201 " + code); None => println("OLC_ENCODING_MISMATCH 201 NONE") }
  }
  assert_eq(actual, Some("65J2R422+2222"))
}

///|
test "official OLC encoding.csv:202" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(77.296962202), -118.449652886).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("C5930000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 202 " + code); None => println("OLC_ENCODING_MISMATCH 202 NONE") }
  }
  assert_eq(actual, Some("C5930000+"))
}

///|
test "official OLC encoding.csv:203" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(35.48003), 96.52265).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("8M7RFGJF+2369252") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 203 " + code); None => println("OLC_ENCODING_MISMATCH 203 NONE") }
  }
  assert_eq(actual, Some("8M7RFGJF+2369252"))
}

///|
test "official OLC encoding.csv:204" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(52.42264), 60.49549).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("9J42CFFW+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 204 " + code); None => println("OLC_ENCODING_MISMATCH 204 NONE") }
  }
  assert_eq(actual, Some("9J42CFFW+"))
}

///|
test "official OLC encoding.csv:205" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(29.096), 166.13).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("7VX834WJ+C2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 205 " + code); None => println("OLC_ENCODING_MISMATCH 205 NONE") }
  }
  assert_eq(actual, Some("7VX834WJ+C2"))
}

///|
test "official OLC encoding.csv:206" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(67.496291), 38.248585).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("9GVWF6WX+GC") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 206 " + code); None => println("OLC_ENCODING_MISMATCH 206 NONE") }
  }
  assert_eq(actual, Some("9GVWF6WX+GC"))
}

///|
test "official OLC encoding.csv:207" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(69.298163526), -181.784436557).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("9VXW76X8+768") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 207 " + code); None => println("OLC_ENCODING_MISMATCH 207 NONE") }
  }
  assert_eq(actual, Some("9VXW76X8+768"))
}

///|
test "official OLC encoding.csv:208" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(48.44527393761), 195.13608085747).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("82WQC4WP+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 208 " + code); None => println("OLC_ENCODING_MISMATCH 208 NONE") }
  }
  assert_eq(actual, Some("82WQC4WP+"))
}

///|
test "official OLC encoding.csv:209" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-28.8394), 166.9146).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("5V385W00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 209 " + code); None => println("OLC_ENCODING_MISMATCH 209 NONE") }
  }
  assert_eq(actual, Some("5V385W00+"))
}

///|
test "official OLC encoding.csv:210" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(46.01263), 109.23175).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("8PRF267J+3P26222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 210 " + code); None => println("OLC_ENCODING_MISMATCH 210 NONE") }
  }
  assert_eq(actual, Some("8PRF267J+3P26222"))
}

///|
test "official OLC encoding.csv:211" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-61.385416741), -100.103564052).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("35CXJV7W+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 211 " + code); None => println("OLC_ENCODING_MISMATCH 211 NONE") }
  }
  assert_eq(actual, Some("35CXJV7W+"))
}

///|
test "official OLC encoding.csv:212" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(85.6301065), 194.7590568).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("C2QPJQJ5+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 212 " + code); None => println("OLC_ENCODING_MISMATCH 212 NONE") }
  }
  assert_eq(actual, Some("C2QPJQJ5+"))
}

///|
test "official OLC encoding.csv:213" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-74.602), 189.932).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("22QF9WXJ+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 213 " + code); None => println("OLC_ENCODING_MISMATCH 213 NONE") }
  }
  assert_eq(actual, Some("22QF9WXJ+"))
}

///|
test "official OLC encoding.csv:214" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-90.93), -145.371).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("232P2J2H+2J2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 214 " + code); None => println("OLC_ENCODING_MISMATCH 214 NONE") }
  }
  assert_eq(actual, Some("232P2J2H+2J2"))
}

///|
test "official OLC encoding.csv:215" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-58.618133), 64.74663).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("3JH60000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 215 " + code); None => println("OLC_ENCODING_MISMATCH 215 NONE") }
  }
  assert_eq(actual, Some("3JH60000+"))
}

///|
test "official OLC encoding.csv:216" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(66.1423), -96.6).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("96R54CR2+W2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 216 " + code); None => println("OLC_ENCODING_MISMATCH 216 NONE") }
  }
  assert_eq(actual, Some("96R54CR2+W2"))
}

///|
test "official OLC encoding.csv:217" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-39.962), 168.233).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("4VGC0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 217 " + code); None => println("OLC_ENCODING_MISMATCH 217 NONE") }
  }
  assert_eq(actual, Some("4VGC0000+"))
}

///|
test "official OLC encoding.csv:218" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(98.31), 86.17).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("CMX8X5XC+X2R") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 218 " + code); None => println("OLC_ENCODING_MISMATCH 218 NONE") }
  }
  assert_eq(actual, Some("CMX8X5XC+X2R"))
}

///|
test "official OLC encoding.csv:219" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(47.858925), -75.22329).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("87V6VQ5G+HMG454") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 219 " + code); None => println("OLC_ENCODING_MISMATCH 219 NONE") }
  }
  assert_eq(actual, Some("87V6VQ5G+HMG454"))
}

///|
test "official OLC encoding.csv:220" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-17.15), -84.306).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("56JQVM2V+2J22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 220 " + code); None => println("OLC_ENCODING_MISMATCH 220 NONE") }
  }
  assert_eq(actual, Some("56JQVM2V+2J22"))
}

///|
test "official OLC encoding.csv:221" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-95.31345221), -172.90260796).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("2229232W+2X24245") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 221 " + code); None => println("OLC_ENCODING_MISMATCH 221 NONE") }
  }
  assert_eq(actual, Some("2229232W+2X24245"))
}

///|
test "official OLC encoding.csv:222" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-79.859625), 177.096808).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("2VGV43RW+5P3534") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 222 " + code); None => println("OLC_ENCODING_MISMATCH 222 NONE") }
  }
  assert_eq(actual, Some("2VGV43RW+5P3534"))
}

///|
test "official OLC encoding.csv:223" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(88.265429), -198.447568).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("CVW37H82+5XF5V2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 223 " + code); None => println("OLC_ENCODING_MISMATCH 223 NONE") }
  }
  assert_eq(actual, Some("CVW37H82+5XF5V2"))
}

///|
test "official OLC encoding.csv:224" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(13.325), 34.92).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("7G000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 224 " + code); None => println("OLC_ENCODING_MISMATCH 224 NONE") }
  }
  assert_eq(actual, Some("7G000000+"))
}

///|
test "official OLC encoding.csv:225" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-63.6), -145.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("33000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 225 " + code); None => println("OLC_ENCODING_MISMATCH 225 NONE") }
  }
  assert_eq(actual, Some("33000000+"))
}

///|
test "official OLC encoding.csv:226" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-54.487237091), -142.497673509).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("33QVGG72+4W4FHRG") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 226 " + code); None => println("OLC_ENCODING_MISMATCH 226 NONE") }
  }
  assert_eq(actual, Some("33QVGG72+4W4FHRG"))
}

///|
test "official OLC encoding.csv:227" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(89.796622), 61.685912).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("CJX3QM00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 227 " + code); None => println("OLC_ENCODING_MISMATCH 227 NONE") }
  }
  assert_eq(actual, Some("CJX3QM00+"))
}

///|
test "official OLC encoding.csv:228" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-25.2), 50.7).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("5H6GRP22+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 228 " + code); None => println("OLC_ENCODING_MISMATCH 228 NONE") }
  }
  assert_eq(actual, Some("5H6GRP22+"))
}

///|
test "official OLC encoding.csv:229" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-78.7376), 66.6281).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("2JH87J00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 229 " + code); None => println("OLC_ENCODING_MISMATCH 229 NONE") }
  }
  assert_eq(actual, Some("2JH87J00+"))
}

///|
test "official OLC encoding.csv:230" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-83.5768747454), -84.1155546149).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("268QCVFM+7Q") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 230 " + code); None => println("OLC_ENCODING_MISMATCH 230 NONE") }
  }
  assert_eq(actual, Some("268QCVFM+7Q"))
}

///|
test "official OLC encoding.csv:231" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(87.1741743283), -98.9097172279).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("C6V353FR+M4") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 231 " + code); None => println("OLC_ENCODING_MISMATCH 231 NONE") }
  }
  assert_eq(actual, Some("C6V353FR+M4"))
}

///|
test "official OLC encoding.csv:232" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-92.1234), 147.2214).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("2R292600+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 232 " + code); None => println("OLC_ENCODING_MISMATCH 232 NONE") }
  }
  assert_eq(actual, Some("2R292600+"))
}

///|
test "official OLC encoding.csv:233" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-96.081), 30.93).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("2G2G2W2J+222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 233 " + code); None => println("OLC_ENCODING_MISMATCH 233 NONE") }
  }
  assert_eq(actual, Some("2G2G2W2J+222222"))
}

///|
test "official OLC encoding.csv:234" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(58.54479), 0.954987).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("9FC20000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 234 " + code); None => println("OLC_ENCODING_MISMATCH 234 NONE") }
  }
  assert_eq(actual, Some("9FC20000+"))
}

///|
test "official OLC encoding.csv:235" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(85.223791), 166.317567).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("CVQ868F9+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 235 " + code); None => println("OLC_ENCODING_MISMATCH 235 NONE") }
  }
  assert_eq(actual, Some("CVQ868F9+"))
}

///|
test "official OLC encoding.csv:236" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(22.4144501873), 161.5737330425).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("7VJ3CH7F+QFQ353V") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 236 " + code); None => println("OLC_ENCODING_MISMATCH 236 NONE") }
  }
  assert_eq(actual, Some("7VJ3CH7F+QFQ353V"))
}

///|
test "official OLC encoding.csv:237" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-81), -189).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("2VFH0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 237 " + code); None => println("OLC_ENCODING_MISMATCH 237 NONE") }
  }
  assert_eq(actual, Some("2VFH0000+"))
}

///|
test "official OLC encoding.csv:238" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-3.87), 106.31).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("6P884800+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 238 " + code); None => println("OLC_ENCODING_MISMATCH 238 NONE") }
  }
  assert_eq(actual, Some("6P884800+"))
}

///|
test "official OLC encoding.csv:239" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-86.07687005), 17.43081941).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("2F5VWCFJ+7842XW") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 239 " + code); None => println("OLC_ENCODING_MISMATCH 239 NONE") }
  }
  assert_eq(actual, Some("2F5VWCFJ+7842XW"))
}

///|
test "official OLC encoding.csv:240" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(4.00247742), -147.71777983).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("63PJ2700+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 240 " + code); None => println("OLC_ENCODING_MISMATCH 240 NONE") }
  }
  assert_eq(actual, Some("63PJ2700+"))
}

///|
test "official OLC encoding.csv:241" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-34.13283986879), 143.93778642288).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("4R000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 241 " + code); None => println("OLC_ENCODING_MISMATCH 241 NONE") }
  }
  assert_eq(actual, Some("4R000000+"))
}

///|
test "official OLC encoding.csv:242" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-42.77927502), 197.58056291).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("429V6HCJ+76PRR") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 242 " + code); None => println("OLC_ENCODING_MISMATCH 242 NONE") }
  }
  assert_eq(actual, Some("429V6HCJ+76PRR"))
}

///|
test "official OLC encoding.csv:243" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(71.797168141), 116.102605255).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("CP3RQ4W3+V29MM5P") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 243 " + code); None => println("OLC_ENCODING_MISMATCH 243 NONE") }
  }
  assert_eq(actual, Some("CP3RQ4W3+V29MM5P"))
}

///|
test "official OLC encoding.csv:244" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-14.52796652), -19.29446968).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("5CQ2FPC4+R669Q") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 244 " + code); None => println("OLC_ENCODING_MISMATCH 244 NONE") }
  }
  assert_eq(actual, Some("5CQ2FPC4+R669Q"))
}

///|
test "official OLC encoding.csv:245" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-46.4243601112), -134.97185393078).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("4457H2GH+772") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 245 " + code); None => println("OLC_ENCODING_MISMATCH 245 NONE") }
  }
  assert_eq(actual, Some("4457H2GH+772"))
}

///|
test "official OLC encoding.csv:246" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-83.95), 57.33).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("2H8V382J+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 246 " + code); None => println("OLC_ENCODING_MISMATCH 246 NONE") }
  }
  assert_eq(actual, Some("2H8V382J+2222"))
}

///|
test "official OLC encoding.csv:247" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-81.15680196), 116.13215255).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("2PCRR4VJ+7VCX") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 247 " + code); None => println("OLC_ENCODING_MISMATCH 247 NONE") }
  }
  assert_eq(actual, Some("2PCRR4VJ+7VCX"))
}

///|
test "official OLC encoding.csv:248" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-69.8553608), 38.5416297).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("3G2W4GVR+VM") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 248 " + code); None => println("OLC_ENCODING_MISMATCH 248 NONE") }
  }
  assert_eq(actual, Some("3G2W4GVR+VM"))
}

///|
test "official OLC encoding.csv:249" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(70.06392017), 142.68513577).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("CR243M7P+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 249 " + code); None => println("OLC_ENCODING_MISMATCH 249 NONE") }
  }
  assert_eq(actual, Some("CR243M7P+"))
}

///|
test "official OLC encoding.csv:250" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-37.87035641911), 31.45160895416).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("4GJH4FH2+VJ5MQHR") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 250 " + code); None => println("OLC_ENCODING_MISMATCH 250 NONE") }
  }
  assert_eq(actual, Some("4GJH4FH2+VJ5MQHR"))
}

///|
test "official OLC encoding.csv:251" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-3.31237547), 55.93515507).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("6H8QMWQP+23RXXFP") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 251 " + code); None => println("OLC_ENCODING_MISMATCH 251 NONE") }
  }
  assert_eq(actual, Some("6H8QMWQP+23RXXFP"))
}

///|
test "official OLC encoding.csv:252" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-36.7954655), 151.3817689).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("4RMH693J+RP68VG") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 252 " + code); None => println("OLC_ENCODING_MISMATCH 252 NONE") }
  }
  assert_eq(actual, Some("4RMH693J+RP68VG"))
}

///|
test "official OLC encoding.csv:253" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(95.854385181), 79.466306447).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("CJXXXFX8+XG") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 253 " + code); None => println("OLC_ENCODING_MISMATCH 253 NONE") }
  }
  assert_eq(actual, Some("CJXXXFX8+XG"))
}

///|
test "official OLC encoding.csv:254" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(31.53982775), 98.72663309).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("8M3WGPQG+WMJ") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 254 " + code); None => println("OLC_ENCODING_MISMATCH 254 NONE") }
  }
  assert_eq(actual, Some("8M3WGPQG+WMJ"))
}

///|
test "official OLC encoding.csv:255" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(25.5118795897), 57.7948659543).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("7HQVGQ6V+QW54XF") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 255 " + code); None => println("OLC_ENCODING_MISMATCH 255 NONE") }
  }
  assert_eq(actual, Some("7HQVGQ6V+QW54XF"))
}

///|
test "official OLC encoding.csv:256" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(71), 121).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("CQ000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 256 " + code); None => println("OLC_ENCODING_MISMATCH 256 NONE") }
  }
  assert_eq(actual, Some("CQ000000+"))
}

///|
test "official OLC encoding.csv:257" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-82), -9).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("2C000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 257 " + code); None => println("OLC_ENCODING_MISMATCH 257 NONE") }
  }
  assert_eq(actual, Some("2C000000+"))
}

///|
test "official OLC encoding.csv:258" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-76.08163425), 173.1596402).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("2VMMW500+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 258 " + code); None => println("OLC_ENCODING_MISMATCH 258 NONE") }
  }
  assert_eq(actual, Some("2VMMW500+"))
}

///|
test "official OLC encoding.csv:259" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(40.5356280419), -79.76323109809).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("87000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 259 " + code); None => println("OLC_ENCODING_MISMATCH 259 NONE") }
  }
  assert_eq(actual, Some("87000000+"))
}

///|
test "official OLC encoding.csv:260" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-61.40656), -81.69399).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("36CWH800+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 260 " + code); None => println("OLC_ENCODING_MISMATCH 260 NONE") }
  }
  assert_eq(actual, Some("36CWH800+"))
}

///|
test "official OLC encoding.csv:261" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(27.8722), -178.2141).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("72V3VQCP+V9") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 261 " + code); None => println("OLC_ENCODING_MISMATCH 261 NONE") }
  }
  assert_eq(actual, Some("72V3VQCP+V9"))
}

///|
test "official OLC encoding.csv:262" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-92.2718492), 40.5508329).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("2H222H22+284") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 262 " + code); None => println("OLC_ENCODING_MISMATCH 262 NONE") }
  }
  assert_eq(actual, Some("2H222H22+284"))
}

///|
test "official OLC encoding.csv:263" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(70.3331), -67.4144).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("C72J8HMP+66X2525") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 263 " + code); None => println("OLC_ENCODING_MISMATCH 263 NONE") }
  }
  assert_eq(actual, Some("C72J8HMP+66X2525"))
}

///|
test "official OLC encoding.csv:264" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-63.163054), 106.207383).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("3P88R600+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 264 " + code); None => println("OLC_ENCODING_MISMATCH 264 NONE") }
  }
  assert_eq(actual, Some("3P88R600+"))
}

///|
test "official OLC encoding.csv:265" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(57.234), 92.971).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("9M9J6XMC+JC22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 265 " + code); None => println("OLC_ENCODING_MISMATCH 265 NONE") }
  }
  assert_eq(actual, Some("9M9J6XMC+JC22222"))
}

///|
test "official OLC encoding.csv:266" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(37.1), -195.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("8V964J22+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 266 " + code); None => println("OLC_ENCODING_MISMATCH 266 NONE") }
  }
  assert_eq(actual, Some("8V964J22+2222"))
}

///|
test "official OLC encoding.csv:267" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(31.197), 9.919).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("8F3F5WW9+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 267 " + code); None => println("OLC_ENCODING_MISMATCH 267 NONE") }
  }
  assert_eq(actual, Some("8F3F5WW9+"))
}

///|
test "official OLC encoding.csv:268" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(85.557757154), -182.229592353).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("CVQVHQ5C+4536") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 268 " + code); None => println("OLC_ENCODING_MISMATCH 268 NONE") }
  }
  assert_eq(actual, Some("CVQVHQ5C+4536"))
}

///|
test "official OLC encoding.csv:269" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(1.50383657), -69.55623429).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("67HG0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 269 " + code); None => println("OLC_ENCODING_MISMATCH 269 NONE") }
  }
  assert_eq(actual, Some("67HG0000+"))
}

///|
test "official OLC encoding.csv:270" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(50.409), 7.402).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("9F29CC52+JR22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 270 " + code); None => println("OLC_ENCODING_MISMATCH 270 NONE") }
  }
  assert_eq(actual, Some("9F29CC52+JR22222"))
}

///|
test "official OLC encoding.csv:271" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-88), 30).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("2G4G2222+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 271 " + code); None => println("OLC_ENCODING_MISMATCH 271 NONE") }
  }
  assert_eq(actual, Some("2G4G2222+222"))
}

///|
test "official OLC encoding.csv:272" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-98), 139).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("2Q2X2222+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 272 " + code); None => println("OLC_ENCODING_MISMATCH 272 NONE") }
  }
  assert_eq(actual, Some("2Q2X2222+22"))
}

///|
test "official OLC encoding.csv:273" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(11.4), 150.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("7R3G0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 273 " + code); None => println("OLC_ENCODING_MISMATCH 273 NONE") }
  }
  assert_eq(actual, Some("7R3G0000+"))
}

///|
test "official OLC encoding.csv:274" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-88.504244), 67.742247).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("2J390000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 274 " + code); None => println("OLC_ENCODING_MISMATCH 274 NONE") }
  }
  assert_eq(actual, Some("2J390000+"))
}

///|
test "official OLC encoding.csv:275" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-84.13904), -22.90719).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("297VV36V+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 275 " + code); None => println("OLC_ENCODING_MISMATCH 275 NONE") }
  }
  assert_eq(actual, Some("297VV36V+"))
}

///|
test "official OLC encoding.csv:276" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-12.87499775), -26.081150643).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("59VM4WG9+2G52") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 276 " + code); None => println("OLC_ENCODING_MISMATCH 276 NONE") }
  }
  assert_eq(actual, Some("59VM4WG9+2G52"))
}

///|
test "official OLC encoding.csv:277" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-95.978240742), 83.957497847).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("2M252X24+2X55454") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 277 " + code); None => println("OLC_ENCODING_MISMATCH 277 NONE") }
  }
  assert_eq(actual, Some("2M252X24+2X55454"))
}

///|
test "official OLC encoding.csv:278" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(52.797623), 55.332651).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("9H000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 278 " + code); None => println("OLC_ENCODING_MISMATCH 278 NONE") }
  }
  assert_eq(actual, Some("9H000000+"))
}

///|
test "official OLC encoding.csv:279" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-25.57754103), -60.87933236).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("576XC4CC+X7M7MXV") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 279 " + code); None => println("OLC_ENCODING_MISMATCH 279 NONE") }
  }
  assert_eq(actual, Some("576XC4CC+X7M7MXV"))
}

///|
test "official OLC encoding.csv:280" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(57.196), 82.5535).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("9M945HW3+CC2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 280 " + code); None => println("OLC_ENCODING_MISMATCH 280 NONE") }
  }
  assert_eq(actual, Some("9M945HW3+CC2222"))
}

///|
test "official OLC encoding.csv:281" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-26), 27).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("5G692222+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 281 " + code); None => println("OLC_ENCODING_MISMATCH 281 NONE") }
  }
  assert_eq(actual, Some("5G692222+"))
}

///|
test "official OLC encoding.csv:282" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-27), -122.3).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("545V2P22+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 282 " + code); None => println("OLC_ENCODING_MISMATCH 282 NONE") }
  }
  assert_eq(actual, Some("545V2P22+222"))
}

///|
test "official OLC encoding.csv:283" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-99.118211), 34.329996).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("2G2P282H+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 283 " + code); None => println("OLC_ENCODING_MISMATCH 283 NONE") }
  }
  assert_eq(actual, Some("2G2P282H+"))
}

///|
test "official OLC encoding.csv:284" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(25.33671), 8.6592).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("7FQC8MP5+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 284 " + code); None => println("OLC_ENCODING_MISMATCH 284 NONE") }
  }
  assert_eq(actual, Some("7FQC8MP5+"))
}

///|
test "official OLC encoding.csv:285" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-77.54), 110.22).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("2PJGF66C+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 285 " + code); None => println("OLC_ENCODING_MISMATCH 285 NONE") }
  }
  assert_eq(actual, Some("2PJGF66C+222"))
}

///|
test "official OLC encoding.csv:286" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-55.69363663291), -8.13133426255).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("3CPH8V49+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 286 " + code); None => println("OLC_ENCODING_MISMATCH 286 NONE") }
  }
  assert_eq(actual, Some("3CPH8V49+"))
}

///|
test "official OLC encoding.csv:287" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(12.0752578562), 90.0309556122).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("7M4G32GJ+4948FV6") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 287 " + code); None => println("OLC_ENCODING_MISMATCH 287 NONE") }
  }
  assert_eq(actual, Some("7M4G32GJ+4948FV6"))
}

///|
test "official OLC encoding.csv:288" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-38.11355992107), -14.54083447411).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("4CH7VFP5+HMFM2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 288 " + code); None => println("OLC_ENCODING_MISMATCH 288 NONE") }
  }
  assert_eq(actual, Some("4CH7VFP5+HMFM2"))
}

///|
test "official OLC encoding.csv:289" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-67.52), -133.23).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("3448FQJC+22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 289 " + code); None => println("OLC_ENCODING_MISMATCH 289 NONE") }
  }
  assert_eq(actual, Some("3448FQJC+22222"))
}

///|
test "official OLC encoding.csv:290" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-41.5789128), -76.993209).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("47C5C2C4+CPMF") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 290 " + code); None => println("OLC_ENCODING_MISMATCH 290 NONE") }
  }
  assert_eq(actual, Some("47C5C2C4+CPMF"))
}

///|
test "official OLC encoding.csv:291" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(63.50396935), 144.75232815).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("9RM6GQ00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 291 " + code); None => println("OLC_ENCODING_MISMATCH 291 NONE") }
  }
  assert_eq(actual, Some("9RM6GQ00+"))
}

///|
test "official OLC encoding.csv:292" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-99.1), -77.98).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("2724222C+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 292 " + code); None => println("OLC_ENCODING_MISMATCH 292 NONE") }
  }
  assert_eq(actual, Some("2724222C+222"))
}

///|
test "official OLC encoding.csv:293" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-13.502), 122.955).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("5QR4FXX4+62222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 293 " + code); None => println("OLC_ENCODING_MISMATCH 293 NONE") }
  }
  assert_eq(actual, Some("5QR4FXX4+62222"))
}

///|
test "official OLC encoding.csv:294" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(99.595382598), -71.110954356).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("C7XCXVXQ+XJVV") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 294 " + code); None => println("OLC_ENCODING_MISMATCH 294 NONE") }
  }
  assert_eq(actual, Some("C7XCXVXQ+XJVV"))
}

///|
test "official OLC encoding.csv:295" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(8.68), 180.22).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("62W2M6JC+22222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 295 " + code); None => println("OLC_ENCODING_MISMATCH 295 NONE") }
  }
  assert_eq(actual, Some("62W2M6JC+22222"))
}

///|
test "official OLC encoding.csv:296" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(96.0835607732), -29.001935042).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("C9XGXXXX+X6") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 296 " + code); None => println("OLC_ENCODING_MISMATCH 296 NONE") }
  }
  assert_eq(actual, Some("C9XGXXXX+X6"))
}

///|
test "official OLC encoding.csv:297" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(26.4022965), -31.1647767).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("79RCCR2P+W39") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 297 " + code); None => println("OLC_ENCODING_MISMATCH 297 NONE") }
  }
  assert_eq(actual, Some("79RCCR2P+W39"))
}

///|
test "official OLC encoding.csv:298" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(80.99), -174.37).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("C2G70000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 298 " + code); None => println("OLC_ENCODING_MISMATCH 298 NONE") }
  }
  assert_eq(actual, Some("C2G70000+"))
}

///|
test "official OLC encoding.csv:299" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(68), -35.1).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("99W62W22+2222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 299 " + code); None => println("OLC_ENCODING_MISMATCH 299 NONE") }
  }
  assert_eq(actual, Some("99W62W22+2222222"))
}

///|
test "official OLC encoding.csv:300" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(82.4789853525), 71.0194066612).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("CJJHF2H9+HQVC2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 300 " + code); None => println("OLC_ENCODING_MISMATCH 300 NONE") }
  }
  assert_eq(actual, Some("CJJHF2H9+HQVC2"))
}

///|
test "official OLC encoding.csv:301" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-84.7848), 166.71891).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("2V780000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 301 " + code); None => println("OLC_ENCODING_MISMATCH 301 NONE") }
  }
  assert_eq(actual, Some("2V780000+"))
}

///|
test "official OLC encoding.csv:302" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-10.5782), 25.7779).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("5GX7CQCH+P5C") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 302 " + code); None => println("OLC_ENCODING_MISMATCH 302 NONE") }
  }
  assert_eq(actual, Some("5GX7CQCH+P5C"))
}

///|
test "official OLC encoding.csv:303" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-3.91348310257), -109.55392470032).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("658G3CPW+JC4M8") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 303 " + code); None => println("OLC_ENCODING_MISMATCH 303 NONE") }
  }
  assert_eq(actual, Some("658G3CPW+JC4M8"))
}

///|
test "official OLC encoding.csv:304" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-55.7416641607), 136.4834168428).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("3QPR7F5M+89M") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 304 " + code); None => println("OLC_ENCODING_MISMATCH 304 NONE") }
  }
  assert_eq(actual, Some("3QPR7F5M+89M"))
}

///|
test "official OLC encoding.csv:305" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-55.80137), 105.59937).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("3P000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 305 " + code); None => println("OLC_ENCODING_MISMATCH 305 NONE") }
  }
  assert_eq(actual, Some("3P000000+"))
}

///|
test "official OLC encoding.csv:306" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(70.49), 104.87).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("CP000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 306 " + code); None => println("OLC_ENCODING_MISMATCH 306 NONE") }
  }
  assert_eq(actual, Some("CP000000+"))
}

///|
test "official OLC encoding.csv:307" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(1.6479856942), 181.1761286225).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("62H3J5XG+5FRC3Q") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 307 " + code); None => println("OLC_ENCODING_MISMATCH 307 NONE") }
  }
  assert_eq(actual, Some("62H3J5XG+5FRC3Q"))
}

///|
test "official OLC encoding.csv:308" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-94.2098), 53.1707).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("2H2M252C+274343") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 308 " + code); None => println("OLC_ENCODING_MISMATCH 308 NONE") }
  }
  assert_eq(actual, Some("2H2M252C+274343"))
}

///|
test "official OLC encoding.csv:309" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(96.6461284508), 37.530987524).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("CGXV0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 309 " + code); None => println("OLC_ENCODING_MISMATCH 309 NONE") }
  }
  assert_eq(actual, Some("CGXV0000+"))
}

///|
test "official OLC encoding.csv:310" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(13.40333198), 132.878412474).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("7Q5JCV3H+89M69") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 310 " + code); None => println("OLC_ENCODING_MISMATCH 310 NONE") }
  }
  assert_eq(actual, Some("7Q5JCV3H+89M69"))
}

///|
test "official OLC encoding.csv:311" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(23.01778459), -75.75490333).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("77M6269W+42") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 311 " + code); None => println("OLC_ENCODING_MISMATCH 311 NONE") }
  }
  assert_eq(actual, Some("77M6269W+42"))
}

///|
test "official OLC encoding.csv:312" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-48.4381338), 140.8468367).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("4R32HR00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 312 " + code); None => println("OLC_ENCODING_MISMATCH 312 NONE") }
  }
  assert_eq(actual, Some("4R32HR00+"))
}

///|
test "official OLC encoding.csv:313" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-38.2448857266), -111.9149619865).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("45HCQ34P+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 313 " + code); None => println("OLC_ENCODING_MISMATCH 313 NONE") }
  }
  assert_eq(actual, Some("45HCQ34P+22"))
}

///|
test "official OLC encoding.csv:314" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-64), -94.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("36870000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 314 " + code); None => println("OLC_ENCODING_MISMATCH 314 NONE") }
  }
  assert_eq(actual, Some("36870000+"))
}

///|
test "official OLC encoding.csv:315" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-47.0346874447), -51.1267770629).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("484CXV00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 315 " + code); None => println("OLC_ENCODING_MISMATCH 315 NONE") }
  }
  assert_eq(actual, Some("484CXV00+"))
}

///|
test "official OLC encoding.csv:316" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(66.6814), -78.916).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("97R3M3JM+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 316 " + code); None => println("OLC_ENCODING_MISMATCH 316 NONE") }
  }
  assert_eq(actual, Some("97R3M3JM+"))
}

///|
test "official OLC encoding.csv:317" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-82.22446), 143.24158).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("2R950000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 317 " + code); None => println("OLC_ENCODING_MISMATCH 317 NONE") }
  }
  assert_eq(actual, Some("2R950000+"))
}

///|
test "official OLC encoding.csv:318" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-31.80606), -102.08156).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("45WV0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 318 " + code); None => println("OLC_ENCODING_MISMATCH 318 NONE") }
  }
  assert_eq(actual, Some("45WV0000+"))
}

///|
test "official OLC encoding.csv:319" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(14.94989456), 96.10671106).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("7M6RW4X4+XM4Q") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 319 " + code); None => println("OLC_ENCODING_MISMATCH 319 NONE") }
  }
  assert_eq(actual, Some("7M6RW4X4+XM4Q"))
}

///|
test "official OLC encoding.csv:320" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-15.1003381685), 99.53259414053).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("5MPXVGXM+V29") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 320 " + code); None => println("OLC_ENCODING_MISMATCH 320 NONE") }
  }
  assert_eq(actual, Some("5MPXVGXM+V29"))
}

///|
test "official OLC encoding.csv:321" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-69.454655869), 97.369726083).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("3M2VG900+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 321 " + code); None => println("OLC_ENCODING_MISMATCH 321 NONE") }
  }
  assert_eq(actual, Some("3M2VG900+"))
}

///|
test "official OLC encoding.csv:322" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(47.6915368), -109.0087879).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("85VGMX00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 322 " + code); None => println("OLC_ENCODING_MISMATCH 322 NONE") }
  }
  assert_eq(actual, Some("85VGMX00+"))
}

///|
test "official OLC encoding.csv:323" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(99.2751473), 147.8120144).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("CRX9XRX6+XR") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 323 " + code); None => println("OLC_ENCODING_MISMATCH 323 NONE") }
  }
  assert_eq(actual, Some("CRX9XRX6+XR"))
}

///|
test "official OLC encoding.csv:324" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(27.6309), -98.7061).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("76000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 324 " + code); None => println("OLC_ENCODING_MISMATCH 324 NONE") }
  }
  assert_eq(actual, Some("76000000+"))
}

///|
test "official OLC encoding.csv:325" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(27.24379), 92.39247).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("7MVJ69VR+GX9J") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 325 " + code); None => println("OLC_ENCODING_MISMATCH 325 NONE") }
  }
  assert_eq(actual, Some("7MVJ69VR+GX9J"))
}

///|
test "official OLC encoding.csv:326" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-79.78071), 133.6629).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("2QGM6M97+P5") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 326 " + code); None => println("OLC_ENCODING_MISMATCH 326 NONE") }
  }
  assert_eq(actual, Some("2QGM6M97+P5"))
}

///|
test "official OLC encoding.csv:327" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-94.55098016), -95.68553772).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("26262827+2Q4") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 327 " + code); None => println("OLC_ENCODING_MISMATCH 327 NONE") }
  }
  assert_eq(actual, Some("26262827+2Q4"))
}

///|
test "official OLC encoding.csv:328" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-18.1), -83.091).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("56HRWW25+2J222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 328 " + code); None => println("OLC_ENCODING_MISMATCH 328 NONE") }
  }
  assert_eq(actual, Some("56HRWW25+2J222"))
}

///|
test "official OLC encoding.csv:329" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-35.015055), 73.71757).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("4JPMXPM9+X2GR") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 329 " + code); None => println("OLC_ENCODING_MISMATCH 329 NONE") }
  }
  assert_eq(actual, Some("4JPMXPM9+X2GR"))
}

///|
test "official OLC encoding.csv:330" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-87.7171), 177.5628).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("2V4V7HM7+54743") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 330 " + code); None => println("OLC_ENCODING_MISMATCH 330 NONE") }
  }
  assert_eq(actual, Some("2V4V7HM7+54743"))
}

///|
test "official OLC encoding.csv:331" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(56.55872), 54.19708).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("9H8PH55W+FRP") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 331 " + code); None => println("OLC_ENCODING_MISMATCH 331 NONE") }
  }
  assert_eq(actual, Some("9H8PH55W+FRP"))
}

///|
test "official OLC encoding.csv:332" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-28.642), 71.2607).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("5J3H9756+674") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 332 " + code); None => println("OLC_ENCODING_MISMATCH 332 NONE") }
  }
  assert_eq(actual, Some("5J3H9756+674"))
}

///|
test "official OLC encoding.csv:333" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-44.755), 21.329).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("4G7368WH+2J") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 333 " + code); None => println("OLC_ENCODING_MISMATCH 333 NONE") }
  }
  assert_eq(actual, Some("4G7368WH+2J"))
}

///|
test "official OLC encoding.csv:334" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-58.284), 44.435).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("3HH6PC8P+C222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 334 " + code); None => println("OLC_ENCODING_MISMATCH 334 NONE") }
  }
  assert_eq(actual, Some("3HH6PC8P+C222222"))
}

///|
test "official OLC encoding.csv:335" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(13.469), -118.034).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("7553FX98+JC2") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 335 " + code); None => println("OLC_ENCODING_MISMATCH 335 NONE") }
  }
  assert_eq(actual, Some("7553FX98+JC2"))
}

///|
test "official OLC encoding.csv:336" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(40.615), 173.901).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("8V000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 336 " + code); None => println("OLC_ENCODING_MISMATCH 336 NONE") }
  }
  assert_eq(actual, Some("8V000000+"))
}

///|
test "official OLC encoding.csv:337" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(62), -95).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("96J72222+2222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 337 " + code); None => println("OLC_ENCODING_MISMATCH 337 NONE") }
  }
  assert_eq(actual, Some("96J72222+2222"))
}

///|
test "official OLC encoding.csv:338" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-5.2221889), 139.2054401).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("6Q6X0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 338 " + code); None => println("OLC_ENCODING_MISMATCH 338 NONE") }
  }
  assert_eq(actual, Some("6Q6X0000+"))
}

///|
test "official OLC encoding.csv:339" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-24.8), -7.1).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("5C7J0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 339 " + code); None => println("OLC_ENCODING_MISMATCH 339 NONE") }
  }
  assert_eq(actual, Some("5C7J0000+"))
}

///|
test "official OLC encoding.csv:340" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(41.5), 0.4).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("8FH2GC22+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 340 " + code); None => println("OLC_ENCODING_MISMATCH 340 NONE") }
  }
  assert_eq(actual, Some("8FH2GC22+"))
}

///|
test "official OLC encoding.csv:341" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-58.89638156814), -177.07241353875).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("32H44W3H+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 341 " + code); None => println("OLC_ENCODING_MISMATCH 341 NONE") }
  }
  assert_eq(actual, Some("32H44W3H+"))
}

///|
test "official OLC encoding.csv:342" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(99.9924124), 168.8859945).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=13)
  if actual != Some("CVXCXVXP+X9XXV") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 342 " + code); None => println("OLC_ENCODING_MISMATCH 342 NONE") }
  }
  assert_eq(actual, Some("CVXCXVXP+X9XXV"))
}

///|
test "official OLC encoding.csv:343" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-81.83814), 13.38568).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("2FCM596P+P7") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 343 " + code); None => println("OLC_ENCODING_MISMATCH 343 NONE") }
  }
  assert_eq(actual, Some("2FCM596P+P7"))
}

///|
test "official OLC encoding.csv:344" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-81.641294), -26.677758).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("29CM985C+FVQ8") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 344 " + code); None => println("OLC_ENCODING_MISMATCH 344 NONE") }
  }
  assert_eq(actual, Some("29CM985C+FVQ8"))
}

///|
test "official OLC encoding.csv:345" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-38.1), -34.8).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("49H7W600+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 345 " + code); None => println("OLC_ENCODING_MISMATCH 345 NONE") }
  }
  assert_eq(actual, Some("49H7W600+"))
}

///|
test "official OLC encoding.csv:346" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(30.760710361), 5.623188694).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("8F27QJ6F+77PC") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 346 " + code); None => println("OLC_ENCODING_MISMATCH 346 NONE") }
  }
  assert_eq(actual, Some("8F27QJ6F+77PC"))
}

///|
test "official OLC encoding.csv:347" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-41), -7).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=8)
  if actual != Some("4CFM2222+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 347 " + code); None => println("OLC_ENCODING_MISMATCH 347 NONE") }
  }
  assert_eq(actual, Some("4CFM2222+"))
}

///|
test "official OLC encoding.csv:348" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(80.2976), 17.4494).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("CFGV7C00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 348 " + code); None => println("OLC_ENCODING_MISMATCH 348 NONE") }
  }
  assert_eq(actual, Some("CFGV7C00+"))
}

///|
test "official OLC encoding.csv:349" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-0.8932), -141.8127).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("63FW454P+PW") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 349 " + code); None => println("OLC_ENCODING_MISMATCH 349 NONE") }
  }
  assert_eq(actual, Some("63FW454P+PW"))
}

///|
test "official OLC encoding.csv:350" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(51.1973191264), -176.284450577).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("92355PW8+W6FPV3") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 350 " + code); None => println("OLC_ENCODING_MISMATCH 350 NONE") }
  }
  assert_eq(actual, Some("92355PW8+W6FPV3"))
}

///|
test "official OLC encoding.csv:351" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(64.3538), 37.6501).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("9GPV9M00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 351 " + code); None => println("OLC_ENCODING_MISMATCH 351 NONE") }
  }
  assert_eq(actual, Some("9GPV9M00+"))
}

///|
test "official OLC encoding.csv:352" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-7.741571), -114.569063).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("65470000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 352 " + code); None => println("OLC_ENCODING_MISMATCH 352 NONE") }
  }
  assert_eq(actual, Some("65470000+"))
}

///|
test "official OLC encoding.csv:353" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(59.668), -73.133).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=6)
  if actual != Some("97F8MV00+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 353 " + code); None => println("OLC_ENCODING_MISMATCH 353 NONE") }
  }
  assert_eq(actual, Some("97F8MV00+"))
}

///|
test "official OLC encoding.csv:354" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(72.146589), -166.255204).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=4)
  if actual != Some("C24M0000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 354 " + code); None => println("OLC_ENCODING_MISMATCH 354 NONE") }
  }
  assert_eq(actual, Some("C24M0000+"))
}

///|
test "official OLC encoding.csv:355" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(45.7536561), -77.9826424).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("87Q4Q238+FW9") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 355 " + code); None => println("OLC_ENCODING_MISMATCH 355 NONE") }
  }
  assert_eq(actual, Some("87Q4Q238+FW9"))
}

///|
test "official OLC encoding.csv:356" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(20.59532), 58.43522).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("7HGWHCWP+43HR244") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 356 " + code); None => println("OLC_ENCODING_MISMATCH 356 NONE") }
  }
  assert_eq(actual, Some("7HGWHCWP+43HR244"))
}

///|
test "official OLC encoding.csv:357" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-2.22208790893), -129.52868305886).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("649GQFHC+5G8") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 357 " + code); None => println("OLC_ENCODING_MISMATCH 357 NONE") }
  }
  assert_eq(actual, Some("649GQFHC+5G8"))
}

///|
test "official OLC encoding.csv:358" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(21.37734168211), -19.82122122854).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("7C000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 358 " + code); None => println("OLC_ENCODING_MISMATCH 358 NONE") }
  }
  assert_eq(actual, Some("7C000000+"))
}

///|
test "official OLC encoding.csv:359" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(71.0833633113), -21.3584667975).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("C93W3JMR+8JVC") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 359 " + code); None => println("OLC_ENCODING_MISMATCH 359 NONE") }
  }
  assert_eq(actual, Some("C93W3JMR+8JVC"))
}

///|
test "official OLC encoding.csv:360" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(48.64), 42.02).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=10)
  if actual != Some("8HW4J2RC+22") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 360 " + code); None => println("OLC_ENCODING_MISMATCH 360 NONE") }
  }
  assert_eq(actual, Some("8HW4J2RC+22"))
}

///|
test "official OLC encoding.csv:361" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(2.28), 65.18).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("6JJ775JJ+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 361 " + code); None => println("OLC_ENCODING_MISMATCH 361 NONE") }
  }
  assert_eq(actual, Some("6JJ775JJ+222"))
}

///|
test "official OLC encoding.csv:362" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(66), -15).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=14)
  if actual != Some("9CR72222+222222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 362 " + code); None => println("OLC_ENCODING_MISMATCH 362 NONE") }
  }
  assert_eq(actual, Some("9CR72222+222222"))
}

///|
test "official OLC encoding.csv:363" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(82.988994321), -114.039676643).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("C5000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 363 " + code); None => println("OLC_ENCODING_MISMATCH 363 NONE") }
  }
  assert_eq(actual, Some("C5000000+"))
}

///|
test "official OLC encoding.csv:364" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(-32.04), -9.54).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=11)
  if actual != Some("4CVGXF66+222") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 364 " + code); None => println("OLC_ENCODING_MISMATCH 364 NONE") }
  }
  assert_eq(actual, Some("4CVGXF66+222"))
}

///|
test "official OLC encoding.csv:365" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(98.43557), -184.42545).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=12)
  if actual != Some("CVXQXHXF+XRVW") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 365 " + code); None => println("OLC_ENCODING_MISMATCH 365 NONE") }
  }
  assert_eq(actual, Some("CVXQXHXF+XRVW"))
}

///|
test "official OLC encoding.csv:366" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(71.75744246), -62.00099498).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=2)
  if actual != Some("C7000000+") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 366 " + code); None => println("OLC_ENCODING_MISMATCH 366 NONE") }
  }
  assert_eq(actual, Some("C7000000+"))
}

///|
test "official OLC encoding.csv:367" {
  let point = @geocodec.LatLng::new(@geocodec.clamp_lat(51.089925), 72.339482).unwrap()
  let actual = @geocodec.pluscode_encode(point, code_length=15)
  if actual != Some("9J3J38QQ+XQH3452") {
    match actual { Some(code) => println("OLC_ENCODING_MISMATCH 367 " + code); None => println("OLC_ENCODING_MISMATCH 367 NONE") }
  }
  assert_eq(actual, Some("9J3J38QQ+XQH3452"))
}

///|
test "official OLC decoding.csv:11" {
  let box = @geocodec.pluscode_bounds("7FG49Q00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7FG49Q00+"), 6)
  assert_true((box.south() - (20.35)).abs() <= 1.0e-10)
  assert_true((box.west() - (2.75)).abs() <= 1.0e-10)
  assert_true((box.north() - (20.4)).abs() <= 1.0e-10)
  assert_true((box.east() - (2.8)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:12" {
  let box = @geocodec.pluscode_bounds("7FG49QCJ+2V").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7FG49QCJ+2V"), 10)
  assert_true((box.south() - (20.37)).abs() <= 1.0e-10)
  assert_true((box.west() - (2.782125)).abs() <= 1.0e-10)
  assert_true((box.north() - (20.370125)).abs() <= 1.0e-10)
  assert_true((box.east() - (2.78225)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:13" {
  let box = @geocodec.pluscode_bounds("7FG49QCJ+2VX").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7FG49QCJ+2VX"), 11)
  assert_true((box.south() - (20.3701)).abs() <= 1.0e-10)
  assert_true((box.west() - (2.78221875)).abs() <= 1.0e-10)
  assert_true((box.north() - (20.370125)).abs() <= 1.0e-10)
  assert_true((box.east() - (2.78225)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:14" {
  let box = @geocodec.pluscode_bounds("7FG49QCJ+2VXGJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7FG49QCJ+2VXGJ"), 13)
  assert_true((box.south() - (20.370113)).abs() <= 1.0e-10)
  assert_true((box.west() - (2.782234375)).abs() <= 1.0e-10)
  assert_true((box.north() - (20.370114)).abs() <= 1.0e-10)
  assert_true((box.east() - (2.78223632813)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:15" {
  let box = @geocodec.pluscode_bounds("8FVC2222+22").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8FVC2222+22"), 10)
  assert_true((box.south() - (47)).abs() <= 1.0e-10)
  assert_true((box.west() - (8)).abs() <= 1.0e-10)
  assert_true((box.north() - (47.000125)).abs() <= 1.0e-10)
  assert_true((box.east() - (8.000125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:16" {
  let box = @geocodec.pluscode_bounds("4VCPPQGP+Q9").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4VCPPQGP+Q9"), 10)
  assert_true((box.south() - (-41.273125)).abs() <= 1.0e-10)
  assert_true((box.west() - (174.785875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-41.273)).abs() <= 1.0e-10)
  assert_true((box.east() - (174.786)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:17" {
  let box = @geocodec.pluscode_bounds("62G20000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("62G20000+"), 4)
  assert_true((box.south() - (0)).abs() <= 1.0e-10)
  assert_true((box.west() - (-180)).abs() <= 1.0e-10)
  assert_true((box.north() - (1)).abs() <= 1.0e-10)
  assert_true((box.east() - (-179)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:18" {
  let box = @geocodec.pluscode_bounds("22220000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("22220000+"), 4)
  assert_true((box.south() - (-90)).abs() <= 1.0e-10)
  assert_true((box.west() - (-180)).abs() <= 1.0e-10)
  assert_true((box.north() - (-89)).abs() <= 1.0e-10)
  assert_true((box.east() - (-179)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:19" {
  let box = @geocodec.pluscode_bounds("7FG40000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7FG40000+"), 4)
  assert_true((box.south() - (20)).abs() <= 1.0e-10)
  assert_true((box.west() - (2)).abs() <= 1.0e-10)
  assert_true((box.north() - (21)).abs() <= 1.0e-10)
  assert_true((box.east() - (3)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:20" {
  let box = @geocodec.pluscode_bounds("22222222+22").unwrap()
  assert_eq(@geocodec.pluscode_code_length("22222222+22"), 10)
  assert_true((box.south() - (-90)).abs() <= 1.0e-10)
  assert_true((box.west() - (-180)).abs() <= 1.0e-10)
  assert_true((box.north() - (-89.999875)).abs() <= 1.0e-10)
  assert_true((box.east() - (-179.999875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:21" {
  let box = @geocodec.pluscode_bounds("6VGX0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6VGX0000+"), 4)
  assert_true((box.south() - (0)).abs() <= 1.0e-10)
  assert_true((box.west() - (179)).abs() <= 1.0e-10)
  assert_true((box.north() - (1)).abs() <= 1.0e-10)
  assert_true((box.east() - (180)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:22" {
  let box = @geocodec.pluscode_bounds("6FH32222+222").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6FH32222+222"), 11)
  assert_true((box.south() - (1)).abs() <= 1.0e-10)
  assert_true((box.west() - (1)).abs() <= 1.0e-10)
  assert_true((box.north() - (1.000025)).abs() <= 1.0e-10)
  assert_true((box.east() - (1.00003125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:23" {
  let box = @geocodec.pluscode_bounds("CFX30000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CFX30000+"), 4)
  assert_true((box.south() - (89)).abs() <= 1.0e-10)
  assert_true((box.west() - (1)).abs() <= 1.0e-10)
  assert_true((box.north() - (90)).abs() <= 1.0e-10)
  assert_true((box.east() - (2)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:24" {
  let box = @geocodec.pluscode_bounds("62H20000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("62H20000+"), 4)
  assert_true((box.south() - (1)).abs() <= 1.0e-10)
  assert_true((box.west() - (-180)).abs() <= 1.0e-10)
  assert_true((box.north() - (2)).abs() <= 1.0e-10)
  assert_true((box.east() - (-179)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:25" {
  let box = @geocodec.pluscode_bounds("62H30000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("62H30000+"), 4)
  assert_true((box.south() - (1)).abs() <= 1.0e-10)
  assert_true((box.west() - (-179)).abs() <= 1.0e-10)
  assert_true((box.north() - (2)).abs() <= 1.0e-10)
  assert_true((box.east() - (-178)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:26" {
  let box = @geocodec.pluscode_bounds("CFX3X2X2+X2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CFX3X2X2+X2"), 10)
  assert_true((box.south() - (89.999875)).abs() <= 1.0e-10)
  assert_true((box.west() - (1)).abs() <= 1.0e-10)
  assert_true((box.north() - (90)).abs() <= 1.0e-10)
  assert_true((box.east() - (1.000125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:27" {
  let box = @geocodec.pluscode_bounds("84000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("84000000+"), 2)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (-140)).abs() <= 1.0e-10)
  assert_true((box.north() - (50)).abs() <= 1.0e-10)
  assert_true((box.east() - (-120)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:33" {
  let box = @geocodec.pluscode_bounds("6FH56C22+22").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6FH56C22+22"), 10)
  assert_true((box.south() - (1.2000000000000028)).abs() <= 1.0e-10)
  assert_true((box.west() - (3.4000000000000057)).abs() <= 1.0e-10)
  assert_true((box.north() - (1.2001249999999999)).abs() <= 1.0e-10)
  assert_true((box.east() - (3.4001250000000027)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:39" {
  let box = @geocodec.pluscode_bounds("849VGJQF+VX7QR3J").unwrap()
  assert_eq(@geocodec.pluscode_code_length("849VGJQF+VX7QR3J"), 15)
  assert_true((box.south() - (37.53966912)).abs() <= 1.0e-10)
  assert_true((box.west() - (-122.3750698242)).abs() <= 1.0e-10)
  assert_true((box.north() - (37.53966916)).abs() <= 1.0e-10)
  assert_true((box.east() - (-122.3750697021)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:40" {
  let box = @geocodec.pluscode_bounds("849VGJQF+VX7QR3J7QR3J").unwrap()
  assert_eq(@geocodec.pluscode_code_length("849VGJQF+VX7QR3J7QR3J"), 15)
  assert_true((box.south() - (37.53966912)).abs() <= 1.0e-10)
  assert_true((box.west() - (-122.3750698242)).abs() <= 1.0e-10)
  assert_true((box.north() - (37.53966916)).abs() <= 1.0e-10)
  assert_true((box.east() - (-122.3750697021)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:48" {
  let box = @geocodec.pluscode_bounds("5PVX2JXR+R6G29VC").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5PVX2JXR+R6G29VC"), 15)
  assert_true((box.south() - (-12.95044812)).abs() <= 1.0e-10)
  assert_true((box.west() - (119.640568847656)).abs() <= 1.0e-10)
  assert_true((box.north() - (-12.95044808)).abs() <= 1.0e-10)
  assert_true((box.east() - (119.640568969727)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:49" {
  let box = @geocodec.pluscode_bounds("55CJG366+PP").unwrap()
  assert_eq(@geocodec.pluscode_code_length("55CJG366+PP"), 10)
  assert_true((box.south() - (-21.48825)).abs() <= 1.0e-10)
  assert_true((box.west() - (-107.93825)).abs() <= 1.0e-10)
  assert_true((box.north() - (-21.488125)).abs() <= 1.0e-10)
  assert_true((box.east() - (-107.938125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:50" {
  let box = @geocodec.pluscode_bounds("4MC8JQQF+GG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4MC8JQQF+GG"), 10)
  assert_true((box.south() - (-41.36125)).abs() <= 1.0e-10)
  assert_true((box.west() - (86.77375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-41.361125)).abs() <= 1.0e-10)
  assert_true((box.east() - (86.773875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:51" {
  let box = @geocodec.pluscode_bounds("9R000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9R000000+"), 2)
  assert_true((box.south() - (50)).abs() <= 1.0e-10)
  assert_true((box.west() - (140)).abs() <= 1.0e-10)
  assert_true((box.north() - (70)).abs() <= 1.0e-10)
  assert_true((box.east() - (160)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:52" {
  let box = @geocodec.pluscode_bounds("44X9MM00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("44X9MM00+"), 6)
  assert_true((box.south() - (-30.35)).abs() <= 1.0e-10)
  assert_true((box.west() - (-132.35)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30.3)).abs() <= 1.0e-10)
  assert_true((box.east() - (-132.3)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:53" {
  let box = @geocodec.pluscode_bounds("3C000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3C000000+"), 2)
  assert_true((box.south() - (-70)).abs() <= 1.0e-10)
  assert_true((box.west() - (-20)).abs() <= 1.0e-10)
  assert_true((box.north() - (-50)).abs() <= 1.0e-10)
  assert_true((box.east() - (0)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:54" {
  let box = @geocodec.pluscode_bounds("65CQGXV4+J5FQPCF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("65CQGXV4+J5FQPCF"), 15)
  assert_true((box.south() - (-1.45593152)).abs() <= 1.0e-10)
  assert_true((box.west() - (-104.04456628418)).abs() <= 1.0e-10)
  assert_true((box.north() - (-1.45593148)).abs() <= 1.0e-10)
  assert_true((box.east() - (-104.044566162109)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:55" {
  let box = @geocodec.pluscode_bounds("4H94MH00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4H94MH00+"), 6)
  assert_true((box.south() - (-42.35)).abs() <= 1.0e-10)
  assert_true((box.west() - (42.55)).abs() <= 1.0e-10)
  assert_true((box.north() - (-42.3)).abs() <= 1.0e-10)
  assert_true((box.east() - (42.6)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:56" {
  let box = @geocodec.pluscode_bounds("CP9C0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CP9C0000+"), 4)
  assert_true((box.south() - (77)).abs() <= 1.0e-10)
  assert_true((box.west() - (108)).abs() <= 1.0e-10)
  assert_true((box.north() - (78)).abs() <= 1.0e-10)
  assert_true((box.east() - (109)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:57" {
  let box = @geocodec.pluscode_bounds("85F6GC93+RFFVC35").unwrap()
  assert_eq(@geocodec.pluscode_code_length("85F6GC93+RFFVC35"), 15)
  assert_true((box.south() - (39.519572)).abs() <= 1.0e-10)
  assert_true((box.west() - (-115.596335083008)).abs() <= 1.0e-10)
  assert_true((box.north() - (39.51957204)).abs() <= 1.0e-10)
  assert_true((box.east() - (-115.596334960937)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:58" {
  let box = @geocodec.pluscode_bounds("62VR8V49+M47GJQ7").unwrap()
  assert_eq(@geocodec.pluscode_code_length("62VR8V49+M47GJQ7"), 15)
  assert_true((box.south() - (7.30666364)).abs() <= 1.0e-10)
  assert_true((box.west() - (-163.132201538086)).abs() <= 1.0e-10)
  assert_true((box.north() - (7.30666368)).abs() <= 1.0e-10)
  assert_true((box.east() - (-163.132201416016)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:59" {
  let box = @geocodec.pluscode_bounds("CH3V0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CH3V0000+"), 4)
  assert_true((box.south() - (71)).abs() <= 1.0e-10)
  assert_true((box.west() - (57)).abs() <= 1.0e-10)
  assert_true((box.north() - (72)).abs() <= 1.0e-10)
  assert_true((box.east() - (58)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:60" {
  let box = @geocodec.pluscode_bounds("45VR59QV+7C4JVF5").unwrap()
  assert_eq(@geocodec.pluscode_code_length("45VR59QV+7C4JVF5"), 15)
  assert_true((box.south() - (-32.8118556)).abs() <= 1.0e-10)
  assert_true((box.west() - (-103.606434692383)).abs() <= 1.0e-10)
  assert_true((box.north() - (-32.81185556)).abs() <= 1.0e-10)
  assert_true((box.east() - (-103.606434570312)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:61" {
  let box = @geocodec.pluscode_bounds("2JH70000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2JH70000+"), 4)
  assert_true((box.south() - (-79)).abs() <= 1.0e-10)
  assert_true((box.west() - (65)).abs() <= 1.0e-10)
  assert_true((box.north() - (-78)).abs() <= 1.0e-10)
  assert_true((box.east() - (66)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:62" {
  let box = @geocodec.pluscode_bounds("8J7GRCCX+FMJWRQ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8J7GRCCX+FMJWRQ"), 14)
  assert_true((box.south() - (35.8212246)).abs() <= 1.0e-10)
  assert_true((box.west() - (70.449142089844)).abs() <= 1.0e-10)
  assert_true((box.north() - (35.8212248)).abs() <= 1.0e-10)
  assert_true((box.east() - (70.449142578125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:63" {
  let box = @geocodec.pluscode_bounds("96QQM963+G8J").unwrap()
  assert_eq(@geocodec.pluscode_code_length("96QQM963+G8J"), 11)
  assert_true((box.south() - (65.661325)).abs() <= 1.0e-10)
  assert_true((box.west() - (-84.64675)).abs() <= 1.0e-10)
  assert_true((box.north() - (65.66135)).abs() <= 1.0e-10)
  assert_true((box.east() - (-84.64671875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:64" {
  let box = @geocodec.pluscode_bounds("3HX66C3H+8PQQQPQ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3HX66C3H+8PQQQPQ"), 15)
  assert_true((box.south() - (-50.79665628)).abs() <= 1.0e-10)
  assert_true((box.west() - (44.429374389648)).abs() <= 1.0e-10)
  assert_true((box.north() - (-50.79665624)).abs() <= 1.0e-10)
  assert_true((box.east() - (44.429374511719)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:65" {
  let box = @geocodec.pluscode_bounds("3MRGM4GH+56").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3MRGM4GH+56"), 10)
  assert_true((box.south() - (-53.324625)).abs() <= 1.0e-10)
  assert_true((box.west() - (90.128)).abs() <= 1.0e-10)
  assert_true((box.north() - (-53.3245)).abs() <= 1.0e-10)
  assert_true((box.east() - (90.128125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:66" {
  let box = @geocodec.pluscode_bounds("95000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("95000000+"), 2)
  assert_true((box.south() - (50)).abs() <= 1.0e-10)
  assert_true((box.west() - (-120)).abs() <= 1.0e-10)
  assert_true((box.north() - (70)).abs() <= 1.0e-10)
  assert_true((box.east() - (-100)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:67" {
  let box = @geocodec.pluscode_bounds("4J86FVGW+9449").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4J86FVGW+9449"), 12)
  assert_true((box.south() - (-43.52412)).abs() <= 1.0e-10)
  assert_true((box.west() - (64.8953359375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-43.524115)).abs() <= 1.0e-10)
  assert_true((box.east() - (64.89534375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:68" {
  let box = @geocodec.pluscode_bounds("65XHHXX7+FCQ825M").unwrap()
  assert_eq(@geocodec.pluscode_code_length("65XHHXX7+FCQ825M"), 15)
  assert_true((box.south() - (9.59870512)).abs() <= 1.0e-10)
  assert_true((box.west() - (-108.036389038086)).abs() <= 1.0e-10)
  assert_true((box.north() - (9.59870516)).abs() <= 1.0e-10)
  assert_true((box.east() - (-108.036388916016)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:69" {
  let box = @geocodec.pluscode_bounds("549QX497+9X").unwrap()
  assert_eq(@geocodec.pluscode_code_length("549QX497+9X"), 10)
  assert_true((box.south() - (-22.031625)).abs() <= 1.0e-10)
  assert_true((box.west() - (-124.885125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-22.0315)).abs() <= 1.0e-10)
  assert_true((box.east() - (-124.885)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:70" {
  let box = @geocodec.pluscode_bounds("4VXPHWHV+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4VXPHWHV+"), 8)
  assert_true((box.south() - (-30.4225)).abs() <= 1.0e-10)
  assert_true((box.west() - (174.9425)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30.42)).abs() <= 1.0e-10)
  assert_true((box.east() - (174.945)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:71" {
  let box = @geocodec.pluscode_bounds("CRGCQWQW+MW9GXRJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CRGCQWQW+MW9GXRJ"), 15)
  assert_true((box.south() - (80.78916492)).abs() <= 1.0e-10)
  assert_true((box.west() - (148.947365234375)).abs() <= 1.0e-10)
  assert_true((box.north() - (80.78916496)).abs() <= 1.0e-10)
  assert_true((box.east() - (148.947365356445)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:72" {
  let box = @geocodec.pluscode_bounds("49000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("49000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (-40)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (-20)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:73" {
  let box = @geocodec.pluscode_bounds("84QR4V00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("84QR4V00+"), 6)
  assert_true((box.south() - (45.1)).abs() <= 1.0e-10)
  assert_true((box.west() - (-123.15)).abs() <= 1.0e-10)
  assert_true((box.north() - (45.15)).abs() <= 1.0e-10)
  assert_true((box.east() - (-123.1)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:74" {
  let box = @geocodec.pluscode_bounds("3JW85H3C+77W").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3JW85H3C+77W"), 11)
  assert_true((box.south() - (-51.846775)).abs() <= 1.0e-10)
  assert_true((box.west() - (66.5706875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-51.84675)).abs() <= 1.0e-10)
  assert_true((box.east() - (66.57071875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:75" {
  let box = @geocodec.pluscode_bounds("3VM34V75+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3VM34V75+"), 8)
  assert_true((box.south() - (-56.8875)).abs() <= 1.0e-10)
  assert_true((box.west() - (161.8575)).abs() <= 1.0e-10)
  assert_true((box.north() - (-56.885)).abs() <= 1.0e-10)
  assert_true((box.east() - (161.86)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:76" {
  let box = @geocodec.pluscode_bounds("6FPW3600+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6FPW3600+"), 6)
  assert_true((box.south() - (4.05)).abs() <= 1.0e-10)
  assert_true((box.west() - (18.2)).abs() <= 1.0e-10)
  assert_true((box.north() - (4.1)).abs() <= 1.0e-10)
  assert_true((box.east() - (18.25)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:77" {
  let box = @geocodec.pluscode_bounds("6J6CWMHX+22H").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6J6CWMHX+22H"), 11)
  assert_true((box.south() - (-5.07245)).abs() <= 1.0e-10)
  assert_true((box.west() - (68.69759375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-5.072425)).abs() <= 1.0e-10)
  assert_true((box.east() - (68.697625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:78" {
  let box = @geocodec.pluscode_bounds("C8C35800+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C8C35800+"), 6)
  assert_true((box.south() - (78.15)).abs() <= 1.0e-10)
  assert_true((box.west() - (-58.7)).abs() <= 1.0e-10)
  assert_true((box.north() - (78.2)).abs() <= 1.0e-10)
  assert_true((box.east() - (-58.65)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:79" {
  let box = @geocodec.pluscode_bounds("957W3H38+QV87WJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("957W3H38+QV87WJ"), 14)
  assert_true((box.south() - (55.0544096)).abs() <= 1.0e-10)
  assert_true((box.west() - (-101.43280078125)).abs() <= 1.0e-10)
  assert_true((box.north() - (55.0544098)).abs() <= 1.0e-10)
  assert_true((box.east() - (-101.432800292969)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:80" {
  let box = @geocodec.pluscode_bounds("7G6MCJCM+58").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7G6MCJCM+58"), 10)
  assert_true((box.south() - (14.420375)).abs() <= 1.0e-10)
  assert_true((box.west() - (33.63325)).abs() <= 1.0e-10)
  assert_true((box.north() - (14.4205)).abs() <= 1.0e-10)
  assert_true((box.east() - (33.633375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:81" {
  let box = @geocodec.pluscode_bounds("7RF4Q6V9+FQ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7RF4Q6V9+FQ"), 10)
  assert_true((box.south() - (19.793625)).abs() <= 1.0e-10)
  assert_true((box.west() - (142.219375)).abs() <= 1.0e-10)
  assert_true((box.north() - (19.79375)).abs() <= 1.0e-10)
  assert_true((box.east() - (142.2195)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:82" {
  let box = @geocodec.pluscode_bounds("CP34GQPV+6V5JWJH").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CP34GQPV+6V5JWJH"), 15)
  assert_true((box.south() - (71.53551968)).abs() <= 1.0e-10)
  assert_true((box.west() - (102.794723022461)).abs() <= 1.0e-10)
  assert_true((box.north() - (71.53551972)).abs() <= 1.0e-10)
  assert_true((box.east() - (102.794723144531)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:83" {
  let box = @geocodec.pluscode_bounds("3CQ3C2HG+RGF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3CQ3C2HG+RGF"), 11)
  assert_true((box.south() - (-54.57045)).abs() <= 1.0e-10)
  assert_true((box.west() - (-18.97371875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-54.570425)).abs() <= 1.0e-10)
  assert_true((box.east() - (-18.9736875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:84" {
  let box = @geocodec.pluscode_bounds("CJ2739CG+F96").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CJ2739CG+F96"), 11)
  assert_true((box.south() - (70.07115)).abs() <= 1.0e-10)
  assert_true((box.west() - (65.375875)).abs() <= 1.0e-10)
  assert_true((box.north() - (70.071175)).abs() <= 1.0e-10)
  assert_true((box.east() - (65.37590625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:85" {
  let box = @geocodec.pluscode_bounds("6C65F6G8+RWWHX28").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6C65F6G8+RWWHX28"), 15)
  assert_true((box.south() - (-5.52288596)).abs() <= 1.0e-10)
  assert_true((box.west() - (-16.782657958984)).abs() <= 1.0e-10)
  assert_true((box.north() - (-5.52288592)).abs() <= 1.0e-10)
  assert_true((box.east() - (-16.782657836914)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:86" {
  let box = @geocodec.pluscode_bounds("4H6H0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4H6H0000+"), 4)
  assert_true((box.south() - (-46)).abs() <= 1.0e-10)
  assert_true((box.west() - (51)).abs() <= 1.0e-10)
  assert_true((box.north() - (-45)).abs() <= 1.0e-10)
  assert_true((box.east() - (52)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:87" {
  let box = @geocodec.pluscode_bounds("4M4JH7P2+976CCF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4M4JH7P2+976CCF"), 14)
  assert_true((box.south() - (-47.4140876)).abs() <= 1.0e-10)
  assert_true((box.west() - (92.250625488281)).abs() <= 1.0e-10)
  assert_true((box.north() - (-47.4140874)).abs() <= 1.0e-10)
  assert_true((box.east() - (92.250625976562)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:88" {
  let box = @geocodec.pluscode_bounds("8JV8RQR4+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8JV8RQR4+"), 8)
  assert_true((box.south() - (47.84)).abs() <= 1.0e-10)
  assert_true((box.west() - (66.755)).abs() <= 1.0e-10)
  assert_true((box.north() - (47.8425)).abs() <= 1.0e-10)
  assert_true((box.east() - (66.7575)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:89" {
  let box = @geocodec.pluscode_bounds("9GX42XPM+GR").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9GX42XPM+GR"), 10)
  assert_true((box.south() - (69.03625)).abs() <= 1.0e-10)
  assert_true((box.west() - (22.9845)).abs() <= 1.0e-10)
  assert_true((box.north() - (69.036375)).abs() <= 1.0e-10)
  assert_true((box.east() - (22.984625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:90" {
  let box = @geocodec.pluscode_bounds("78F89QG8+QC").unwrap()
  assert_eq(@geocodec.pluscode_code_length("78F89QG8+QC"), 10)
  assert_true((box.south() - (19.376875)).abs() <= 1.0e-10)
  assert_true((box.west() - (-53.234)).abs() <= 1.0e-10)
  assert_true((box.north() - (19.377)).abs() <= 1.0e-10)
  assert_true((box.east() - (-53.233875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:91" {
  let box = @geocodec.pluscode_bounds("4R2PJ94J+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4R2PJ94J+"), 8)
  assert_true((box.south() - (-49.395)).abs() <= 1.0e-10)
  assert_true((box.west() - (154.38)).abs() <= 1.0e-10)
  assert_true((box.north() - (-49.3925)).abs() <= 1.0e-10)
  assert_true((box.east() - (154.3825)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:92" {
  let box = @geocodec.pluscode_bounds("9C3WMG3W+56").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9C3WMG3W+56"), 10)
  assert_true((box.south() - (51.652875)).abs() <= 1.0e-10)
  assert_true((box.west() - (-1.4545)).abs() <= 1.0e-10)
  assert_true((box.north() - (51.653)).abs() <= 1.0e-10)
  assert_true((box.east() - (-1.454375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:93" {
  let box = @geocodec.pluscode_bounds("6H920000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6H920000+"), 4)
  assert_true((box.south() - (-3)).abs() <= 1.0e-10)
  assert_true((box.west() - (40)).abs() <= 1.0e-10)
  assert_true((box.north() - (-2)).abs() <= 1.0e-10)
  assert_true((box.east() - (41)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:94" {
  let box = @geocodec.pluscode_bounds("2RGG5624+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2RGG5624+"), 8)
  assert_true((box.south() - (-79.85)).abs() <= 1.0e-10)
  assert_true((box.west() - (150.205)).abs() <= 1.0e-10)
  assert_true((box.north() - (-79.8475)).abs() <= 1.0e-10)
  assert_true((box.east() - (150.2075)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:95" {
  let box = @geocodec.pluscode_bounds("2JFPCJ3Q+5Q").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2JFPCJ3Q+5Q"), 10)
  assert_true((box.south() - (-80.597125)).abs() <= 1.0e-10)
  assert_true((box.west() - (74.639375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-80.597)).abs() <= 1.0e-10)
  assert_true((box.east() - (74.6395)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:96" {
  let box = @geocodec.pluscode_bounds("67XVW47W+CM2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("67XVW47W+CM2"), 11)
  assert_true((box.south() - (9.9135)).abs() <= 1.0e-10)
  assert_true((box.west() - (-62.853375)).abs() <= 1.0e-10)
  assert_true((box.north() - (9.913525)).abs() <= 1.0e-10)
  assert_true((box.east() - (-62.85334375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:97" {
  let box = @geocodec.pluscode_bounds("5QRW0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5QRW0000+"), 4)
  assert_true((box.south() - (-14)).abs() <= 1.0e-10)
  assert_true((box.west() - (138)).abs() <= 1.0e-10)
  assert_true((box.north() - (-13)).abs() <= 1.0e-10)
  assert_true((box.east() - (139)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:98" {
  let box = @geocodec.pluscode_bounds("75000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("75000000+"), 2)
  assert_true((box.south() - (10)).abs() <= 1.0e-10)
  assert_true((box.west() - (-120)).abs() <= 1.0e-10)
  assert_true((box.north() - (30)).abs() <= 1.0e-10)
  assert_true((box.east() - (-100)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:99" {
  let box = @geocodec.pluscode_bounds("58XW3X00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("58XW3X00+"), 6)
  assert_true((box.south() - (-10.95)).abs() <= 1.0e-10)
  assert_true((box.west() - (-41.05)).abs() <= 1.0e-10)
  assert_true((box.north() - (-10.9)).abs() <= 1.0e-10)
  assert_true((box.east() - (-41)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:100" {
  let box = @geocodec.pluscode_bounds("25GWG27P+P98C").unwrap()
  assert_eq(@geocodec.pluscode_code_length("25GWG27P+P98C"), 12)
  assert_true((box.south() - (-79.485715)).abs() <= 1.0e-10)
  assert_true((box.west() - (-101.9640625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-79.48571)).abs() <= 1.0e-10)
  assert_true((box.east() - (-101.9640546875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:101" {
  let box = @geocodec.pluscode_bounds("566GH5VR+XRM2HF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("566GH5VR+XRM2HF"), 14)
  assert_true((box.south() - (-25.4050476)).abs() <= 1.0e-10)
  assert_true((box.west() - (-89.807962402344)).abs() <= 1.0e-10)
  assert_true((box.north() - (-25.4050474)).abs() <= 1.0e-10)
  assert_true((box.east() - (-89.807961914063)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:102" {
  let box = @geocodec.pluscode_bounds("3RRJ375F+C4XM9").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3RRJ375F+C4XM9"), 13)
  assert_true((box.south() - (-53.941384)).abs() <= 1.0e-10)
  assert_true((box.west() - (152.272857421875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-53.941383)).abs() <= 1.0e-10)
  assert_true((box.east() - (152.272859375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:103" {
  let box = @geocodec.pluscode_bounds("92RW3MQQ+RF8W").unwrap()
  assert_eq(@geocodec.pluscode_code_length("92RW3MQQ+RF8W"), 12)
  assert_true((box.south() - (66.089545)).abs() <= 1.0e-10)
  assert_true((box.west() - (-161.311296875)).abs() <= 1.0e-10)
  assert_true((box.north() - (66.08955)).abs() <= 1.0e-10)
  assert_true((box.east() - (-161.3112890625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:104" {
  let box = @geocodec.pluscode_bounds("8C754Q00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8C754Q00+"), 6)
  assert_true((box.south() - (35.1)).abs() <= 1.0e-10)
  assert_true((box.west() - (-16.25)).abs() <= 1.0e-10)
  assert_true((box.north() - (35.15)).abs() <= 1.0e-10)
  assert_true((box.east() - (-16.2)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:105" {
  let box = @geocodec.pluscode_bounds("67PR62FC+4V6").unwrap()
  assert_eq(@geocodec.pluscode_code_length("67PR62FC+4V6"), 11)
  assert_true((box.south() - (4.222775)).abs() <= 1.0e-10)
  assert_true((box.west() - (-63.977875)).abs() <= 1.0e-10)
  assert_true((box.north() - (4.2228)).abs() <= 1.0e-10)
  assert_true((box.east() - (-63.97784375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:106" {
  let box = @geocodec.pluscode_bounds("47CWVMMX+VX3PF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("47CWVMMX+VX3PF"), 13)
  assert_true((box.south() - (-41.115358)).abs() <= 1.0e-10)
  assert_true((box.west() - (-61.300076171875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-41.115357)).abs() <= 1.0e-10)
  assert_true((box.east() - (-61.30007421875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:107" {
  let box = @geocodec.pluscode_bounds("5P8C9J59+7C8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5P8C9J59+7C8"), 11)
  assert_true((box.south() - (-23.64185)).abs() <= 1.0e-10)
  assert_true((box.west() - (108.6185625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-23.641825)).abs() <= 1.0e-10)
  assert_true((box.east() - (108.61859375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:108" {
  let box = @geocodec.pluscode_bounds("5V895547+V6VV2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5V895547+V6VV2"), 13)
  assert_true((box.south() - (-23.842755)).abs() <= 1.0e-10)
  assert_true((box.west() - (167.1630390625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-23.842754)).abs() <= 1.0e-10)
  assert_true((box.east() - (167.163041015625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:109" {
  let box = @geocodec.pluscode_bounds("4V44CC8J+XR").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4V44CC8J+XR"), 10)
  assert_true((box.south() - (-47.582625)).abs() <= 1.0e-10)
  assert_true((box.west() - (162.432)).abs() <= 1.0e-10)
  assert_true((box.north() - (-47.5825)).abs() <= 1.0e-10)
  assert_true((box.east() - (162.432125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:110" {
  let box = @geocodec.pluscode_bounds("5RQ9PJQ6+FG7").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5RQ9PJQ6+FG7"), 11)
  assert_true((box.south() - (-14.26135)).abs() <= 1.0e-10)
  assert_true((box.west() - (147.61128125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-14.261325)).abs() <= 1.0e-10)
  assert_true((box.east() - (147.6113125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:111" {
  let box = @geocodec.pluscode_bounds("CQWFC6MM+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CQWFC6MM+"), 8)
  assert_true((box.south() - (88.4325)).abs() <= 1.0e-10)
  assert_true((box.west() - (129.2325)).abs() <= 1.0e-10)
  assert_true((box.north() - (88.435)).abs() <= 1.0e-10)
  assert_true((box.east() - (129.235)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:112" {
  let box = @geocodec.pluscode_bounds("23P4XX97+VQQPV3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("23P4XX97+VQQPV3"), 14)
  assert_true((box.south() - (-75.030281)).abs() <= 1.0e-10)
  assert_true((box.west() - (-157.035513183594)).abs() <= 1.0e-10)
  assert_true((box.north() - (-75.0302808)).abs() <= 1.0e-10)
  assert_true((box.east() - (-157.035512695313)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:113" {
  let box = @geocodec.pluscode_bounds("9P000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9P000000+"), 2)
  assert_true((box.south() - (50)).abs() <= 1.0e-10)
  assert_true((box.west() - (100)).abs() <= 1.0e-10)
  assert_true((box.north() - (70)).abs() <= 1.0e-10)
  assert_true((box.east() - (120)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:114" {
  let box = @geocodec.pluscode_bounds("335PJHX7+WQ4VVW").unwrap()
  assert_eq(@geocodec.pluscode_code_length("335PJHX7+WQ4VVW"), 14)
  assert_true((box.south() - (-66.3502252)).abs() <= 1.0e-10)
  assert_true((box.west() - (-145.435551757813)).abs() <= 1.0e-10)
  assert_true((box.north() - (-66.350225)).abs() <= 1.0e-10)
  assert_true((box.east() - (-145.435551269531)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:115" {
  let box = @geocodec.pluscode_bounds("7J9X0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7J9X0000+"), 4)
  assert_true((box.south() - (17)).abs() <= 1.0e-10)
  assert_true((box.west() - (79)).abs() <= 1.0e-10)
  assert_true((box.north() - (18)).abs() <= 1.0e-10)
  assert_true((box.east() - (80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:116" {
  let box = @geocodec.pluscode_bounds("4GF2FPXX+2WQX").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4GF2FPXX+2WQX"), 12)
  assert_true((box.south() - (-40.502405)).abs() <= 1.0e-10)
  assert_true((box.west() - (20.7498671875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-40.5024)).abs() <= 1.0e-10)
  assert_true((box.east() - (20.749875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:117" {
  let box = @geocodec.pluscode_bounds("CPFGJRQQ+3C").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CPFGJRQQ+3C"), 10)
  assert_true((box.south() - (79.637625)).abs() <= 1.0e-10)
  assert_true((box.west() - (110.8385)).abs() <= 1.0e-10)
  assert_true((box.north() - (79.63775)).abs() <= 1.0e-10)
  assert_true((box.east() - (110.838625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:118" {
  let box = @geocodec.pluscode_bounds("55VGVGR5+JR4").unwrap()
  assert_eq(@geocodec.pluscode_code_length("55VGVGR5+JR4"), 11)
  assert_true((box.south() - (-12.1085)).abs() <= 1.0e-10)
  assert_true((box.west() - (-109.4904375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-12.108475)).abs() <= 1.0e-10)
  assert_true((box.east() - (-109.49040625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:119" {
  let box = @geocodec.pluscode_bounds("C93W6600+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C93W6600+"), 6)
  assert_true((box.south() - (71.2)).abs() <= 1.0e-10)
  assert_true((box.west() - (-21.8)).abs() <= 1.0e-10)
  assert_true((box.north() - (71.25)).abs() <= 1.0e-10)
  assert_true((box.east() - (-21.75)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:120" {
  let box = @geocodec.pluscode_bounds("6934QPVW+2FVJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6934QPVW+2FVJ"), 12)
  assert_true((box.south() - (-8.207385)).abs() <= 1.0e-10)
  assert_true((box.west() - (-37.25384375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-8.20738)).abs() <= 1.0e-10)
  assert_true((box.east() - (-37.2538359375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:121" {
  let box = @geocodec.pluscode_bounds("9PF24294+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9PF24294+"), 8)
  assert_true((box.south() - (59.1175)).abs() <= 1.0e-10)
  assert_true((box.west() - (100.005)).abs() <= 1.0e-10)
  assert_true((box.north() - (59.12)).abs() <= 1.0e-10)
  assert_true((box.east() - (100.0075)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:122" {
  let box = @geocodec.pluscode_bounds("569879W8+V3CJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("569879W8+V3CJ"), 12)
  assert_true((box.south() - (-22.70281)).abs() <= 1.0e-10)
  assert_true((box.west() - (-93.634875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-22.702805)).abs() <= 1.0e-10)
  assert_true((box.east() - (-93.6348671875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:123" {
  let box = @geocodec.pluscode_bounds("264M0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("264M0000+"), 4)
  assert_true((box.south() - (-88)).abs() <= 1.0e-10)
  assert_true((box.west() - (-87)).abs() <= 1.0e-10)
  assert_true((box.north() - (-87)).abs() <= 1.0e-10)
  assert_true((box.east() - (-86)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:124" {
  let box = @geocodec.pluscode_bounds("72G5JW93+QVHM929").unwrap()
  assert_eq(@geocodec.pluscode_code_length("72G5JW93+QVHM929"), 15)
  assert_true((box.south() - (20.61944104)).abs() <= 1.0e-10)
  assert_true((box.west() - (-176.095267211914)).abs() <= 1.0e-10)
  assert_true((box.north() - (20.61944108)).abs() <= 1.0e-10)
  assert_true((box.east() - (-176.095267089844)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:125" {
  let box = @geocodec.pluscode_bounds("72PC636C+RXFJM3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("72PC636C+RXFJM3"), 14)
  assert_true((box.south() - (24.212068)).abs() <= 1.0e-10)
  assert_true((box.west() - (-171.927591308594)).abs() <= 1.0e-10)
  assert_true((box.north() - (24.2120682)).abs() <= 1.0e-10)
  assert_true((box.east() - (-171.927590820313)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:126" {
  let box = @geocodec.pluscode_bounds("98C3MM2W+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("98C3MM2W+"), 8)
  assert_true((box.south() - (58.65)).abs() <= 1.0e-10)
  assert_true((box.west() - (-58.305)).abs() <= 1.0e-10)
  assert_true((box.north() - (58.6525)).abs() <= 1.0e-10)
  assert_true((box.east() - (-58.3025)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:127" {
  let box = @geocodec.pluscode_bounds("783GF800+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("783GF800+"), 6)
  assert_true((box.south() - (11.45)).abs() <= 1.0e-10)
  assert_true((box.west() - (-49.7)).abs() <= 1.0e-10)
  assert_true((box.north() - (11.5)).abs() <= 1.0e-10)
  assert_true((box.east() - (-49.65)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:128" {
  let box = @geocodec.pluscode_bounds("49V5GX2J+H9F2RR").unwrap()
  assert_eq(@geocodec.pluscode_code_length("49V5GX2J+H9F2RR"), 14)
  assert_true((box.south() - (-32.4985702)).abs() <= 1.0e-10)
  assert_true((box.west() - (-36.01909375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-32.49857)).abs() <= 1.0e-10)
  assert_true((box.east() - (-36.019093261719)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:129" {
  let box = @geocodec.pluscode_bounds("5R8FQQC9+R6X3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5R8FQQC9+R6X3"), 12)
  assert_true((box.south() - (-23.2279)).abs() <= 1.0e-10)
  assert_true((box.west() - (149.7681015625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-23.227895)).abs() <= 1.0e-10)
  assert_true((box.east() - (149.768109375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:130" {
  let box = @geocodec.pluscode_bounds("78JHRRVP+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("78JHRRVP+"), 8)
  assert_true((box.south() - (22.8425)).abs() <= 1.0e-10)
  assert_true((box.west() - (-48.165)).abs() <= 1.0e-10)
  assert_true((box.north() - (22.845)).abs() <= 1.0e-10)
  assert_true((box.east() - (-48.1625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:131" {
  let box = @geocodec.pluscode_bounds("78C8H7JW+HCMFV2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("78C8H7JW+HCMFV2"), 14)
  assert_true((box.south() - (18.581464)).abs() <= 1.0e-10)
  assert_true((box.west() - (-53.703958984375)).abs() <= 1.0e-10)
  assert_true((box.north() - (18.5814642)).abs() <= 1.0e-10)
  assert_true((box.east() - (-53.703958496094)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:132" {
  let box = @geocodec.pluscode_bounds("9JJ8VR94+863").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9JJ8VR94+863"), 11)
  assert_true((box.south() - (62.86825)).abs() <= 1.0e-10)
  assert_true((box.west() - (66.80553125)).abs() <= 1.0e-10)
  assert_true((box.north() - (62.868275)).abs() <= 1.0e-10)
  assert_true((box.east() - (66.8055625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:133" {
  let box = @geocodec.pluscode_bounds("5F5MQ98R+2F4VWM").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5F5MQ98R+2F4VWM"), 14)
  assert_true((box.south() - (-26.2349754)).abs() <= 1.0e-10)
  assert_true((box.west() - (13.391199707031)).abs() <= 1.0e-10)
  assert_true((box.north() - (-26.2349752)).abs() <= 1.0e-10)
  assert_true((box.east() - (13.391200195312)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:134" {
  let box = @geocodec.pluscode_bounds("9VH32827+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9VH32827+"), 8)
  assert_true((box.south() - (61)).abs() <= 1.0e-10)
  assert_true((box.west() - (161.3125)).abs() <= 1.0e-10)
  assert_true((box.north() - (61.0025)).abs() <= 1.0e-10)
  assert_true((box.east() - (161.315)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:135" {
  let box = @geocodec.pluscode_bounds("83XRV300+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("83XRV300+"), 6)
  assert_true((box.south() - (49.85)).abs() <= 1.0e-10)
  assert_true((box.west() - (-143.95)).abs() <= 1.0e-10)
  assert_true((box.north() - (49.9)).abs() <= 1.0e-10)
  assert_true((box.east() - (-143.9)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:136" {
  let box = @geocodec.pluscode_bounds("822J0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("822J0000+"), 4)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (-168)).abs() <= 1.0e-10)
  assert_true((box.north() - (31)).abs() <= 1.0e-10)
  assert_true((box.east() - (-167)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:137" {
  let box = @geocodec.pluscode_bounds("67C80000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("67C80000+"), 4)
  assert_true((box.south() - (-2)).abs() <= 1.0e-10)
  assert_true((box.west() - (-74)).abs() <= 1.0e-10)
  assert_true((box.north() - (-1)).abs() <= 1.0e-10)
  assert_true((box.east() - (-73)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:138" {
  let box = @geocodec.pluscode_bounds("8J000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8J000000+"), 2)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (60)).abs() <= 1.0e-10)
  assert_true((box.north() - (50)).abs() <= 1.0e-10)
  assert_true((box.east() - (80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:139" {
  let box = @geocodec.pluscode_bounds("2272GPM3+94").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2272GPM3+94"), 10)
  assert_true((box.south() - (-84.466625)).abs() <= 1.0e-10)
  assert_true((box.west() - (-179.29725)).abs() <= 1.0e-10)
  assert_true((box.north() - (-84.4665)).abs() <= 1.0e-10)
  assert_true((box.east() - (-179.297125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:140" {
  let box = @geocodec.pluscode_bounds("83PP58JX+JFMMQ7H").unwrap()
  assert_eq(@geocodec.pluscode_code_length("83PP58JX+JFMMQ7H"), 15)
  assert_true((box.south() - (44.18159328)).abs() <= 1.0e-10)
  assert_true((box.west() - (-145.651329223633)).abs() <= 1.0e-10)
  assert_true((box.north() - (44.18159332)).abs() <= 1.0e-10)
  assert_true((box.east() - (-145.651329101563)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:141" {
  let box = @geocodec.pluscode_bounds("2Q3P6CPJ+Q3H7HQ7").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2Q3P6CPJ+Q3H7HQ7"), 15)
  assert_true((box.south() - (-88.76306736)).abs() <= 1.0e-10)
  assert_true((box.west() - (134.430234008789)).abs() <= 1.0e-10)
  assert_true((box.north() - (-88.76306732)).abs() <= 1.0e-10)
  assert_true((box.east() - (134.430234130859)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:142" {
  let box = @geocodec.pluscode_bounds("8QHG4MCJ+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8QHG4MCJ+"), 8)
  assert_true((box.south() - (41.12)).abs() <= 1.0e-10)
  assert_true((box.west() - (130.68)).abs() <= 1.0e-10)
  assert_true((box.north() - (41.1225)).abs() <= 1.0e-10)
  assert_true((box.east() - (130.6825)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:143" {
  let box = @geocodec.pluscode_bounds("7Q9C0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7Q9C0000+"), 4)
  assert_true((box.south() - (17)).abs() <= 1.0e-10)
  assert_true((box.west() - (128)).abs() <= 1.0e-10)
  assert_true((box.north() - (18)).abs() <= 1.0e-10)
  assert_true((box.east() - (129)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:144" {
  let box = @geocodec.pluscode_bounds("6CCXQ75V+W6").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6CCXQ75V+W6"), 10)
  assert_true((box.south() - (-1.24025)).abs() <= 1.0e-10)
  assert_true((box.west() - (-0.707)).abs() <= 1.0e-10)
  assert_true((box.north() - (-1.240125)).abs() <= 1.0e-10)
  assert_true((box.east() - (-0.706875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:145" {
  let box = @geocodec.pluscode_bounds("3F8W9CGM+G68Q").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3F8W9CGM+G68Q"), 12)
  assert_true((box.south() - (-63.62371)).abs() <= 1.0e-10)
  assert_true((box.west() - (18.4330859375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-63.623705)).abs() <= 1.0e-10)
  assert_true((box.east() - (18.43309375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:146" {
  let box = @geocodec.pluscode_bounds("6CQ6Q7HG+R2JF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6CQ6Q7HG+R2JF"), 12)
  assert_true((box.south() - (5.779585)).abs() <= 1.0e-10)
  assert_true((box.west() - (-15.7249921875)).abs() <= 1.0e-10)
  assert_true((box.north() - (5.77959)).abs() <= 1.0e-10)
  assert_true((box.east() - (-15.724984375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:147" {
  let box = @geocodec.pluscode_bounds("59000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("59000000+"), 2)
  assert_true((box.south() - (-30)).abs() <= 1.0e-10)
  assert_true((box.west() - (-40)).abs() <= 1.0e-10)
  assert_true((box.north() - (-10)).abs() <= 1.0e-10)
  assert_true((box.east() - (-20)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:148" {
  let box = @geocodec.pluscode_bounds("7C85WMXF+MG2GV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7C85WMXF+MG2GV"), 13)
  assert_true((box.south() - (16.949139)).abs() <= 1.0e-10)
  assert_true((box.west() - (-16.326232421875)).abs() <= 1.0e-10)
  assert_true((box.north() - (16.94914)).abs() <= 1.0e-10)
  assert_true((box.east() - (-16.32623046875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:149" {
  let box = @geocodec.pluscode_bounds("9J000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9J000000+"), 2)
  assert_true((box.south() - (50)).abs() <= 1.0e-10)
  assert_true((box.west() - (60)).abs() <= 1.0e-10)
  assert_true((box.north() - (70)).abs() <= 1.0e-10)
  assert_true((box.east() - (80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:150" {
  let box = @geocodec.pluscode_bounds("86QMC32M+HRFRX").unwrap()
  assert_eq(@geocodec.pluscode_code_length("86QMC32M+HRFRX"), 13)
  assert_true((box.south() - (45.401449)).abs() <= 1.0e-10)
  assert_true((box.west() - (-86.915462890625)).abs() <= 1.0e-10)
  assert_true((box.north() - (45.40145)).abs() <= 1.0e-10)
  assert_true((box.east() - (-86.9154609375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:151" {
  let box = @geocodec.pluscode_bounds("8VP9QGFR+WQ7P").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8VP9QGFR+WQ7P"), 12)
  assert_true((box.south() - (44.77479)).abs() <= 1.0e-10)
  assert_true((box.west() - (167.541921875)).abs() <= 1.0e-10)
  assert_true((box.north() - (44.774795)).abs() <= 1.0e-10)
  assert_true((box.east() - (167.5419296875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:152" {
  let box = @geocodec.pluscode_bounds("CFW20000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CFW20000+"), 4)
  assert_true((box.south() - (88)).abs() <= 1.0e-10)
  assert_true((box.west() - (0)).abs() <= 1.0e-10)
  assert_true((box.north() - (89)).abs() <= 1.0e-10)
  assert_true((box.east() - (1)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:153" {
  let box = @geocodec.pluscode_bounds("8G000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8G000000+"), 2)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (20)).abs() <= 1.0e-10)
  assert_true((box.north() - (50)).abs() <= 1.0e-10)
  assert_true((box.east() - (40)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:154" {
  let box = @geocodec.pluscode_bounds("C87975X7+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C87975X7+"), 8)
  assert_true((box.south() - (75.2975)).abs() <= 1.0e-10)
  assert_true((box.west() - (-52.8375)).abs() <= 1.0e-10)
  assert_true((box.north() - (75.3)).abs() <= 1.0e-10)
  assert_true((box.east() - (-52.835)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:155" {
  let box = @geocodec.pluscode_bounds("8V2H837Q+44").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8V2H837Q+44"), 10)
  assert_true((box.south() - (30.31275)).abs() <= 1.0e-10)
  assert_true((box.west() - (171.08775)).abs() <= 1.0e-10)
  assert_true((box.north() - (30.312875)).abs() <= 1.0e-10)
  assert_true((box.east() - (171.087875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:156" {
  let box = @geocodec.pluscode_bounds("846P6G27+H2F948").unwrap()
  assert_eq(@geocodec.pluscode_code_length("846P6G27+H2F948"), 14)
  assert_true((box.south() - (34.2014302)).abs() <= 1.0e-10)
  assert_true((box.west() - (-125.487440429687)).abs() <= 1.0e-10)
  assert_true((box.north() - (34.2014304)).abs() <= 1.0e-10)
  assert_true((box.east() - (-125.487439941406)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:157" {
  let box = @geocodec.pluscode_bounds("62FP6HV7+533Q").unwrap()
  assert_eq(@geocodec.pluscode_code_length("62FP6HV7+533Q"), 12)
  assert_true((box.south() - (-0.75711)).abs() <= 1.0e-10)
  assert_true((box.west() - (-165.4373203125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-0.757105)).abs() <= 1.0e-10)
  assert_true((box.east() - (-165.4373125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:158" {
  let box = @geocodec.pluscode_bounds("9HJGV979+J6JH3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9HJGV979+J6JH3"), 13)
  assert_true((box.south() - (62.864085)).abs() <= 1.0e-10)
  assert_true((box.west() - (50.368025390625)).abs() <= 1.0e-10)
  assert_true((box.north() - (62.864086)).abs() <= 1.0e-10)
  assert_true((box.east() - (50.36802734375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:159" {
  let box = @geocodec.pluscode_bounds("36VXF6J5+5MM").unwrap()
  assert_eq(@geocodec.pluscode_code_length("36VXF6J5+5MM"), 11)
  assert_true((box.south() - (-52.51955)).abs() <= 1.0e-10)
  assert_true((box.west() - (-80.79084375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-52.519525)).abs() <= 1.0e-10)
  assert_true((box.east() - (-80.7908125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:160" {
  let box = @geocodec.pluscode_bounds("C5C9VXM2+34HGJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C5C9VXM2+34HGJ"), 13)
  assert_true((box.south() - (78.882688)).abs() <= 1.0e-10)
  assert_true((box.west() - (-112.049640625)).abs() <= 1.0e-10)
  assert_true((box.north() - (78.882689)).abs() <= 1.0e-10)
  assert_true((box.east() - (-112.049638671875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:161" {
  let box = @geocodec.pluscode_bounds("779F6J3J+X2G2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("779F6J3J+X2G2"), 12)
  assert_true((box.south() - (17.204925)).abs() <= 1.0e-10)
  assert_true((box.west() - (-70.3699375)).abs() <= 1.0e-10)
  assert_true((box.north() - (17.20493)).abs() <= 1.0e-10)
  assert_true((box.east() - (-70.3699296875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:162" {
  let box = @geocodec.pluscode_bounds("85QPW6M7+5Q3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("85QPW6M7+5Q3"), 11)
  assert_true((box.south() - (45.932875)).abs() <= 1.0e-10)
  assert_true((box.west() - (-105.78559375)).abs() <= 1.0e-10)
  assert_true((box.north() - (45.9329)).abs() <= 1.0e-10)
  assert_true((box.east() - (-105.7855625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:163" {
  let box = @geocodec.pluscode_bounds("CG8X3JMW+HCMJX").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CG8X3JMW+HCMJX"), 13)
  assert_true((box.south() - (76.083969)).abs() <= 1.0e-10)
  assert_true((box.west() - (39.646037109375)).abs() <= 1.0e-10)
  assert_true((box.north() - (76.08397)).abs() <= 1.0e-10)
  assert_true((box.east() - (39.6460390625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:164" {
  let box = @geocodec.pluscode_bounds("85PJM263+QR25PQ9").unwrap()
  assert_eq(@geocodec.pluscode_code_length("85PJM263+QR25PQ9"), 15)
  assert_true((box.south() - (44.66187864)).abs() <= 1.0e-10)
  assert_true((box.west() - (-107.995470825195)).abs() <= 1.0e-10)
  assert_true((box.north() - (44.66187868)).abs() <= 1.0e-10)
  assert_true((box.east() - (-107.995470703125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:165" {
  let box = @geocodec.pluscode_bounds("54PH0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("54PH0000+"), 4)
  assert_true((box.south() - (-16)).abs() <= 1.0e-10)
  assert_true((box.west() - (-129)).abs() <= 1.0e-10)
  assert_true((box.north() - (-15)).abs() <= 1.0e-10)
  assert_true((box.east() - (-128)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:166" {
  let box = @geocodec.pluscode_bounds("23VX668F+RF2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("23VX668F+RF2"), 11)
  assert_true((box.south() - (-72.783)).abs() <= 1.0e-10)
  assert_true((box.west() - (-140.776375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-72.782975)).abs() <= 1.0e-10)
  assert_true((box.east() - (-140.77634375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:167" {
  let box = @geocodec.pluscode_bounds("74563Q8Q+FV8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("74563Q8Q+FV8"), 11)
  assert_true((box.south() - (13.06615)).abs() <= 1.0e-10)
  assert_true((box.west() - (-135.2103125)).abs() <= 1.0e-10)
  assert_true((box.north() - (13.066175)).abs() <= 1.0e-10)
  assert_true((box.east() - (-135.21028125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:168" {
  let box = @geocodec.pluscode_bounds("267CM5WM+WW").unwrap()
  assert_eq(@geocodec.pluscode_code_length("267CM5WM+WW"), 10)
  assert_true((box.south() - (-84.30275)).abs() <= 1.0e-10)
  assert_true((box.west() - (-91.81525)).abs() <= 1.0e-10)
  assert_true((box.north() - (-84.302625)).abs() <= 1.0e-10)
  assert_true((box.east() - (-91.815125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:169" {
  let box = @geocodec.pluscode_bounds("96000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("96000000+"), 2)
  assert_true((box.south() - (50)).abs() <= 1.0e-10)
  assert_true((box.west() - (-100)).abs() <= 1.0e-10)
  assert_true((box.north() - (70)).abs() <= 1.0e-10)
  assert_true((box.east() - (-80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:170" {
  let box = @geocodec.pluscode_bounds("C2MP5JF8+8C798VJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C2MP5JF8+8C798VJ"), 15)
  assert_true((box.south() - (83.17328192)).abs() <= 1.0e-10)
  assert_true((box.west() - (-165.383940917969)).abs() <= 1.0e-10)
  assert_true((box.north() - (83.17328196)).abs() <= 1.0e-10)
  assert_true((box.east() - (-165.383940795898)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:171" {
  let box = @geocodec.pluscode_bounds("8C8R6VHV+P5").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8C8R6VHV+P5"), 10)
  assert_true((box.south() - (36.22925)).abs() <= 1.0e-10)
  assert_true((box.west() - (-3.107125)).abs() <= 1.0e-10)
  assert_true((box.north() - (36.229375)).abs() <= 1.0e-10)
  assert_true((box.east() - (-3.107)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:172" {
  let box = @geocodec.pluscode_bounds("3Q6XJ852+2R5RF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3Q6XJ852+2R5RF"), 13)
  assert_true((box.south() - (-65.392478)).abs() <= 1.0e-10)
  assert_true((box.west() - (139.302095703125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-65.392477)).abs() <= 1.0e-10)
  assert_true((box.east() - (139.30209765625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:173" {
  let box = @geocodec.pluscode_bounds("C6Q4V2C5+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C6Q4V2C5+"), 8)
  assert_true((box.south() - (85.87)).abs() <= 1.0e-10)
  assert_true((box.west() - (-97.9925)).abs() <= 1.0e-10)
  assert_true((box.north() - (85.8725)).abs() <= 1.0e-10)
  assert_true((box.east() - (-97.99)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:174" {
  let box = @geocodec.pluscode_bounds("5FCP8QGW+FVFWWC").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5FCP8QGW+FVFWWC"), 14)
  assert_true((box.south() - (-21.6738006)).abs() <= 1.0e-10)
  assert_true((box.west() - (14.79717578125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-21.6738004)).abs() <= 1.0e-10)
  assert_true((box.east() - (14.797176269531)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:175" {
  let box = @geocodec.pluscode_bounds("759X8X98+VPPX84").unwrap()
  assert_eq(@geocodec.pluscode_code_length("759X8X98+VPPX84"), 14)
  assert_true((box.south() - (17.319721)).abs() <= 1.0e-10)
  assert_true((box.west() - (-100.033159179688)).abs() <= 1.0e-10)
  assert_true((box.north() - (17.3197212)).abs() <= 1.0e-10)
  assert_true((box.east() - (-100.033158691406)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:176" {
  let box = @geocodec.pluscode_bounds("9VCF6R28+MHPF3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9VCF6R28+MHPF3"), 13)
  assert_true((box.south() - (58.20171)).abs() <= 1.0e-10)
  assert_true((box.west() - (169.816447265625)).abs() <= 1.0e-10)
  assert_true((box.north() - (58.201711)).abs() <= 1.0e-10)
  assert_true((box.east() - (169.81644921875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:177" {
  let box = @geocodec.pluscode_bounds("6HWGMPPP+GWCM3F5").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6HWGMPPP+GWCM3F5"), 15)
  assert_true((box.south() - (8.6863154)).abs() <= 1.0e-10)
  assert_true((box.west() - (50.737260620117)).abs() <= 1.0e-10)
  assert_true((box.north() - (8.68631544)).abs() <= 1.0e-10)
  assert_true((box.east() - (50.737260742188)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:178" {
  let box = @geocodec.pluscode_bounds("2CGPJH9J+X9J6GM8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2CGPJH9J+X9J6GM8"), 15)
  assert_true((box.south() - (-79.38004236)).abs() <= 1.0e-10)
  assert_true((box.west() - (-5.419120361328)).abs() <= 1.0e-10)
  assert_true((box.north() - (-79.38004232)).abs() <= 1.0e-10)
  assert_true((box.east() - (-5.419120239258)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:179" {
  let box = @geocodec.pluscode_bounds("653C7RC3+8R66").unwrap()
  assert_eq(@geocodec.pluscode_code_length("653C7RC3+8R66"), 12)
  assert_true((box.south() - (-8.72922)).abs() <= 1.0e-10)
  assert_true((box.west() - (-111.1955)).abs() <= 1.0e-10)
  assert_true((box.north() - (-8.729215)).abs() <= 1.0e-10)
  assert_true((box.east() - (-111.1954921875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:180" {
  let box = @geocodec.pluscode_bounds("6VV4W5VG+9V55").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6VV4W5VG+9V55"), 12)
  assert_true((box.south() - (7.943375)).abs() <= 1.0e-10)
  assert_true((box.west() - (162.1772421875)).abs() <= 1.0e-10)
  assert_true((box.north() - (7.94338)).abs() <= 1.0e-10)
  assert_true((box.east() - (162.17725)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:181" {
  let box = @geocodec.pluscode_bounds("9VF74R00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9VF74R00+"), 6)
  assert_true((box.south() - (59.1)).abs() <= 1.0e-10)
  assert_true((box.west() - (165.8)).abs() <= 1.0e-10)
  assert_true((box.north() - (59.15)).abs() <= 1.0e-10)
  assert_true((box.east() - (165.85)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:182" {
  let box = @geocodec.pluscode_bounds("4JWH0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4JWH0000+"), 4)
  assert_true((box.south() - (-32)).abs() <= 1.0e-10)
  assert_true((box.west() - (71)).abs() <= 1.0e-10)
  assert_true((box.north() - (-31)).abs() <= 1.0e-10)
  assert_true((box.east() - (72)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:183" {
  let box = @geocodec.pluscode_bounds("84000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("84000000+"), 2)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (-140)).abs() <= 1.0e-10)
  assert_true((box.north() - (50)).abs() <= 1.0e-10)
  assert_true((box.east() - (-120)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:184" {
  let box = @geocodec.pluscode_bounds("3CX5PQ26+QW9GP").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3CX5PQ26+QW9GP"), 13)
  assert_true((box.south() - (-50.298087)).abs() <= 1.0e-10)
  assert_true((box.west() - (-16.23763671875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-50.298086)).abs() <= 1.0e-10)
  assert_true((box.east() - (-16.237634765625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:185" {
  let box = @geocodec.pluscode_bounds("7G3WRP2F+Q646FVG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7G3WRP2F+Q646FVG"), 15)
  assert_true((box.south() - (11.80188288)).abs() <= 1.0e-10)
  assert_true((box.west() - (38.723065185547)).abs() <= 1.0e-10)
  assert_true((box.north() - (11.80188292)).abs() <= 1.0e-10)
  assert_true((box.east() - (38.723065307617)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:186" {
  let box = @geocodec.pluscode_bounds("5GMW32J5+JVC7").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5GMW32J5+JVC7"), 12)
  assert_true((box.south() - (-16.918445)).abs() <= 1.0e-10)
  assert_true((box.west() - (38.0096328125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-16.91844)).abs() <= 1.0e-10)
  assert_true((box.east() - (38.009640625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:187" {
  let box = @geocodec.pluscode_bounds("9CG4MR4X+QJR7VM").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9CG4MR4X+QJR7VM"), 14)
  assert_true((box.south() - (60.6569846)).abs() <= 1.0e-10)
  assert_true((box.west() - (-17.150989746094)).abs() <= 1.0e-10)
  assert_true((box.north() - (60.6569848)).abs() <= 1.0e-10)
  assert_true((box.east() - (-17.150989257813)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:188" {
  let box = @geocodec.pluscode_bounds("5FW77JWC+PPM3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5FW77JWC+PPM3"), 12)
  assert_true((box.south() - (-11.703175)).abs() <= 1.0e-10)
  assert_true((box.west() - (5.6217890625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-11.70317)).abs() <= 1.0e-10)
  assert_true((box.east() - (5.621796875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:189" {
  let box = @geocodec.pluscode_bounds("724R5RRG+X59H9Q").unwrap()
  assert_eq(@geocodec.pluscode_code_length("724R5RRG+X59H9Q"), 14)
  assert_true((box.south() - (12.1924116)).abs() <= 1.0e-10)
  assert_true((box.west() - (-163.174500488281)).abs() <= 1.0e-10)
  assert_true((box.north() - (12.1924118)).abs() <= 1.0e-10)
  assert_true((box.east() - (-163.1745)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:190" {
  let box = @geocodec.pluscode_bounds("7MR7RHQ7+F3583Q3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7MR7RHQ7+F3583Q3"), 15)
  assert_true((box.south() - (26.8386306)).abs() <= 1.0e-10)
  assert_true((box.west() - (85.562737915039)).abs() <= 1.0e-10)
  assert_true((box.north() - (26.83863064)).abs() <= 1.0e-10)
  assert_true((box.east() - (85.562738037109)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:191" {
  let box = @geocodec.pluscode_bounds("9939GW48+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9939GW48+"), 8)
  assert_true((box.south() - (51.505)).abs() <= 1.0e-10)
  assert_true((box.west() - (-32.085)).abs() <= 1.0e-10)
  assert_true((box.north() - (51.5075)).abs() <= 1.0e-10)
  assert_true((box.east() - (-32.0825)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:192" {
  let box = @geocodec.pluscode_bounds("5547R8C9+R8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5547R8C9+R8"), 10)
  assert_true((box.south() - (-27.178)).abs() <= 1.0e-10)
  assert_true((box.west() - (-114.68175)).abs() <= 1.0e-10)
  assert_true((box.north() - (-27.177875)).abs() <= 1.0e-10)
  assert_true((box.east() - (-114.681625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:193" {
  let box = @geocodec.pluscode_bounds("6Q573H00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6Q573H00+"), 6)
  assert_true((box.south() - (-6.95)).abs() <= 1.0e-10)
  assert_true((box.west() - (125.55)).abs() <= 1.0e-10)
  assert_true((box.north() - (-6.9)).abs() <= 1.0e-10)
  assert_true((box.east() - (125.6)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:194" {
  let box = @geocodec.pluscode_bounds("9Q9V3PHG+XW").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9Q9V3PHG+XW"), 10)
  assert_true((box.south() - (57.079875)).abs() <= 1.0e-10)
  assert_true((box.west() - (137.72725)).abs() <= 1.0e-10)
  assert_true((box.north() - (57.08)).abs() <= 1.0e-10)
  assert_true((box.east() - (137.727375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:195" {
  let box = @geocodec.pluscode_bounds("4CQQ88PP+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4CQQ88PP+"), 8)
  assert_true((box.south() - (-34.665)).abs() <= 1.0e-10)
  assert_true((box.west() - (-4.665)).abs() <= 1.0e-10)
  assert_true((box.north() - (-34.6625)).abs() <= 1.0e-10)
  assert_true((box.east() - (-4.6625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:196" {
  let box = @geocodec.pluscode_bounds("2VQ2PGCH+38").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2VQ2PGCH+38"), 10)
  assert_true((box.south() - (-74.279875)).abs() <= 1.0e-10)
  assert_true((box.west() - (160.52825)).abs() <= 1.0e-10)
  assert_true((box.north() - (-74.27975)).abs() <= 1.0e-10)
  assert_true((box.east() - (160.528375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:197" {
  let box = @geocodec.pluscode_bounds("CR4389W6+MV36X2V").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CR4389W6+MV36X2V"), 15)
  assert_true((box.south() - (72.34663416)).abs() <= 1.0e-10)
  assert_true((box.west() - (141.362162231445)).abs() <= 1.0e-10)
  assert_true((box.north() - (72.3466342)).abs() <= 1.0e-10)
  assert_true((box.east() - (141.362162353516)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:198" {
  let box = @geocodec.pluscode_bounds("474WR437+WX").unwrap()
  assert_eq(@geocodec.pluscode_code_length("474WR437+WX"), 10)
  assert_true((box.south() - (-47.19525)).abs() <= 1.0e-10)
  assert_true((box.west() - (-61.885125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-47.195125)).abs() <= 1.0e-10)
  assert_true((box.east() - (-61.885)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:199" {
  let box = @geocodec.pluscode_bounds("6GP99X3G+RHJX").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6GP99X3G+RHJX"), 12)
  assert_true((box.south() - (4.354595)).abs() <= 1.0e-10)
  assert_true((box.west() - (27.9763984375)).abs() <= 1.0e-10)
  assert_true((box.north() - (4.3546)).abs() <= 1.0e-10)
  assert_true((box.east() - (27.97640625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:200" {
  let box = @geocodec.pluscode_bounds("9V3JRCRX+P77F").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9V3JRCRX+P77F"), 12)
  assert_true((box.south() - (51.841785)).abs() <= 1.0e-10)
  assert_true((box.west() - (172.4481640625)).abs() <= 1.0e-10)
  assert_true((box.north() - (51.84179)).abs() <= 1.0e-10)
  assert_true((box.east() - (172.448171875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:201" {
  let box = @geocodec.pluscode_bounds("44659G00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("44659G00+"), 6)
  assert_true((box.south() - (-45.65)).abs() <= 1.0e-10)
  assert_true((box.west() - (-136.5)).abs() <= 1.0e-10)
  assert_true((box.north() - (-45.6)).abs() <= 1.0e-10)
  assert_true((box.east() - (-136.45)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:202" {
  let box = @geocodec.pluscode_bounds("5VH8JV9G+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5VH8JV9G+"), 8)
  assert_true((box.south() - (-18.3825)).abs() <= 1.0e-10)
  assert_true((box.west() - (166.875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-18.38)).abs() <= 1.0e-10)
  assert_true((box.east() - (166.8775)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:203" {
  let box = @geocodec.pluscode_bounds("33RRRW2R+MW7J3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("33RRRW2R+MW7J3"), 13)
  assert_true((box.south() - (-53.198335)).abs() <= 1.0e-10)
  assert_true((box.west() - (-143.057716796875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-53.198334)).abs() <= 1.0e-10)
  assert_true((box.east() - (-143.05771484375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:204" {
  let box = @geocodec.pluscode_bounds("C22PGFQ5+XC2G5V").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C22PGFQ5+XC2G5V"), 14)
  assert_true((box.south() - (70.5398858)).abs() <= 1.0e-10)
  assert_true((box.west() - (-165.541478027344)).abs() <= 1.0e-10)
  assert_true((box.north() - (70.539886)).abs() <= 1.0e-10)
  assert_true((box.east() - (-165.541477539062)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:205" {
  let box = @geocodec.pluscode_bounds("5PP8JV57+8G").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5PP8JV57+8G"), 10)
  assert_true((box.south() - (-15.39175)).abs() <= 1.0e-10)
  assert_true((box.west() - (106.86375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-15.391625)).abs() <= 1.0e-10)
  assert_true((box.east() - (106.863875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:206" {
  let box = @geocodec.pluscode_bounds("CJ000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CJ000000+"), 2)
  assert_true((box.south() - (70)).abs() <= 1.0e-10)
  assert_true((box.west() - (60)).abs() <= 1.0e-10)
  assert_true((box.north() - (90)).abs() <= 1.0e-10)
  assert_true((box.east() - (80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:207" {
  let box = @geocodec.pluscode_bounds("638X54FH+2HQXR44").unwrap()
  assert_eq(@geocodec.pluscode_code_length("638X54FH+2HQXR44"), 15)
  assert_true((box.south() - (-3.827401)).abs() <= 1.0e-10)
  assert_true((box.west() - (-140.871006591797)).abs() <= 1.0e-10)
  assert_true((box.north() - (-3.82740096)).abs() <= 1.0e-10)
  assert_true((box.east() - (-140.871006469727)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:208" {
  let box = @geocodec.pluscode_bounds("8PC52FHJ+2R5VH4").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8PC52FHJ+2R5VH4"), 14)
  assert_true((box.south() - (38.027522)).abs() <= 1.0e-10)
  assert_true((box.west() - (103.482108398438)).abs() <= 1.0e-10)
  assert_true((box.north() - (38.0275222)).abs() <= 1.0e-10)
  assert_true((box.east() - (103.482108886719)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:209" {
  let box = @geocodec.pluscode_bounds("2VP58W84+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2VP58W84+"), 8)
  assert_true((box.south() - (-75.685)).abs() <= 1.0e-10)
  assert_true((box.west() - (163.905)).abs() <= 1.0e-10)
  assert_true((box.north() - (-75.6825)).abs() <= 1.0e-10)
  assert_true((box.east() - (163.9075)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:210" {
  let box = @geocodec.pluscode_bounds("45G99FJ2+6FWG836").unwrap()
  assert_eq(@geocodec.pluscode_code_length("45G99FJ2+6FWG836"), 15)
  assert_true((box.south() - (-39.61938896)).abs() <= 1.0e-10)
  assert_true((box.west() - (-112.548792480469)).abs() <= 1.0e-10)
  assert_true((box.north() - (-39.61938892)).abs() <= 1.0e-10)
  assert_true((box.east() - (-112.548792358398)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:211" {
  let box = @geocodec.pluscode_bounds("9C3W72G4+36FV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9C3W72G4+36FV"), 12)
  assert_true((box.south() - (51.275195)).abs() <= 1.0e-10)
  assert_true((box.west() - (-1.9944609375)).abs() <= 1.0e-10)
  assert_true((box.north() - (51.2752)).abs() <= 1.0e-10)
  assert_true((box.east() - (-1.994453125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:212" {
  let box = @geocodec.pluscode_bounds("9G98FJW9+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9G98FJW9+"), 8)
  assert_true((box.south() - (57.495)).abs() <= 1.0e-10)
  assert_true((box.west() - (26.6175)).abs() <= 1.0e-10)
  assert_true((box.north() - (57.4975)).abs() <= 1.0e-10)
  assert_true((box.east() - (26.62)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:213" {
  let box = @geocodec.pluscode_bounds("574X42F7+CH5FX8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("574X42F7+CH5FX8"), 14)
  assert_true((box.south() - (-27.8764858)).abs() <= 1.0e-10)
  assert_true((box.west() - (-60.986016601562)).abs() <= 1.0e-10)
  assert_true((box.north() - (-27.8764856)).abs() <= 1.0e-10)
  assert_true((box.east() - (-60.986016113281)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:214" {
  let box = @geocodec.pluscode_bounds("984HJGQJ+332WCFQ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("984HJGQJ+332WCFQ"), 15)
  assert_true((box.south() - (52.63764752)).abs() <= 1.0e-10)
  assert_true((box.west() - (-48.469858520508)).abs() <= 1.0e-10)
  assert_true((box.north() - (52.63764756)).abs() <= 1.0e-10)
  assert_true((box.east() - (-48.469858398438)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:215" {
  let box = @geocodec.pluscode_bounds("4H7VCWCR+W5").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4H7VCWCR+W5"), 10)
  assert_true((box.south() - (-44.57775)).abs() <= 1.0e-10)
  assert_true((box.west() - (57.940375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-44.577625)).abs() <= 1.0e-10)
  assert_true((box.east() - (57.9405)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:216" {
  let box = @geocodec.pluscode_bounds("C48GRM00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C48GRM00+"), 6)
  assert_true((box.south() - (76.8)).abs() <= 1.0e-10)
  assert_true((box.west() - (-129.35)).abs() <= 1.0e-10)
  assert_true((box.north() - (76.85)).abs() <= 1.0e-10)
  assert_true((box.east() - (-129.3)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:217" {
  let box = @geocodec.pluscode_bounds("52000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("52000000+"), 2)
  assert_true((box.south() - (-30)).abs() <= 1.0e-10)
  assert_true((box.west() - (-180)).abs() <= 1.0e-10)
  assert_true((box.north() - (-10)).abs() <= 1.0e-10)
  assert_true((box.east() - (-160)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:218" {
  let box = @geocodec.pluscode_bounds("323G65FJ+5FG2VQ8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("323G65FJ+5FG2VQ8"), 15)
  assert_true((box.south() - (-68.77707036)).abs() <= 1.0e-10)
  assert_true((box.west() - (-169.818808837891)).abs() <= 1.0e-10)
  assert_true((box.north() - (-68.77707032)).abs() <= 1.0e-10)
  assert_true((box.east() - (-169.81880871582)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:219" {
  let box = @geocodec.pluscode_bounds("7VHJGH8G+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7VHJGH8G+"), 8)
  assert_true((box.south() - (21.515)).abs() <= 1.0e-10)
  assert_true((box.west() - (172.575)).abs() <= 1.0e-10)
  assert_true((box.north() - (21.5175)).abs() <= 1.0e-10)
  assert_true((box.east() - (172.5775)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:220" {
  let box = @geocodec.pluscode_bounds("7J000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7J000000+"), 2)
  assert_true((box.south() - (10)).abs() <= 1.0e-10)
  assert_true((box.west() - (60)).abs() <= 1.0e-10)
  assert_true((box.north() - (30)).abs() <= 1.0e-10)
  assert_true((box.east() - (80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:221" {
  let box = @geocodec.pluscode_bounds("9826WQCC+9WF745M").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9826WQCC+9WF745M"), 15)
  assert_true((box.south() - (50.92093012)).abs() <= 1.0e-10)
  assert_true((box.west() - (-55.227705444336)).abs() <= 1.0e-10)
  assert_true((box.north() - (50.92093016)).abs() <= 1.0e-10)
  assert_true((box.east() - (-55.227705322266)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:222" {
  let box = @geocodec.pluscode_bounds("8RM82CVQ+G9").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8RM82CVQ+G9"), 10)
  assert_true((box.south() - (43.04375)).abs() <= 1.0e-10)
  assert_true((box.west() - (146.438375)).abs() <= 1.0e-10)
  assert_true((box.north() - (43.043875)).abs() <= 1.0e-10)
  assert_true((box.east() - (146.4385)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:223" {
  let box = @geocodec.pluscode_bounds("24000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("24000000+"), 2)
  assert_true((box.south() - (-90)).abs() <= 1.0e-10)
  assert_true((box.west() - (-140)).abs() <= 1.0e-10)
  assert_true((box.north() - (-70)).abs() <= 1.0e-10)
  assert_true((box.east() - (-120)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:224" {
  let box = @geocodec.pluscode_bounds("9PGWMCGF+RHJ9").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9PGWMCGF+RHJ9"), 12)
  assert_true((box.south() - (60.67708)).abs() <= 1.0e-10)
  assert_true((box.west() - (118.4238984375)).abs() <= 1.0e-10)
  assert_true((box.north() - (60.677085)).abs() <= 1.0e-10)
  assert_true((box.east() - (118.42390625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:225" {
  let box = @geocodec.pluscode_bounds("9F3QWHRG+WPMV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9F3QWHRG+WPMV"), 12)
  assert_true((box.south() - (51.942345)).abs() <= 1.0e-10)
  assert_true((box.west() - (15.5767890625)).abs() <= 1.0e-10)
  assert_true((box.north() - (51.94235)).abs() <= 1.0e-10)
  assert_true((box.east() - (15.576796875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:226" {
  let box = @geocodec.pluscode_bounds("257V87F5+689").unwrap()
  assert_eq(@geocodec.pluscode_code_length("257V87F5+689"), 11)
  assert_true((box.south() - (-84.676975)).abs() <= 1.0e-10)
  assert_true((box.west() - (-102.74165625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-84.67695)).abs() <= 1.0e-10)
  assert_true((box.east() - (-102.741625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:227" {
  let box = @geocodec.pluscode_bounds("6M9QQV9V+RFF74").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6M9QQV9V+RFF74"), 13)
  assert_true((box.south() - (-2.230445)).abs() <= 1.0e-10)
  assert_true((box.west() - (95.89366796875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-2.230444)).abs() <= 1.0e-10)
  assert_true((box.east() - (95.893669921875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:228" {
  let box = @geocodec.pluscode_bounds("7F380000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7F380000+"), 4)
  assert_true((box.south() - (11)).abs() <= 1.0e-10)
  assert_true((box.west() - (6)).abs() <= 1.0e-10)
  assert_true((box.north() - (12)).abs() <= 1.0e-10)
  assert_true((box.east() - (7)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:229" {
  let box = @geocodec.pluscode_bounds("9R6R9F4C+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9R6R9F4C+"), 8)
  assert_true((box.south() - (54.355)).abs() <= 1.0e-10)
  assert_true((box.west() - (156.47)).abs() <= 1.0e-10)
  assert_true((box.north() - (54.3575)).abs() <= 1.0e-10)
  assert_true((box.east() - (156.4725)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:230" {
  let box = @geocodec.pluscode_bounds("43000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("43000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (-160)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (-140)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:231" {
  let box = @geocodec.pluscode_bounds("8FHCG4QG+495FMQG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8FHCG4QG+495FMQG"), 15)
  assert_true((box.south() - (41.53776368)).abs() <= 1.0e-10)
  assert_true((box.west() - (8.125980224609)).abs() <= 1.0e-10)
  assert_true((box.north() - (41.53776372)).abs() <= 1.0e-10)
  assert_true((box.east() - (8.12598034668)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:232" {
  let box = @geocodec.pluscode_bounds("4J000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4J000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (60)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:233" {
  let box = @geocodec.pluscode_bounds("2J6VJ54Q+WVV9").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2J6VJ54Q+WVV9"), 12)
  assert_true((box.south() - (-85.392645)).abs() <= 1.0e-10)
  assert_true((box.west() - (77.1896796875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-85.39264)).abs() <= 1.0e-10)
  assert_true((box.east() - (77.1896875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:234" {
  let box = @geocodec.pluscode_bounds("7G2394VR+3RXCXV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7G2394VR+3RXCXV"), 14)
  assert_true((box.south() - (10.3927398)).abs() <= 1.0e-10)
  assert_true((box.west() - (21.142100097656)).abs() <= 1.0e-10)
  assert_true((box.north() - (10.39274)).abs() <= 1.0e-10)
  assert_true((box.east() - (21.142100585937)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:235" {
  let box = @geocodec.pluscode_bounds("628Q94R9+VJMF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("628Q94R9+VJMF"), 12)
  assert_true((box.south() - (-3.60779)).abs() <= 1.0e-10)
  assert_true((box.west() - (-164.8809609375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-3.607785)).abs() <= 1.0e-10)
  assert_true((box.east() - (-164.880953125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:236" {
  let box = @geocodec.pluscode_bounds("64RG0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("64RG0000+"), 4)
  assert_true((box.south() - (6)).abs() <= 1.0e-10)
  assert_true((box.west() - (-130)).abs() <= 1.0e-10)
  assert_true((box.north() - (7)).abs() <= 1.0e-10)
  assert_true((box.east() - (-129)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:237" {
  let box = @geocodec.pluscode_bounds("665GQ8QH+6G283RG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("665GQ8QH+6G283RG"), 15)
  assert_true((box.south() - (-6.21199412)).abs() <= 1.0e-10)
  assert_true((box.west() - (-89.671232177734)).abs() <= 1.0e-10)
  assert_true((box.north() - (-6.21199408)).abs() <= 1.0e-10)
  assert_true((box.east() - (-89.671232055664)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:238" {
  let box = @geocodec.pluscode_bounds("23RC2G49+66GR5").unwrap()
  assert_eq(@geocodec.pluscode_code_length("23RC2G49+66GR5"), 13)
  assert_true((box.south() - (-73.99443)).abs() <= 1.0e-10)
  assert_true((box.west() - (-151.481931640625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-73.994429)).abs() <= 1.0e-10)
  assert_true((box.east() - (-151.4819296875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:239" {
  let box = @geocodec.pluscode_bounds("686V86JM+WC3RV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("686V86JM+WC3RV"), 13)
  assert_true((box.south() - (-5.667726)).abs() <= 1.0e-10)
  assert_true((box.west() - (-42.766466796875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-5.667725)).abs() <= 1.0e-10)
  assert_true((box.east() - (-42.76646484375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:240" {
  let box = @geocodec.pluscode_bounds("78PHHG00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("78PHHG00+"), 6)
  assert_true((box.south() - (24.55)).abs() <= 1.0e-10)
  assert_true((box.west() - (-48.5)).abs() <= 1.0e-10)
  assert_true((box.north() - (24.6)).abs() <= 1.0e-10)
  assert_true((box.east() - (-48.45)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:241" {
  let box = @geocodec.pluscode_bounds("2CJJG3P9+GHJ9").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2CJJG3P9+GHJ9"), 12)
  assert_true((box.south() - (-77.46367)).abs() <= 1.0e-10)
  assert_true((box.west() - (-7.9311015625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-77.463665)).abs() <= 1.0e-10)
  assert_true((box.east() - (-7.93109375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:242" {
  let box = @geocodec.pluscode_bounds("4H000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4H000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (40)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (60)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:243" {
  let box = @geocodec.pluscode_bounds("8GG3CHX6+PQG2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8GG3CHX6+PQG2"), 12)
  assert_true((box.south() - (40.4493)).abs() <= 1.0e-10)
  assert_true((box.west() - (21.5619375)).abs() <= 1.0e-10)
  assert_true((box.north() - (40.449305)).abs() <= 1.0e-10)
  assert_true((box.east() - (21.5619453125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:244" {
  let box = @geocodec.pluscode_bounds("5GCQ8HVG+77C3744").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5GCQ8HVG+77C3744"), 15)
  assert_true((box.south() - (-21.656824)).abs() <= 1.0e-10)
  assert_true((box.west() - (35.575635986328)).abs() <= 1.0e-10)
  assert_true((box.north() - (-21.65682396)).abs() <= 1.0e-10)
  assert_true((box.east() - (35.575636108398)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:245" {
  let box = @geocodec.pluscode_bounds("4R3R9MG5+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4R3R9MG5+"), 8)
  assert_true((box.south() - (-48.625)).abs() <= 1.0e-10)
  assert_true((box.west() - (156.6575)).abs() <= 1.0e-10)
  assert_true((box.north() - (-48.6225)).abs() <= 1.0e-10)
  assert_true((box.east() - (156.66)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:246" {
  let box = @geocodec.pluscode_bounds("CV25MQ00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CV25MQ00+"), 6)
  assert_true((box.south() - (70.65)).abs() <= 1.0e-10)
  assert_true((box.west() - (163.75)).abs() <= 1.0e-10)
  assert_true((box.north() - (70.7)).abs() <= 1.0e-10)
  assert_true((box.east() - (163.8)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:247" {
  let box = @geocodec.pluscode_bounds("735W9G00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("735W9G00+"), 6)
  assert_true((box.south() - (13.35)).abs() <= 1.0e-10)
  assert_true((box.west() - (-141.5)).abs() <= 1.0e-10)
  assert_true((box.north() - (13.4)).abs() <= 1.0e-10)
  assert_true((box.east() - (-141.45)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:248" {
  let box = @geocodec.pluscode_bounds("9QWR5P99+3RC4H").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9QWR5P99+3RC4H"), 13)
  assert_true((box.south() - (68.167677)).abs() <= 1.0e-10)
  assert_true((box.west() - (136.719521484375)).abs() <= 1.0e-10)
  assert_true((box.north() - (68.167678)).abs() <= 1.0e-10)
  assert_true((box.east() - (136.7195234375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:249" {
  let box = @geocodec.pluscode_bounds("8H8VW72V+9GXV5").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8H8VW72V+9GXV5"), 13)
  assert_true((box.south() - (36.900995)).abs() <= 1.0e-10)
  assert_true((box.west() - (57.293857421875)).abs() <= 1.0e-10)
  assert_true((box.north() - (36.900996)).abs() <= 1.0e-10)
  assert_true((box.east() - (57.293859375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:250" {
  let box = @geocodec.pluscode_bounds("C22P7RRX+CG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C22P7RRX+CG"), 10)
  assert_true((box.south() - (70.291)).abs() <= 1.0e-10)
  assert_true((box.west() - (-165.15125)).abs() <= 1.0e-10)
  assert_true((box.north() - (70.291125)).abs() <= 1.0e-10)
  assert_true((box.east() - (-165.151125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:251" {
  let box = @geocodec.pluscode_bounds("CRJMCH4G+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CRJMCH4G+"), 8)
  assert_true((box.south() - (82.405)).abs() <= 1.0e-10)
  assert_true((box.west() - (153.575)).abs() <= 1.0e-10)
  assert_true((box.north() - (82.4075)).abs() <= 1.0e-10)
  assert_true((box.east() - (153.5775)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:252" {
  let box = @geocodec.pluscode_bounds("2GMMV6P7+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2GMMV6P7+"), 8)
  assert_true((box.south() - (-76.115)).abs() <= 1.0e-10)
  assert_true((box.west() - (33.2125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-76.1125)).abs() <= 1.0e-10)
  assert_true((box.east() - (33.215)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:253" {
  let box = @geocodec.pluscode_bounds("4M2Q7F9F+F8M").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4M2Q7F9F+F8M"), 11)
  assert_true((box.south() - (-49.7313)).abs() <= 1.0e-10)
  assert_true((box.west() - (95.47328125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-49.731275)).abs() <= 1.0e-10)
  assert_true((box.east() - (95.4733125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:254" {
  let box = @geocodec.pluscode_bounds("C55GR473+C5732").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C55GR473+C5732"), 13)
  assert_true((box.south() - (73.813525)).abs() <= 1.0e-10)
  assert_true((box.west() - (-109.8970859375)).abs() <= 1.0e-10)
  assert_true((box.north() - (73.813526)).abs() <= 1.0e-10)
  assert_true((box.east() - (-109.897083984375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:255" {
  let box = @geocodec.pluscode_bounds("8VR444PM+6JG4").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8VR444PM+6JG4"), 12)
  assert_true((box.south() - (46.13555)).abs() <= 1.0e-10)
  assert_true((box.west() - (162.134078125)).abs() <= 1.0e-10)
  assert_true((box.north() - (46.135555)).abs() <= 1.0e-10)
  assert_true((box.east() - (162.1340859375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:256" {
  let box = @geocodec.pluscode_bounds("2RWFW49X+CX").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2RWFW49X+CX"), 10)
  assert_true((box.south() - (-71.0815)).abs() <= 1.0e-10)
  assert_true((box.west() - (149.149875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-71.081375)).abs() <= 1.0e-10)
  assert_true((box.east() - (149.15)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:257" {
  let box = @geocodec.pluscode_bounds("749H0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("749H0000+"), 4)
  assert_true((box.south() - (17)).abs() <= 1.0e-10)
  assert_true((box.west() - (-129)).abs() <= 1.0e-10)
  assert_true((box.north() - (18)).abs() <= 1.0e-10)
  assert_true((box.east() - (-128)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:258" {
  let box = @geocodec.pluscode_bounds("2RPCW500+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2RPCW500+"), 6)
  assert_true((box.south() - (-75.1)).abs() <= 1.0e-10)
  assert_true((box.west() - (148.15)).abs() <= 1.0e-10)
  assert_true((box.north() - (-75.05)).abs() <= 1.0e-10)
  assert_true((box.east() - (148.2)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:259" {
  let box = @geocodec.pluscode_bounds("99PFC4FM+FFP").unwrap()
  assert_eq(@geocodec.pluscode_code_length("99PFC4FM+FFP"), 11)
  assert_true((box.south() - (64.4237)).abs() <= 1.0e-10)
  assert_true((box.west() - (-30.8663125)).abs() <= 1.0e-10)
  assert_true((box.north() - (64.423725)).abs() <= 1.0e-10)
  assert_true((box.east() - (-30.86628125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:260" {
  let box = @geocodec.pluscode_bounds("2FQPV8G7+HRV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2FQPV8G7+HRV"), 11)
  assert_true((box.south() - (-74.123525)).abs() <= 1.0e-10)
  assert_true((box.west() - (14.31453125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-74.1235)).abs() <= 1.0e-10)
  assert_true((box.east() - (14.3145625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:261" {
  let box = @geocodec.pluscode_bounds("CFM9GG2Q+VJXJV8Q").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CFM9GG2Q+VJXJV8Q"), 15)
  assert_true((box.south() - (83.50224432)).abs() <= 1.0e-10)
  assert_true((box.west() - (7.539097045898)).abs() <= 1.0e-10)
  assert_true((box.north() - (83.50224436)).abs() <= 1.0e-10)
  assert_true((box.east() - (7.539097167969)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:262" {
  let box = @geocodec.pluscode_bounds("C7M70000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C7M70000+"), 4)
  assert_true((box.south() - (83)).abs() <= 1.0e-10)
  assert_true((box.west() - (-75)).abs() <= 1.0e-10)
  assert_true((box.north() - (84)).abs() <= 1.0e-10)
  assert_true((box.east() - (-74)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:263" {
  let box = @geocodec.pluscode_bounds("35GQ8FHR+QX9").unwrap()
  assert_eq(@geocodec.pluscode_code_length("35GQ8FHR+QX9"), 11)
  assert_true((box.south() - (-59.6706)).abs() <= 1.0e-10)
  assert_true((box.west() - (-104.50753125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-59.670575)).abs() <= 1.0e-10)
  assert_true((box.east() - (-104.5075)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:264" {
  let box = @geocodec.pluscode_bounds("2MPM0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2MPM0000+"), 4)
  assert_true((box.south() - (-76)).abs() <= 1.0e-10)
  assert_true((box.west() - (93)).abs() <= 1.0e-10)
  assert_true((box.north() - (-75)).abs() <= 1.0e-10)
  assert_true((box.east() - (94)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:265" {
  let box = @geocodec.pluscode_bounds("6QFH0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6QFH0000+"), 4)
  assert_true((box.south() - (-1)).abs() <= 1.0e-10)
  assert_true((box.west() - (131)).abs() <= 1.0e-10)
  assert_true((box.north() - (0)).abs() <= 1.0e-10)
  assert_true((box.east() - (132)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:266" {
  let box = @geocodec.pluscode_bounds("7768MV6P+878").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7768MV6P+878"), 11)
  assert_true((box.south() - (14.660775)).abs() <= 1.0e-10)
  assert_true((box.west() - (-73.1143125)).abs() <= 1.0e-10)
  assert_true((box.north() - (14.6608)).abs() <= 1.0e-10)
  assert_true((box.east() - (-73.11428125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:267" {
  let box = @geocodec.pluscode_bounds("29MGCV00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("29MGCV00+"), 6)
  assert_true((box.south() - (-76.6)).abs() <= 1.0e-10)
  assert_true((box.west() - (-29.15)).abs() <= 1.0e-10)
  assert_true((box.north() - (-76.55)).abs() <= 1.0e-10)
  assert_true((box.east() - (-29.1)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:268" {
  let box = @geocodec.pluscode_bounds("95W3R6WQ+7R2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("95W3R6WQ+7R2"), 11)
  assert_true((box.south() - (68.845625)).abs() <= 1.0e-10)
  assert_true((box.west() - (-118.7605)).abs() <= 1.0e-10)
  assert_true((box.north() - (68.84565)).abs() <= 1.0e-10)
  assert_true((box.east() - (-118.76046875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:269" {
  let box = @geocodec.pluscode_bounds("68CP6FC4+9V").unwrap()
  assert_eq(@geocodec.pluscode_code_length("68CP6FC4+9V"), 10)
  assert_true((box.south() - (-1.779125)).abs() <= 1.0e-10)
  assert_true((box.west() - (-45.542875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-1.779)).abs() <= 1.0e-10)
  assert_true((box.east() - (-45.54275)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:270" {
  let box = @geocodec.pluscode_bounds("27XXF854+HJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("27XXF854+HJ"), 10)
  assert_true((box.south() - (-70.541125)).abs() <= 1.0e-10)
  assert_true((box.west() - (-60.6935)).abs() <= 1.0e-10)
  assert_true((box.north() - (-70.541)).abs() <= 1.0e-10)
  assert_true((box.east() - (-60.693375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:271" {
  let box = @geocodec.pluscode_bounds("99GCR6JM+G4CR").unwrap()
  assert_eq(@geocodec.pluscode_code_length("99GCR6JM+G4CR"), 12)
  assert_true((box.south() - (60.83132)).abs() <= 1.0e-10)
  assert_true((box.west() - (-31.76725)).abs() <= 1.0e-10)
  assert_true((box.north() - (60.831325)).abs() <= 1.0e-10)
  assert_true((box.east() - (-31.7672421875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:272" {
  let box = @geocodec.pluscode_bounds("696W2HGQ+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("696W2HGQ+"), 8)
  assert_true((box.south() - (-5.975)).abs() <= 1.0e-10)
  assert_true((box.west() - (-21.4125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-5.9725)).abs() <= 1.0e-10)
  assert_true((box.east() - (-21.41)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:273" {
  let box = @geocodec.pluscode_bounds("CR7V4GFR+FWFG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CR7V4GFR+FWFG"), 12)
  assert_true((box.south() - (75.123685)).abs() <= 1.0e-10)
  assert_true((box.west() - (157.542296875)).abs() <= 1.0e-10)
  assert_true((box.north() - (75.12369)).abs() <= 1.0e-10)
  assert_true((box.east() - (157.5423046875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:274" {
  let box = @geocodec.pluscode_bounds("2522WX3Q+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2522WX3Q+"), 8)
  assert_true((box.south() - (-89.0975)).abs() <= 1.0e-10)
  assert_true((box.west() - (-119.0125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-89.095)).abs() <= 1.0e-10)
  assert_true((box.east() - (-119.01)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:275" {
  let box = @geocodec.pluscode_bounds("8JP9JM00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8JP9JM00+"), 6)
  assert_true((box.south() - (44.6)).abs() <= 1.0e-10)
  assert_true((box.west() - (67.65)).abs() <= 1.0e-10)
  assert_true((box.north() - (44.65)).abs() <= 1.0e-10)
  assert_true((box.east() - (67.7)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:276" {
  let box = @geocodec.pluscode_bounds("45Q6F300+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("45Q6F300+"), 6)
  assert_true((box.south() - (-34.55)).abs() <= 1.0e-10)
  assert_true((box.west() - (-115.95)).abs() <= 1.0e-10)
  assert_true((box.north() - (-34.5)).abs() <= 1.0e-10)
  assert_true((box.east() - (-115.9)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:277" {
  let box = @geocodec.pluscode_bounds("26GC8G00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("26GC8G00+"), 6)
  assert_true((box.south() - (-79.7)).abs() <= 1.0e-10)
  assert_true((box.west() - (-91.5)).abs() <= 1.0e-10)
  assert_true((box.north() - (-79.65)).abs() <= 1.0e-10)
  assert_true((box.east() - (-91.45)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:278" {
  let box = @geocodec.pluscode_bounds("6JWX0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6JWX0000+"), 4)
  assert_true((box.south() - (8)).abs() <= 1.0e-10)
  assert_true((box.west() - (79)).abs() <= 1.0e-10)
  assert_true((box.north() - (9)).abs() <= 1.0e-10)
  assert_true((box.east() - (80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:279" {
  let box = @geocodec.pluscode_bounds("6VPP6CVC+6R").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6VPP6CVC+6R"), 10)
  assert_true((box.south() - (4.243)).abs() <= 1.0e-10)
  assert_true((box.west() - (174.422)).abs() <= 1.0e-10)
  assert_true((box.north() - (4.243125)).abs() <= 1.0e-10)
  assert_true((box.east() - (174.422125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:280" {
  let box = @geocodec.pluscode_bounds("8744CG7J+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8744CG7J+"), 8)
  assert_true((box.south() - (32.4125)).abs() <= 1.0e-10)
  assert_true((box.west() - (-77.47)).abs() <= 1.0e-10)
  assert_true((box.north() - (32.415)).abs() <= 1.0e-10)
  assert_true((box.east() - (-77.4675)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:281" {
  let box = @geocodec.pluscode_bounds("48000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("48000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (-60)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (-40)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:282" {
  let box = @geocodec.pluscode_bounds("3H9Q8X54+3R").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3H9Q8X54+3R"), 10)
  assert_true((box.south() - (-62.692375)).abs() <= 1.0e-10)
  assert_true((box.west() - (55.957)).abs() <= 1.0e-10)
  assert_true((box.north() - (-62.69225)).abs() <= 1.0e-10)
  assert_true((box.east() - (55.957125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:283" {
  let box = @geocodec.pluscode_bounds("7PJ24P43+F8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7PJ24P43+F8"), 10)
  assert_true((box.south() - (22.106125)).abs() <= 1.0e-10)
  assert_true((box.west() - (100.70325)).abs() <= 1.0e-10)
  assert_true((box.north() - (22.10625)).abs() <= 1.0e-10)
  assert_true((box.east() - (100.703375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:284" {
  let box = @geocodec.pluscode_bounds("26Q90000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("26Q90000+"), 4)
  assert_true((box.south() - (-75)).abs() <= 1.0e-10)
  assert_true((box.west() - (-93)).abs() <= 1.0e-10)
  assert_true((box.north() - (-74)).abs() <= 1.0e-10)
  assert_true((box.east() - (-92)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:285" {
  let box = @geocodec.pluscode_bounds("9VQRCGXP+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9VQRCGXP+"), 8)
  assert_true((box.south() - (65.4475)).abs() <= 1.0e-10)
  assert_true((box.west() - (176.535)).abs() <= 1.0e-10)
  assert_true((box.north() - (65.45)).abs() <= 1.0e-10)
  assert_true((box.east() - (176.5375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:286" {
  let box = @geocodec.pluscode_bounds("CQVQ3PC8+36").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CQVQ3PC8+36"), 10)
  assert_true((box.south() - (87.070125)).abs() <= 1.0e-10)
  assert_true((box.west() - (135.7155)).abs() <= 1.0e-10)
  assert_true((box.north() - (87.07025)).abs() <= 1.0e-10)
  assert_true((box.east() - (135.715625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:287" {
  let box = @geocodec.pluscode_bounds("2G2VR2X9+39V8J").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2G2VR2X9+39V8J"), 13)
  assert_true((box.south() - (-89.152267)).abs() <= 1.0e-10)
  assert_true((box.west() - (37.018421875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-89.152266)).abs() <= 1.0e-10)
  assert_true((box.east() - (37.018423828125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:288" {
  let box = @geocodec.pluscode_bounds("C2PCFG7G+P3JMCG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C2PCFG7G+P3JMCG"), 14)
  assert_true((box.south() - (84.4643424)).abs() <= 1.0e-10)
  assert_true((box.west() - (-171.474866210938)).abs() <= 1.0e-10)
  assert_true((box.north() - (84.4643426)).abs() <= 1.0e-10)
  assert_true((box.east() - (-171.474865722656)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:289" {
  let box = @geocodec.pluscode_bounds("5RFXJVRC+M3C").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5RFXJVRC+M3C"), 11)
  assert_true((box.south() - (-20.358325)).abs() <= 1.0e-10)
  assert_true((box.west() - (159.870125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-20.3583)).abs() <= 1.0e-10)
  assert_true((box.east() - (159.87015625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:290" {
  let box = @geocodec.pluscode_bounds("3GQR9F9Q+FMWGHM").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3GQR9F9Q+FMWGHM"), 14)
  assert_true((box.south() - (-54.6312624)).abs() <= 1.0e-10)
  assert_true((box.west() - (36.489209472656)).abs() <= 1.0e-10)
  assert_true((box.north() - (-54.6312622)).abs() <= 1.0e-10)
  assert_true((box.east() - (36.489209960938)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:291" {
  let box = @geocodec.pluscode_bounds("58P6PP00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("58P6PP00+"), 6)
  assert_true((box.south() - (-15.3)).abs() <= 1.0e-10)
  assert_true((box.west() - (-55.3)).abs() <= 1.0e-10)
  assert_true((box.north() - (-15.25)).abs() <= 1.0e-10)
  assert_true((box.east() - (-55.25)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:292" {
  let box = @geocodec.pluscode_bounds("53W80000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("53W80000+"), 4)
  assert_true((box.south() - (-12)).abs() <= 1.0e-10)
  assert_true((box.west() - (-154)).abs() <= 1.0e-10)
  assert_true((box.north() - (-11)).abs() <= 1.0e-10)
  assert_true((box.east() - (-153)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:293" {
  let box = @geocodec.pluscode_bounds("9J7MJQJ4+29687RF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9J7MJQJ4+29687RF"), 15)
  assert_true((box.south() - (55.63003188)).abs() <= 1.0e-10)
  assert_true((box.west() - (73.755892700195)).abs() <= 1.0e-10)
  assert_true((box.north() - (55.63003192)).abs() <= 1.0e-10)
  assert_true((box.east() - (73.755892822266)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:294" {
  let box = @geocodec.pluscode_bounds("58V6PMXH+9V56R").unwrap()
  assert_eq(@geocodec.pluscode_code_length("58V6PMXH+9V56R"), 13)
  assert_true((box.south() - (-12.251616)).abs() <= 1.0e-10)
  assert_true((box.west() - (-55.32028125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-12.251615)).abs() <= 1.0e-10)
  assert_true((box.east() - (-55.320279296875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:295" {
  let box = @geocodec.pluscode_bounds("C2000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C2000000+"), 2)
  assert_true((box.south() - (70)).abs() <= 1.0e-10)
  assert_true((box.west() - (-180)).abs() <= 1.0e-10)
  assert_true((box.north() - (90)).abs() <= 1.0e-10)
  assert_true((box.east() - (-160)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:296" {
  let box = @geocodec.pluscode_bounds("849PCC62+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("849PCC62+"), 8)
  assert_true((box.south() - (37.41)).abs() <= 1.0e-10)
  assert_true((box.west() - (-125.6)).abs() <= 1.0e-10)
  assert_true((box.north() - (37.4125)).abs() <= 1.0e-10)
  assert_true((box.east() - (-125.5975)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:297" {
  let box = @geocodec.pluscode_bounds("8Q000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8Q000000+"), 2)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (120)).abs() <= 1.0e-10)
  assert_true((box.north() - (50)).abs() <= 1.0e-10)
  assert_true((box.east() - (140)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:298" {
  let box = @geocodec.pluscode_bounds("2J5W78X6+R85HP").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2J5W78X6+R85HP"), 13)
  assert_true((box.south() - (-86.700487)).abs() <= 1.0e-10)
  assert_true((box.west() - (78.31087109375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-86.700486)).abs() <= 1.0e-10)
  assert_true((box.east() - (78.310873046875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:299" {
  let box = @geocodec.pluscode_bounds("7R8FVC00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7R8FVC00+"), 6)
  assert_true((box.south() - (16.85)).abs() <= 1.0e-10)
  assert_true((box.west() - (149.4)).abs() <= 1.0e-10)
  assert_true((box.north() - (16.9)).abs() <= 1.0e-10)
  assert_true((box.east() - (149.45)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:300" {
  let box = @geocodec.pluscode_bounds("4F3V6CW4+6RM").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4F3V6CW4+6RM"), 11)
  assert_true((box.south() - (-48.754425)).abs() <= 1.0e-10)
  assert_true((box.west() - (17.40703125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-48.7544)).abs() <= 1.0e-10)
  assert_true((box.east() - (17.4070625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:301" {
  let box = @geocodec.pluscode_bounds("4644RFCX+FFCQ7").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4644RFCX+FFCQ7"), 13)
  assert_true((box.south() - (-47.178809)).abs() <= 1.0e-10)
  assert_true((box.west() - (-97.501349609375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-47.178808)).abs() <= 1.0e-10)
  assert_true((box.east() - (-97.50134765625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:302" {
  let box = @geocodec.pluscode_bounds("CH5V24RF+F45").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CH5V24RF+F45"), 11)
  assert_true((box.south() - (73.041125)).abs() <= 1.0e-10)
  assert_true((box.west() - (57.12284375)).abs() <= 1.0e-10)
  assert_true((box.north() - (73.04115)).abs() <= 1.0e-10)
  assert_true((box.east() - (57.122875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:303" {
  let box = @geocodec.pluscode_bounds("99QGQQRC+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("99QGQQRC+"), 8)
  assert_true((box.south() - (65.79)).abs() <= 1.0e-10)
  assert_true((box.west() - (-29.23)).abs() <= 1.0e-10)
  assert_true((box.north() - (65.7925)).abs() <= 1.0e-10)
  assert_true((box.east() - (-29.2275)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:304" {
  let box = @geocodec.pluscode_bounds("CG23GQVW+WX").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CG23GQVW+WX"), 10)
  assert_true((box.south() - (70.54475)).abs() <= 1.0e-10)
  assert_true((box.west() - (21.797375)).abs() <= 1.0e-10)
  assert_true((box.north() - (70.544875)).abs() <= 1.0e-10)
  assert_true((box.east() - (21.7975)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:305" {
  let box = @geocodec.pluscode_bounds("C5J2HFC9+9GPC").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C5J2HFC9+9GPC"), 12)
  assert_true((box.south() - (82.57096)).abs() <= 1.0e-10)
  assert_true((box.west() - (-119.5311875)).abs() <= 1.0e-10)
  assert_true((box.north() - (82.570965)).abs() <= 1.0e-10)
  assert_true((box.east() - (-119.5311796875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:306" {
  let box = @geocodec.pluscode_bounds("979V23X2+V97C6Q").unwrap()
  assert_eq(@geocodec.pluscode_code_length("979V23X2+V97C6Q"), 14)
  assert_true((box.south() - (57.0496616)).abs() <= 1.0e-10)
  assert_true((box.west() - (-62.949092285156)).abs() <= 1.0e-10)
  assert_true((box.north() - (57.0496618)).abs() <= 1.0e-10)
  assert_true((box.east() - (-62.949091796875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:307" {
  let box = @geocodec.pluscode_bounds("3MPRMP24+6HR").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3MPRMP24+6HR"), 11)
  assert_true((box.south() - (-55.3494)).abs() <= 1.0e-10)
  assert_true((box.west() - (96.706375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-55.349375)).abs() <= 1.0e-10)
  assert_true((box.east() - (96.70640625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:308" {
  let box = @geocodec.pluscode_bounds("9338792J+46").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9338792J+46"), 10)
  assert_true((box.south() - (51.25025)).abs() <= 1.0e-10)
  assert_true((box.west() - (-153.6195)).abs() <= 1.0e-10)
  assert_true((box.north() - (51.250375)).abs() <= 1.0e-10)
  assert_true((box.east() - (-153.619375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:309" {
  let box = @geocodec.pluscode_bounds("7M000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7M000000+"), 2)
  assert_true((box.south() - (10)).abs() <= 1.0e-10)
  assert_true((box.west() - (80)).abs() <= 1.0e-10)
  assert_true((box.north() - (30)).abs() <= 1.0e-10)
  assert_true((box.east() - (100)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:310" {
  let box = @geocodec.pluscode_bounds("37V2J4CV+GH9P5H").unwrap()
  assert_eq(@geocodec.pluscode_code_length("37V2J4CV+GH9P5H"), 14)
  assert_true((box.south() - (-52.3787096)).abs() <= 1.0e-10)
  assert_true((box.west() - (-79.856008300781)).abs() <= 1.0e-10)
  assert_true((box.north() - (-52.3787094)).abs() <= 1.0e-10)
  assert_true((box.east() - (-79.8560078125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:311" {
  let box = @geocodec.pluscode_bounds("27F7RFFR+XC").unwrap()
  assert_eq(@geocodec.pluscode_code_length("27F7RFFR+XC"), 10)
  assert_true((box.south() - (-80.175125)).abs() <= 1.0e-10)
  assert_true((box.west() - (-74.509)).abs() <= 1.0e-10)
  assert_true((box.north() - (-80.175)).abs() <= 1.0e-10)
  assert_true((box.east() - (-74.508875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:312" {
  let box = @geocodec.pluscode_bounds("7836C2GR+5R7GHP").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7836C2GR+5R7GHP"), 14)
  assert_true((box.south() - (11.4254126)).abs() <= 1.0e-10)
  assert_true((box.west() - (-55.957946289062)).abs() <= 1.0e-10)
  assert_true((box.north() - (11.4254128)).abs() <= 1.0e-10)
  assert_true((box.east() - (-55.957945800781)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:313" {
  let box = @geocodec.pluscode_bounds("966PF9QH+M5H7XFP").unwrap()
  assert_eq(@geocodec.pluscode_code_length("966PF9QH+M5H7XFP"), 15)
  assert_true((box.south() - (54.48918452)).abs() <= 1.0e-10)
  assert_true((box.west() - (-85.622016845703)).abs() <= 1.0e-10)
  assert_true((box.north() - (54.48918456)).abs() <= 1.0e-10)
  assert_true((box.east() - (-85.622016723633)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:314" {
  let box = @geocodec.pluscode_bounds("62M5653J+Q3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("62M5653J+Q3"), 10)
  assert_true((box.south() - (3.204375)).abs() <= 1.0e-10)
  assert_true((box.west() - (-176.819875)).abs() <= 1.0e-10)
  assert_true((box.north() - (3.2045)).abs() <= 1.0e-10)
  assert_true((box.east() - (-176.81975)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:315" {
  let box = @geocodec.pluscode_bounds("4CRV6R00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4CRV6R00+"), 6)
  assert_true((box.south() - (-33.8)).abs() <= 1.0e-10)
  assert_true((box.west() - (-2.2)).abs() <= 1.0e-10)
  assert_true((box.north() - (-33.75)).abs() <= 1.0e-10)
  assert_true((box.east() - (-2.15)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:316" {
  let box = @geocodec.pluscode_bounds("7C000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7C000000+"), 2)
  assert_true((box.south() - (10)).abs() <= 1.0e-10)
  assert_true((box.west() - (-20)).abs() <= 1.0e-10)
  assert_true((box.north() - (30)).abs() <= 1.0e-10)
  assert_true((box.east() - (0)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:317" {
  let box = @geocodec.pluscode_bounds("76R3X74J+XC75R9H").unwrap()
  assert_eq(@geocodec.pluscode_code_length("76R3X74J+XC75R9H"), 15)
  assert_true((box.south() - (26.95740428)).abs() <= 1.0e-10)
  assert_true((box.west() - (-98.718943481445)).abs() <= 1.0e-10)
  assert_true((box.north() - (26.95740432)).abs() <= 1.0e-10)
  assert_true((box.east() - (-98.718943359375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:318" {
  let box = @geocodec.pluscode_bounds("69VX8G9Q+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("69VX8G9Q+"), 8)
  assert_true((box.south() - (7.3175)).abs() <= 1.0e-10)
  assert_true((box.west() - (-20.4625)).abs() <= 1.0e-10)
  assert_true((box.north() - (7.32)).abs() <= 1.0e-10)
  assert_true((box.east() - (-20.46)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:319" {
  let box = @geocodec.pluscode_bounds("8R000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8R000000+"), 2)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (140)).abs() <= 1.0e-10)
  assert_true((box.north() - (50)).abs() <= 1.0e-10)
  assert_true((box.east() - (160)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:320" {
  let box = @geocodec.pluscode_bounds("2J4WGQ7H+PR").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2J4WGQ7H+PR"), 10)
  assert_true((box.south() - (-87.48575)).abs() <= 1.0e-10)
  assert_true((box.west() - (78.7795)).abs() <= 1.0e-10)
  assert_true((box.north() - (-87.485625)).abs() <= 1.0e-10)
  assert_true((box.east() - (78.779625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:321" {
  let box = @geocodec.pluscode_bounds("4J000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4J000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (60)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:322" {
  let box = @geocodec.pluscode_bounds("28RH5900+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("28RH5900+"), 6)
  assert_true((box.south() - (-73.85)).abs() <= 1.0e-10)
  assert_true((box.west() - (-48.65)).abs() <= 1.0e-10)
  assert_true((box.north() - (-73.8)).abs() <= 1.0e-10)
  assert_true((box.east() - (-48.6)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:323" {
  let box = @geocodec.pluscode_bounds("7RM768XF+XJJCV6").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7RM768XF+XJJCV6"), 14)
  assert_true((box.south() - (23.2499642)).abs() <= 1.0e-10)
  assert_true((box.west() - (145.324001953125)).abs() <= 1.0e-10)
  assert_true((box.north() - (23.2499644)).abs() <= 1.0e-10)
  assert_true((box.east() - (145.324002441406)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:324" {
  let box = @geocodec.pluscode_bounds("6V000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6V000000+"), 2)
  assert_true((box.south() - (-10)).abs() <= 1.0e-10)
  assert_true((box.west() - (160)).abs() <= 1.0e-10)
  assert_true((box.north() - (10)).abs() <= 1.0e-10)
  assert_true((box.east() - (180)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:325" {
  let box = @geocodec.pluscode_bounds("5F8RMM4C+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5F8RMM4C+"), 8)
  assert_true((box.south() - (-23.345)).abs() <= 1.0e-10)
  assert_true((box.west() - (16.67)).abs() <= 1.0e-10)
  assert_true((box.north() - (-23.3425)).abs() <= 1.0e-10)
  assert_true((box.east() - (16.6725)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:326" {
  let box = @geocodec.pluscode_bounds("2V9CQQPJ+Q9R3J4").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2V9CQQPJ+Q9R3J4"), 14)
  assert_true((box.south() - (-82.213022)).abs() <= 1.0e-10)
  assert_true((box.west() - (168.780883789062)).abs() <= 1.0e-10)
  assert_true((box.north() - (-82.2130218)).abs() <= 1.0e-10)
  assert_true((box.east() - (168.780884277344)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:327" {
  let box = @geocodec.pluscode_bounds("3R8WMCRC+29Q7J").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3R8WMCRC+29Q7J"), 13)
  assert_true((box.south() - (-63.309917)).abs() <= 1.0e-10)
  assert_true((box.west() - (158.4209765625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-63.309916)).abs() <= 1.0e-10)
  assert_true((box.east() - (158.420978515625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:328" {
  let box = @geocodec.pluscode_bounds("73VJGV58+3W").unwrap()
  assert_eq(@geocodec.pluscode_code_length("73VJGV58+3W"), 10)
  assert_true((box.south() - (27.507625)).abs() <= 1.0e-10)
  assert_true((box.west() - (-147.13275)).abs() <= 1.0e-10)
  assert_true((box.north() - (27.50775)).abs() <= 1.0e-10)
  assert_true((box.east() - (-147.132625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:329" {
  let box = @geocodec.pluscode_bounds("6253V5FP+93J7H").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6253V5FP+93J7H"), 13)
  assert_true((box.south() - (-6.126543)).abs() <= 1.0e-10)
  assert_true((box.west() - (-178.814861328125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-6.126542)).abs() <= 1.0e-10)
  assert_true((box.east() - (-178.814859375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:330" {
  let box = @geocodec.pluscode_bounds("423726P5+P72").unwrap()
  assert_eq(@geocodec.pluscode_code_length("423726P5+P72"), 11)
  assert_true((box.south() - (-48.96325)).abs() <= 1.0e-10)
  assert_true((box.west() - (-174.791875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-48.963225)).abs() <= 1.0e-10)
  assert_true((box.east() - (-174.79184375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:331" {
  let box = @geocodec.pluscode_bounds("8GC50000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8GC50000+"), 4)
  assert_true((box.south() - (38)).abs() <= 1.0e-10)
  assert_true((box.west() - (23)).abs() <= 1.0e-10)
  assert_true((box.north() - (39)).abs() <= 1.0e-10)
  assert_true((box.east() - (24)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:332" {
  let box = @geocodec.pluscode_bounds("89GX0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("89GX0000+"), 4)
  assert_true((box.south() - (40)).abs() <= 1.0e-10)
  assert_true((box.west() - (-21)).abs() <= 1.0e-10)
  assert_true((box.north() - (41)).abs() <= 1.0e-10)
  assert_true((box.east() - (-20)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:333" {
  let box = @geocodec.pluscode_bounds("7F7RHWMV+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7F7RHWMV+"), 8)
  assert_true((box.south() - (15.5825)).abs() <= 1.0e-10)
  assert_true((box.west() - (16.9425)).abs() <= 1.0e-10)
  assert_true((box.north() - (15.585)).abs() <= 1.0e-10)
  assert_true((box.east() - (16.945)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:334" {
  let box = @geocodec.pluscode_bounds("7P5F0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7P5F0000+"), 4)
  assert_true((box.south() - (13)).abs() <= 1.0e-10)
  assert_true((box.west() - (109)).abs() <= 1.0e-10)
  assert_true((box.north() - (14)).abs() <= 1.0e-10)
  assert_true((box.east() - (110)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:335" {
  let box = @geocodec.pluscode_bounds("988X4V00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("988X4V00+"), 6)
  assert_true((box.south() - (56.1)).abs() <= 1.0e-10)
  assert_true((box.west() - (-40.15)).abs() <= 1.0e-10)
  assert_true((box.north() - (56.15)).abs() <= 1.0e-10)
  assert_true((box.east() - (-40.1)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:336" {
  let box = @geocodec.pluscode_bounds("4QC4F8G7+WVH6").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4QC4F8G7+WVH6"), 12)
  assert_true((box.south() - (-41.522695)).abs() <= 1.0e-10)
  assert_true((box.west() - (122.31471875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-41.52269)).abs() <= 1.0e-10)
  assert_true((box.east() - (122.3147265625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:337" {
  let box = @geocodec.pluscode_bounds("5GJV5MJG+WQ54M6").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5GJV5MJG+WQ54M6"), 14)
  assert_true((box.south() - (-17.8177468)).abs() <= 1.0e-10)
  assert_true((box.west() - (37.676986328125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-17.8177466)).abs() <= 1.0e-10)
  assert_true((box.east() - (37.676986816406)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:338" {
  let box = @geocodec.pluscode_bounds("6RV9W6R4+49MW").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6RV9W6R4+49MW"), 12)
  assert_true((box.south() - (7.940345)).abs() <= 1.0e-10)
  assert_true((box.west() - (147.205921875)).abs() <= 1.0e-10)
  assert_true((box.north() - (7.94035)).abs() <= 1.0e-10)
  assert_true((box.east() - (147.2059296875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:339" {
  let box = @geocodec.pluscode_bounds("5R3MF2VM+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5R3MF2VM+"), 8)
  assert_true((box.south() - (-28.5075)).abs() <= 1.0e-10)
  assert_true((box.west() - (153.0325)).abs() <= 1.0e-10)
  assert_true((box.north() - (-28.505)).abs() <= 1.0e-10)
  assert_true((box.east() - (153.035)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:340" {
  let box = @geocodec.pluscode_bounds("9HVJ0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9HVJ0000+"), 4)
  assert_true((box.south() - (67)).abs() <= 1.0e-10)
  assert_true((box.west() - (52)).abs() <= 1.0e-10)
  assert_true((box.north() - (68)).abs() <= 1.0e-10)
  assert_true((box.east() - (53)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:341" {
  let box = @geocodec.pluscode_bounds("CQJC2W6C+XWW2G").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CQJC2W6C+XWW2G"), 13)
  assert_true((box.south() - (82.012477)).abs() <= 1.0e-10)
  assert_true((box.west() - (128.92231640625)).abs() <= 1.0e-10)
  assert_true((box.north() - (82.012478)).abs() <= 1.0e-10)
  assert_true((box.east() - (128.922318359375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:342" {
  let box = @geocodec.pluscode_bounds("5599RX34+8RPRHVQ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5599RX34+8RPRHVQ"), 15)
  assert_true((box.south() - (-22.19665208)).abs() <= 1.0e-10)
  assert_true((box.west() - (-112.042930786133)).abs() <= 1.0e-10)
  assert_true((box.north() - (-22.19665204)).abs() <= 1.0e-10)
  assert_true((box.east() - (-112.042930664062)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:343" {
  let box = @geocodec.pluscode_bounds("4V7G0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4V7G0000+"), 4)
  assert_true((box.south() - (-45)).abs() <= 1.0e-10)
  assert_true((box.west() - (170)).abs() <= 1.0e-10)
  assert_true((box.north() - (-44)).abs() <= 1.0e-10)
  assert_true((box.east() - (171)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:344" {
  let box = @geocodec.pluscode_bounds("59000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("59000000+"), 2)
  assert_true((box.south() - (-30)).abs() <= 1.0e-10)
  assert_true((box.west() - (-40)).abs() <= 1.0e-10)
  assert_true((box.north() - (-10)).abs() <= 1.0e-10)
  assert_true((box.east() - (-20)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:345" {
  let box = @geocodec.pluscode_bounds("45000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("45000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (-120)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (-100)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:346" {
  let box = @geocodec.pluscode_bounds("42000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("42000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (-180)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (-160)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:347" {
  let box = @geocodec.pluscode_bounds("24Q7W9WJ+8XF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("24Q7W9WJ+8XF"), 11)
  assert_true((box.south() - (-74.0542)).abs() <= 1.0e-10)
  assert_true((box.west() - (-134.61759375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-74.054175)).abs() <= 1.0e-10)
  assert_true((box.east() - (-134.6175625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:348" {
  let box = @geocodec.pluscode_bounds("837CJG38+VC").unwrap()
  assert_eq(@geocodec.pluscode_code_length("837CJG38+VC"), 10)
  assert_true((box.south() - (35.604625)).abs() <= 1.0e-10)
  assert_true((box.west() - (-151.484)).abs() <= 1.0e-10)
  assert_true((box.north() - (35.60475)).abs() <= 1.0e-10)
  assert_true((box.east() - (-151.483875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:349" {
  let box = @geocodec.pluscode_bounds("4FCGG22Q+RJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4FCGG22Q+RJ"), 10)
  assert_true((box.south() - (-41.498)).abs() <= 1.0e-10)
  assert_true((box.west() - (10.039)).abs() <= 1.0e-10)
  assert_true((box.north() - (-41.497875)).abs() <= 1.0e-10)
  assert_true((box.east() - (10.039125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:350" {
  let box = @geocodec.pluscode_bounds("2M9J322H+9J3P").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2M9J322H+9J3P"), 12)
  assert_true((box.south() - (-82.94911)).abs() <= 1.0e-10)
  assert_true((box.west() - (92.029046875)).abs() <= 1.0e-10)
  assert_true((box.north() - (-82.949105)).abs() <= 1.0e-10)
  assert_true((box.east() - (92.0290546875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:351" {
  let box = @geocodec.pluscode_bounds("CQVXRW3G+C79HR4X").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CQVXRW3G+C79HR4X"), 15)
  assert_true((box.south() - (87.80353916)).abs() <= 1.0e-10)
  assert_true((box.west() - (139.925743530273)).abs() <= 1.0e-10)
  assert_true((box.north() - (87.8035392)).abs() <= 1.0e-10)
  assert_true((box.east() - (139.925743652344)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:352" {
  let box = @geocodec.pluscode_bounds("9MJG96R6+RCW2").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9MJG96R6+RCW2"), 12)
  assert_true((box.south() - (62.3921)).abs() <= 1.0e-10)
  assert_true((box.west() - (90.2110625)).abs() <= 1.0e-10)
  assert_true((box.north() - (62.392105)).abs() <= 1.0e-10)
  assert_true((box.east() - (90.2110703125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:353" {
  let box = @geocodec.pluscode_bounds("5P000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5P000000+"), 2)
  assert_true((box.south() - (-30)).abs() <= 1.0e-10)
  assert_true((box.west() - (100)).abs() <= 1.0e-10)
  assert_true((box.north() - (-10)).abs() <= 1.0e-10)
  assert_true((box.east() - (120)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:354" {
  let box = @geocodec.pluscode_bounds("5VX5628W+5RCR").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5VX5628W+5RCR"), 12)
  assert_true((box.south() - (-10.784555)).abs() <= 1.0e-10)
  assert_true((box.west() - (163.047)).abs() <= 1.0e-10)
  assert_true((box.north() - (-10.78455)).abs() <= 1.0e-10)
  assert_true((box.east() - (163.0470078125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:355" {
  let box = @geocodec.pluscode_bounds("5J2H9H6F+JV7").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5J2H9H6F+JV7"), 11)
  assert_true((box.south() - (-29.638475)).abs() <= 1.0e-10)
  assert_true((box.west() - (71.57465625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-29.63845)).abs() <= 1.0e-10)
  assert_true((box.east() - (71.5746875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:356" {
  let box = @geocodec.pluscode_bounds("7JH70000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7JH70000+"), 4)
  assert_true((box.south() - (21)).abs() <= 1.0e-10)
  assert_true((box.west() - (65)).abs() <= 1.0e-10)
  assert_true((box.north() - (22)).abs() <= 1.0e-10)
  assert_true((box.east() - (66)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:357" {
  let box = @geocodec.pluscode_bounds("CJ96X2P7+J632R").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CJ96X2P7+J632R"), 13)
  assert_true((box.south() - (77.986504)).abs() <= 1.0e-10)
  assert_true((box.west() - (64.01303125)).abs() <= 1.0e-10)
  assert_true((box.north() - (77.986505)).abs() <= 1.0e-10)
  assert_true((box.east() - (64.013033203125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:358" {
  let box = @geocodec.pluscode_bounds("7HC4GG7J+R35J").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7HC4GG7J+R35J"), 12)
  assert_true((box.south() - (18.514515)).abs() <= 1.0e-10)
  assert_true((box.west() - (42.53021875)).abs() <= 1.0e-10)
  assert_true((box.north() - (18.51452)).abs() <= 1.0e-10)
  assert_true((box.east() - (42.5302265625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:359" {
  let box = @geocodec.pluscode_bounds("69PJQWVF+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("69PJQWVF+"), 8)
  assert_true((box.south() - (4.7925)).abs() <= 1.0e-10)
  assert_true((box.west() - (-27.0775)).abs() <= 1.0e-10)
  assert_true((box.north() - (4.795)).abs() <= 1.0e-10)
  assert_true((box.east() - (-27.075)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:360" {
  let box = @geocodec.pluscode_bounds("76HQ3773+VHH4C3V").unwrap()
  assert_eq(@geocodec.pluscode_code_length("76HQ3773+VHH4C3V"), 15)
  assert_true((box.south() - (21.06467716)).abs() <= 1.0e-10)
  assert_true((box.west() - (-84.746015014648)).abs() <= 1.0e-10)
  assert_true((box.north() - (21.0646772)).abs() <= 1.0e-10)
  assert_true((box.east() - (-84.746014892578)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:361" {
  let box = @geocodec.pluscode_bounds("89WQWMWH+M5JVGV7").unwrap()
  assert_eq(@geocodec.pluscode_code_length("89WQWMWH+M5JVGV7"), 15)
  assert_true((box.south() - (48.94672284)).abs() <= 1.0e-10)
  assert_true((box.west() - (-24.322112670898)).abs() <= 1.0e-10)
  assert_true((box.north() - (48.94672288)).abs() <= 1.0e-10)
  assert_true((box.east() - (-24.322112548828)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:362" {
  let box = @geocodec.pluscode_bounds("84VJP600+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("84VJP600+"), 6)
  assert_true((box.south() - (47.7)).abs() <= 1.0e-10)
  assert_true((box.west() - (-127.8)).abs() <= 1.0e-10)
  assert_true((box.north() - (47.75)).abs() <= 1.0e-10)
  assert_true((box.east() - (-127.75)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:363" {
  let box = @geocodec.pluscode_bounds("36G8G300+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("36G8G300+"), 6)
  assert_true((box.south() - (-59.5)).abs() <= 1.0e-10)
  assert_true((box.west() - (-93.95)).abs() <= 1.0e-10)
  assert_true((box.north() - (-59.45)).abs() <= 1.0e-10)
  assert_true((box.east() - (-93.9)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:364" {
  let box = @geocodec.pluscode_bounds("479H0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("479H0000+"), 4)
  assert_true((box.south() - (-43)).abs() <= 1.0e-10)
  assert_true((box.west() - (-69)).abs() <= 1.0e-10)
  assert_true((box.north() - (-42)).abs() <= 1.0e-10)
  assert_true((box.east() - (-68)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:365" {
  let box = @geocodec.pluscode_bounds("94GG6QPW+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("94GG6QPW+"), 8)
  assert_true((box.south() - (60.235)).abs() <= 1.0e-10)
  assert_true((box.west() - (-129.205)).abs() <= 1.0e-10)
  assert_true((box.north() - (60.2375)).abs() <= 1.0e-10)
  assert_true((box.east() - (-129.2025)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:366" {
  let box = @geocodec.pluscode_bounds("97X7J8R3+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("97X7J8R3+"), 8)
  assert_true((box.south() - (69.64)).abs() <= 1.0e-10)
  assert_true((box.west() - (-74.6975)).abs() <= 1.0e-10)
  assert_true((box.north() - (69.6425)).abs() <= 1.0e-10)
  assert_true((box.east() - (-74.695)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:367" {
  let box = @geocodec.pluscode_bounds("2Q7XX54P+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2Q7XX54P+"), 8)
  assert_true((box.south() - (-84.045)).abs() <= 1.0e-10)
  assert_true((box.west() - (139.185)).abs() <= 1.0e-10)
  assert_true((box.north() - (-84.0425)).abs() <= 1.0e-10)
  assert_true((box.east() - (139.1875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:368" {
  let box = @geocodec.pluscode_bounds("9628MQJQ+X9QQQPM").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9628MQJQ+X9QQQPM"), 15)
  assert_true((box.south() - (50.68246872)).abs() <= 1.0e-10)
  assert_true((box.west() - (-93.211500854492)).abs() <= 1.0e-10)
  assert_true((box.north() - (50.68246876)).abs() <= 1.0e-10)
  assert_true((box.east() - (-93.211500732422)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:369" {
  let box = @geocodec.pluscode_bounds("2QHJC7R4+648").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2QHJC7R4+648"), 11)
  assert_true((box.south() - (-78.559475)).abs() <= 1.0e-10)
  assert_true((box.west() - (132.2553125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-78.55945)).abs() <= 1.0e-10)
  assert_true((box.east() - (132.25534375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:370" {
  let box = @geocodec.pluscode_bounds("87M33FJ9+RXFP5G").unwrap()
  assert_eq(@geocodec.pluscode_code_length("87M33FJ9+RXFP5G"), 14)
  assert_true((box.south() - (43.0820654)).abs() <= 1.0e-10)
  assert_true((box.west() - (-78.530071289063)).abs() <= 1.0e-10)
  assert_true((box.north() - (43.0820656)).abs() <= 1.0e-10)
  assert_true((box.east() - (-78.530070800781)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:371" {
  let box = @geocodec.pluscode_bounds("7C9GF5G9+2GQR72").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7C9GF5G9+2GQR72"), 14)
  assert_true((box.south() - (17.475096)).abs() <= 1.0e-10)
  assert_true((box.west() - (-9.831154296875)).abs() <= 1.0e-10)
  assert_true((box.north() - (17.4750962)).abs() <= 1.0e-10)
  assert_true((box.east() - (-9.831153808594)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:372" {
  let box = @geocodec.pluscode_bounds("464F0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("464F0000+"), 4)
  assert_true((box.south() - (-48)).abs() <= 1.0e-10)
  assert_true((box.west() - (-91)).abs() <= 1.0e-10)
  assert_true((box.north() - (-47)).abs() <= 1.0e-10)
  assert_true((box.east() - (-90)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:373" {
  let box = @geocodec.pluscode_bounds("52PJ7RG9+C4HH").unwrap()
  assert_eq(@geocodec.pluscode_code_length("52PJ7RG9+C4HH"), 12)
  assert_true((box.south() - (-15.72394)).abs() <= 1.0e-10)
  assert_true((box.west() - (-167.1821328125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-15.723935)).abs() <= 1.0e-10)
  assert_true((box.east() - (-167.182125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:374" {
  let box = @geocodec.pluscode_bounds("9R52VH00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9R52VH00+"), 6)
  assert_true((box.south() - (53.85)).abs() <= 1.0e-10)
  assert_true((box.west() - (140.55)).abs() <= 1.0e-10)
  assert_true((box.north() - (53.9)).abs() <= 1.0e-10)
  assert_true((box.east() - (140.6)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:375" {
  let box = @geocodec.pluscode_bounds("522C64P6+MQ8WQQ7").unwrap()
  assert_eq(@geocodec.pluscode_code_length("522C64P6+MQ8WQQ7"), 15)
  assert_true((box.south() - (-29.76332636)).abs() <= 1.0e-10)
  assert_true((box.west() - (-171.888039428711)).abs() <= 1.0e-10)
  assert_true((box.north() - (-29.76332632)).abs() <= 1.0e-10)
  assert_true((box.east() - (-171.888039306641)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:376" {
  let box = @geocodec.pluscode_bounds("5RF3C638+M776H").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5RF3C638+M776H"), 13)
  assert_true((box.south() - (-20.595843)).abs() <= 1.0e-10)
  assert_true((box.west() - (141.215662109375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-20.595842)).abs() <= 1.0e-10)
  assert_true((box.east() - (141.2156640625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:377" {
  let box = @geocodec.pluscode_bounds("9MG8C4F4+V532Q4J").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9MG8C4F4+V532Q4J"), 15)
  assert_true((box.south() - (60.42462812)).abs() <= 1.0e-10)
  assert_true((box.west() - (86.105413085937)).abs() <= 1.0e-10)
  assert_true((box.north() - (60.42462816)).abs() <= 1.0e-10)
  assert_true((box.east() - (86.105413208008)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:378" {
  let box = @geocodec.pluscode_bounds("73P8F2G7+QV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("73P8F2G7+QV"), 10)
  assert_true((box.south() - (24.476875)).abs() <= 1.0e-10)
  assert_true((box.west() - (-153.985375)).abs() <= 1.0e-10)
  assert_true((box.north() - (24.477)).abs() <= 1.0e-10)
  assert_true((box.east() - (-153.98525)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:379" {
  let box = @geocodec.pluscode_bounds("6RCRQ633+FW6PJFW").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6RCRQ633+FW6PJFW"), 15)
  assert_true((box.south() - (-1.24633144)).abs() <= 1.0e-10)
  assert_true((box.west() - (156.204766357422)).abs() <= 1.0e-10)
  assert_true((box.north() - (-1.2463314)).abs() <= 1.0e-10)
  assert_true((box.east() - (156.204766479492)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:380" {
  let box = @geocodec.pluscode_bounds("8G2M0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8G2M0000+"), 4)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (33)).abs() <= 1.0e-10)
  assert_true((box.north() - (31)).abs() <= 1.0e-10)
  assert_true((box.east() - (34)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:381" {
  let box = @geocodec.pluscode_bounds("7VP2RWR5+VHXP7PH").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7VP2RWR5+VHXP7PH"), 15)
  assert_true((box.south() - (24.84224168)).abs() <= 1.0e-10)
  assert_true((box.west() - (160.908987670898)).abs() <= 1.0e-10)
  assert_true((box.north() - (24.84224172)).abs() <= 1.0e-10)
  assert_true((box.east() - (160.908987792969)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:382" {
  let box = @geocodec.pluscode_bounds("8RRWXQQ4+P54FCGQ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8RRWXQQ4+P54FCGQ"), 15)
  assert_true((box.south() - (46.98926252)).abs() <= 1.0e-10)
  assert_true((box.west() - (158.755446655273)).abs() <= 1.0e-10)
  assert_true((box.north() - (46.98926256)).abs() <= 1.0e-10)
  assert_true((box.east() - (158.755446777344)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:383" {
  let box = @geocodec.pluscode_bounds("6RP2JQGX+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6RP2JQGX+"), 8)
  assert_true((box.south() - (4.625)).abs() <= 1.0e-10)
  assert_true((box.west() - (140.7975)).abs() <= 1.0e-10)
  assert_true((box.north() - (4.6275)).abs() <= 1.0e-10)
  assert_true((box.east() - (140.8)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:384" {
  let box = @geocodec.pluscode_bounds("9PF4PXFP+RMH2MH").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9PF4PXFP+RMH2MH"), 14)
  assert_true((box.south() - (59.7245534)).abs() <= 1.0e-10)
  assert_true((box.west() - (102.986722167969)).abs() <= 1.0e-10)
  assert_true((box.north() - (59.7245536)).abs() <= 1.0e-10)
  assert_true((box.east() - (102.98672265625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:385" {
  let box = @geocodec.pluscode_bounds("3Q43M674+3C584GW").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3Q43M674+3C584GW"), 15)
  assert_true((box.south() - (-67.33736944)).abs() <= 1.0e-10)
  assert_true((box.west() - (121.206114501953)).abs() <= 1.0e-10)
  assert_true((box.north() - (-67.3373694)).abs() <= 1.0e-10)
  assert_true((box.east() - (121.206114624023)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:386" {
  let box = @geocodec.pluscode_bounds("2V3PX92G+8WM").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2V3PX92G+8WM"), 11)
  assert_true((box.south() - (-88.049175)).abs() <= 1.0e-10)
  assert_true((box.west() - (174.37728125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-88.04915)).abs() <= 1.0e-10)
  assert_true((box.east() - (174.3773125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:387" {
  let box = @geocodec.pluscode_bounds("6CVP8V5Q+MJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6CVP8V5Q+MJ"), 10)
  assert_true((box.south() - (7.309125)).abs() <= 1.0e-10)
  assert_true((box.west() - (-5.111)).abs() <= 1.0e-10)
  assert_true((box.north() - (7.30925)).abs() <= 1.0e-10)
  assert_true((box.east() - (-5.110875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:388" {
  let box = @geocodec.pluscode_bounds("2JPG0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2JPG0000+"), 4)
  assert_true((box.south() - (-76)).abs() <= 1.0e-10)
  assert_true((box.west() - (70)).abs() <= 1.0e-10)
  assert_true((box.north() - (-75)).abs() <= 1.0e-10)
  assert_true((box.east() - (71)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:389" {
  let box = @geocodec.pluscode_bounds("57R80000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("57R80000+"), 4)
  assert_true((box.south() - (-14)).abs() <= 1.0e-10)
  assert_true((box.west() - (-74)).abs() <= 1.0e-10)
  assert_true((box.north() - (-13)).abs() <= 1.0e-10)
  assert_true((box.east() - (-73)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:390" {
  let box = @geocodec.pluscode_bounds("6CGM0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6CGM0000+"), 4)
  assert_true((box.south() - (0)).abs() <= 1.0e-10)
  assert_true((box.west() - (-7)).abs() <= 1.0e-10)
  assert_true((box.north() - (1)).abs() <= 1.0e-10)
  assert_true((box.east() - (-6)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:391" {
  let box = @geocodec.pluscode_bounds("CP2V938H+2XGH22").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CP2V938H+2XGH22"), 14)
  assert_true((box.south() - (70.36506)).abs() <= 1.0e-10)
  assert_true((box.west() - (117.0799609375)).abs() <= 1.0e-10)
  assert_true((box.north() - (70.3650602)).abs() <= 1.0e-10)
  assert_true((box.east() - (117.079961425781)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:392" {
  let box = @geocodec.pluscode_bounds("CRGQ5J3M+46HF86").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CRGQ5J3M+46HF86"), 14)
  assert_true((box.south() - (80.1528112)).abs() <= 1.0e-10)
  assert_true((box.west() - (155.63310546875)).abs() <= 1.0e-10)
  assert_true((box.north() - (80.1528114)).abs() <= 1.0e-10)
  assert_true((box.east() - (155.633105957031)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:393" {
  let box = @geocodec.pluscode_bounds("88000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("88000000+"), 2)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (-60)).abs() <= 1.0e-10)
  assert_true((box.north() - (50)).abs() <= 1.0e-10)
  assert_true((box.east() - (-40)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:394" {
  let box = @geocodec.pluscode_bounds("45G82MCP+6WVRM3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("45G82MCP+6WVRM3"), 14)
  assert_true((box.south() - (-39.979377)).abs() <= 1.0e-10)
  assert_true((box.west() - (-113.312716308594)).abs() <= 1.0e-10)
  assert_true((box.north() - (-39.9793768)).abs() <= 1.0e-10)
  assert_true((box.east() - (-113.312715820313)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:395" {
  let box = @geocodec.pluscode_bounds("4H000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4H000000+"), 2)
  assert_true((box.south() - (-50)).abs() <= 1.0e-10)
  assert_true((box.west() - (40)).abs() <= 1.0e-10)
  assert_true((box.north() - (-30)).abs() <= 1.0e-10)
  assert_true((box.east() - (60)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:396" {
  let box = @geocodec.pluscode_bounds("854X64HF+4JCMM").unwrap()
  assert_eq(@geocodec.pluscode_code_length("854X64HF+4JCMM"), 13)
  assert_true((box.south() - (32.227818)).abs() <= 1.0e-10)
  assert_true((box.west() - (-100.875990234375)).abs() <= 1.0e-10)
  assert_true((box.north() - (32.227819)).abs() <= 1.0e-10)
  assert_true((box.east() - (-100.87598828125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:397" {
  let box = @geocodec.pluscode_bounds("87MR7XHQ+J94JF3").unwrap()
  assert_eq(@geocodec.pluscode_code_length("87MR7XHQ+J94JF3"), 14)
  assert_true((box.south() - (43.279017)).abs() <= 1.0e-10)
  assert_true((box.west() - (-63.011560058594)).abs() <= 1.0e-10)
  assert_true((box.north() - (43.2790172)).abs() <= 1.0e-10)
  assert_true((box.east() - (-63.011559570312)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:398" {
  let box = @geocodec.pluscode_bounds("7JP79F2P+C2XHWQ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7JP79F2P+C2XHWQ"), 14)
  assert_true((box.south() - (24.3511146)).abs() <= 1.0e-10)
  assert_true((box.west() - (65.485122558594)).abs() <= 1.0e-10)
  assert_true((box.north() - (24.3511148)).abs() <= 1.0e-10)
  assert_true((box.east() - (65.485123046875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:399" {
  let box = @geocodec.pluscode_bounds("C5000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C5000000+"), 2)
  assert_true((box.south() - (70)).abs() <= 1.0e-10)
  assert_true((box.west() - (-120)).abs() <= 1.0e-10)
  assert_true((box.north() - (90)).abs() <= 1.0e-10)
  assert_true((box.east() - (-100)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:400" {
  let box = @geocodec.pluscode_bounds("C8PHCQ22+258J").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C8PHCQ22+258J"), 12)
  assert_true((box.south() - (84.40004)).abs() <= 1.0e-10)
  assert_true((box.west() - (-48.2495625)).abs() <= 1.0e-10)
  assert_true((box.north() - (84.400045)).abs() <= 1.0e-10)
  assert_true((box.east() - (-48.2495546875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:401" {
  let box = @geocodec.pluscode_bounds("73M5XXQR+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("73M5XXQR+"), 8)
  assert_true((box.south() - (23.9875)).abs() <= 1.0e-10)
  assert_true((box.west() - (-156.01)).abs() <= 1.0e-10)
  assert_true((box.north() - (23.99)).abs() <= 1.0e-10)
  assert_true((box.east() - (-156.0075)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:402" {
  let box = @geocodec.pluscode_bounds("9MH2VCJJ+4962HP").unwrap()
  assert_eq(@geocodec.pluscode_code_length("9MH2VCJJ+4962HP"), 14)
  assert_true((box.south() - (61.8802776)).abs() <= 1.0e-10)
  assert_true((box.west() - (80.430881835937)).abs() <= 1.0e-10)
  assert_true((box.north() - (61.8802778)).abs() <= 1.0e-10)
  assert_true((box.east() - (80.430882324219)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:403" {
  let box = @geocodec.pluscode_bounds("885G56HP+JV7Q3G8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("885G56HP+JV7Q3G8"), 15)
  assert_true((box.south() - (33.17904044)).abs() <= 1.0e-10)
  assert_true((box.west() - (-49.762817138672)).abs() <= 1.0e-10)
  assert_true((box.north() - (33.17904048)).abs() <= 1.0e-10)
  assert_true((box.east() - (-49.762817016602)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:404" {
  let box = @geocodec.pluscode_bounds("4V6J3G4C+WWQ4X").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4V6J3G4C+WWQ4X"), 13)
  assert_true((box.south() - (-45.942671)).abs() <= 1.0e-10)
  assert_true((box.west() - (172.522365234375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-45.94267)).abs() <= 1.0e-10)
  assert_true((box.east() - (172.5223671875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:405" {
  let box = @geocodec.pluscode_bounds("6P000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6P000000+"), 2)
  assert_true((box.south() - (-10)).abs() <= 1.0e-10)
  assert_true((box.west() - (100)).abs() <= 1.0e-10)
  assert_true((box.north() - (10)).abs() <= 1.0e-10)
  assert_true((box.east() - (120)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:406" {
  let box = @geocodec.pluscode_bounds("8V5C5Q46+8QJ663M").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8V5C5Q46+8QJ663M"), 15)
  assert_true((box.south() - (33.15583112)).abs() <= 1.0e-10)
  assert_true((box.west() - (168.761875610352)).abs() <= 1.0e-10)
  assert_true((box.north() - (33.15583116)).abs() <= 1.0e-10)
  assert_true((box.east() - (168.761875732422)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:407" {
  let box = @geocodec.pluscode_bounds("6F3GP8Q7+44444F").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6F3GP8Q7+44444F"), 14)
  assert_true((box.south() - (-8.2622496)).abs() <= 1.0e-10)
  assert_true((box.west() - (10.312832519531)).abs() <= 1.0e-10)
  assert_true((box.north() - (-8.2622494)).abs() <= 1.0e-10)
  assert_true((box.east() - (10.312833007813)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:408" {
  let box = @geocodec.pluscode_bounds("872F29W5+MC2V93").unwrap()
  assert_eq(@geocodec.pluscode_code_length("872F29W5+MC2V93"), 14)
  assert_true((box.south() - (30.046646)).abs() <= 1.0e-10)
  assert_true((box.west() - (-70.641485839844)).abs() <= 1.0e-10)
  assert_true((box.north() - (30.0466462)).abs() <= 1.0e-10)
  assert_true((box.east() - (-70.641485351563)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:409" {
  let box = @geocodec.pluscode_bounds("2J3QMM2J+XV2F").unwrap()
  assert_eq(@geocodec.pluscode_code_length("2J3QMM2J+XV2F"), 12)
  assert_true((box.south() - (-88.347615)).abs() <= 1.0e-10)
  assert_true((box.west() - (75.6821328125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-88.34761)).abs() <= 1.0e-10)
  assert_true((box.east() - (75.682140625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:410" {
  let box = @geocodec.pluscode_bounds("76H58200+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("76H58200+"), 6)
  assert_true((box.south() - (21.3)).abs() <= 1.0e-10)
  assert_true((box.west() - (-97)).abs() <= 1.0e-10)
  assert_true((box.north() - (21.35)).abs() <= 1.0e-10)
  assert_true((box.east() - (-96.95)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:411" {
  let box = @geocodec.pluscode_bounds("97V5X669+44GC").unwrap()
  assert_eq(@geocodec.pluscode_code_length("97V5X669+44GC"), 12)
  assert_true((box.south() - (67.96031)).abs() <= 1.0e-10)
  assert_true((box.west() - (-76.7821875)).abs() <= 1.0e-10)
  assert_true((box.north() - (67.960315)).abs() <= 1.0e-10)
  assert_true((box.east() - (-76.7821796875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:412" {
  let box = @geocodec.pluscode_bounds("64W8RG5F+J98MC").unwrap()
  assert_eq(@geocodec.pluscode_code_length("64W8RG5F+J98MC"), 13)
  assert_true((box.south() - (8.809042)).abs() <= 1.0e-10)
  assert_true((box.west() - (-133.4765546875)).abs() <= 1.0e-10)
  assert_true((box.north() - (8.809043)).abs() <= 1.0e-10)
  assert_true((box.east() - (-133.476552734375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:413" {
  let box = @geocodec.pluscode_bounds("767WVW00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("767WVW00+"), 6)
  assert_true((box.south() - (15.85)).abs() <= 1.0e-10)
  assert_true((box.west() - (-81.1)).abs() <= 1.0e-10)
  assert_true((box.north() - (15.9)).abs() <= 1.0e-10)
  assert_true((box.east() - (-81.05)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:414" {
  let box = @geocodec.pluscode_bounds("3F2JXQ3H+FQ65").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3F2JXQ3H+FQ65"), 12)
  assert_true((box.south() - (-69.04635)).abs() <= 1.0e-10)
  assert_true((box.west() - (12.7793984375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-69.046345)).abs() <= 1.0e-10)
  assert_true((box.east() - (12.77940625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:415" {
  let box = @geocodec.pluscode_bounds("87CPXW9C+5895").unwrap()
  assert_eq(@geocodec.pluscode_code_length("87CPXW9C+5895"), 12)
  assert_true((box.south() - (38.9679)).abs() <= 1.0e-10)
  assert_true((box.west() - (-65.0791328125)).abs() <= 1.0e-10)
  assert_true((box.north() - (38.967905)).abs() <= 1.0e-10)
  assert_true((box.east() - (-65.079125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:416" {
  let box = @geocodec.pluscode_bounds("8RGJ79XQ+5C2HCG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8RGJ79XQ+5C2HCG"), 14)
  assert_true((box.south() - (40.2978874)).abs() <= 1.0e-10)
  assert_true((box.west() - (152.388524414062)).abs() <= 1.0e-10)
  assert_true((box.north() - (40.2978876)).abs() <= 1.0e-10)
  assert_true((box.east() - (152.388524902344)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:417" {
  let box = @geocodec.pluscode_bounds("97PPG9RF+C5Q8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("97PPG9RF+C5Q8"), 12)
  assert_true((box.south() - (64.54108)).abs() <= 1.0e-10)
  assert_true((box.west() - (-65.627015625)).abs() <= 1.0e-10)
  assert_true((box.north() - (64.541085)).abs() <= 1.0e-10)
  assert_true((box.east() - (-65.6270078125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:418" {
  let box = @geocodec.pluscode_bounds("485C9HQQ+MWGR78").unwrap()
  assert_eq(@geocodec.pluscode_code_length("485C9HQQ+MWGR78"), 14)
  assert_true((box.south() - (-46.6108038)).abs() <= 1.0e-10)
  assert_true((box.west() - (-51.410184570313)).abs() <= 1.0e-10)
  assert_true((box.north() - (-46.6108036)).abs() <= 1.0e-10)
  assert_true((box.east() - (-51.410184082031)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:419" {
  let box = @geocodec.pluscode_bounds("737C5CC2+HG7J73").unwrap()
  assert_eq(@geocodec.pluscode_code_length("737C5CC2+HG7J73"), 14)
  assert_true((box.south() - (15.171416)).abs() <= 1.0e-10)
  assert_true((box.west() - (-151.598716308594)).abs() <= 1.0e-10)
  assert_true((box.north() - (15.1714162)).abs() <= 1.0e-10)
  assert_true((box.east() - (-151.598715820312)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:420" {
  let box = @geocodec.pluscode_bounds("7V000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7V000000+"), 2)
  assert_true((box.south() - (10)).abs() <= 1.0e-10)
  assert_true((box.west() - (160)).abs() <= 1.0e-10)
  assert_true((box.north() - (30)).abs() <= 1.0e-10)
  assert_true((box.east() - (180)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:421" {
  let box = @geocodec.pluscode_bounds("85000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("85000000+"), 2)
  assert_true((box.south() - (30)).abs() <= 1.0e-10)
  assert_true((box.west() - (-120)).abs() <= 1.0e-10)
  assert_true((box.north() - (50)).abs() <= 1.0e-10)
  assert_true((box.east() - (-100)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:422" {
  let box = @geocodec.pluscode_bounds("CV4F0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CV4F0000+"), 4)
  assert_true((box.south() - (72)).abs() <= 1.0e-10)
  assert_true((box.west() - (169)).abs() <= 1.0e-10)
  assert_true((box.north() - (73)).abs() <= 1.0e-10)
  assert_true((box.east() - (170)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:423" {
  let box = @geocodec.pluscode_bounds("28Q34XH7+QF").unwrap()
  assert_eq(@geocodec.pluscode_code_length("28Q34XH7+QF"), 10)
  assert_true((box.south() - (-74.870625)).abs() <= 1.0e-10)
  assert_true((box.west() - (-58.036375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-74.8705)).abs() <= 1.0e-10)
  assert_true((box.east() - (-58.03625)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:424" {
  let box = @geocodec.pluscode_bounds("4FC2QP00+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4FC2QP00+"), 6)
  assert_true((box.south() - (-41.25)).abs() <= 1.0e-10)
  assert_true((box.west() - (0.7)).abs() <= 1.0e-10)
  assert_true((box.north() - (-41.2)).abs() <= 1.0e-10)
  assert_true((box.east() - (0.75)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:425" {
  let box = @geocodec.pluscode_bounds("6G3P79GC+73M568").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6G3P79GC+73M568"), 14)
  assert_true((box.south() - (-8.7242988)).abs() <= 1.0e-10)
  assert_true((box.west() - (34.370180664063)).abs() <= 1.0e-10)
  assert_true((box.north() - (-8.7242986)).abs() <= 1.0e-10)
  assert_true((box.east() - (34.370181152344)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:426" {
  let box = @geocodec.pluscode_bounds("7HGC9RX9+3CG23CV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("7HGC9RX9+3CG23CV"), 15)
  assert_true((box.south() - (20.39767556)).abs() <= 1.0e-10)
  assert_true((box.west() - (48.818564575195)).abs() <= 1.0e-10)
  assert_true((box.north() - (20.3976756)).abs() <= 1.0e-10)
  assert_true((box.east() - (48.818564697266)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:427" {
  let box = @geocodec.pluscode_bounds("856F0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("856F0000+"), 4)
  assert_true((box.south() - (34)).abs() <= 1.0e-10)
  assert_true((box.west() - (-111)).abs() <= 1.0e-10)
  assert_true((box.north() - (35)).abs() <= 1.0e-10)
  assert_true((box.east() - (-110)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:428" {
  let box = @geocodec.pluscode_bounds("59RJ97G4+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("59RJ97G4+"), 8)
  assert_true((box.south() - (-13.625)).abs() <= 1.0e-10)
  assert_true((box.west() - (-27.745)).abs() <= 1.0e-10)
  assert_true((box.north() - (-13.6225)).abs() <= 1.0e-10)
  assert_true((box.east() - (-27.7425)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:429" {
  let box = @geocodec.pluscode_bounds("C64G95F2+XHXJRFJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("C64G95F2+XHXJRFJ"), 15)
  assert_true((box.south() - (72.37499452)).abs() <= 1.0e-10)
  assert_true((box.west() - (-89.848530761719)).abs() <= 1.0e-10)
  assert_true((box.north() - (72.37499456)).abs() <= 1.0e-10)
  assert_true((box.east() - (-89.848530639648)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:430" {
  let box = @geocodec.pluscode_bounds("8V992XXC+CM7J8G8").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8V992XXC+CM7J8G8"), 15)
  assert_true((box.south() - (37.04854144)).abs() <= 1.0e-10)
  assert_true((box.west() - (167.971661376953)).abs() <= 1.0e-10)
  assert_true((box.north() - (37.04854148)).abs() <= 1.0e-10)
  assert_true((box.east() - (167.971661499023)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:431" {
  let box = @geocodec.pluscode_bounds("322FWPJQ+4WGQ43").unwrap()
  assert_eq(@geocodec.pluscode_code_length("322FWPJQ+4WGQ43"), 14)
  assert_true((box.south() - (-69.069685)).abs() <= 1.0e-10)
  assert_true((box.west() - (-170.260159667969)).abs() <= 1.0e-10)
  assert_true((box.north() - (-69.0696848)).abs() <= 1.0e-10)
  assert_true((box.east() - (-170.260159179687)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:432" {
  let box = @geocodec.pluscode_bounds("6MWRQCJ9+6F").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6MWRQCJ9+6F"), 10)
  assert_true((box.south() - (8.7805)).abs() <= 1.0e-10)
  assert_true((box.west() - (96.418625)).abs() <= 1.0e-10)
  assert_true((box.north() - (8.780625)).abs() <= 1.0e-10)
  assert_true((box.east() - (96.41875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:433" {
  let box = @geocodec.pluscode_bounds("6445QMQ9+R65").unwrap()
  assert_eq(@geocodec.pluscode_code_length("6445QMQ9+R65"), 11)
  assert_true((box.south() - (-7.2105)).abs() <= 1.0e-10)
  assert_true((box.west() - (-136.33190625)).abs() <= 1.0e-10)
  assert_true((box.north() - (-7.210475)).abs() <= 1.0e-10)
  assert_true((box.east() - (-136.331875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:434" {
  let box = @geocodec.pluscode_bounds("26000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("26000000+"), 2)
  assert_true((box.south() - (-90)).abs() <= 1.0e-10)
  assert_true((box.west() - (-100)).abs() <= 1.0e-10)
  assert_true((box.north() - (-70)).abs() <= 1.0e-10)
  assert_true((box.east() - (-80)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:435" {
  let box = @geocodec.pluscode_bounds("8V3X79PJ+5QGWFV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8V3X79PJ+5QGWFV"), 14)
  assert_true((box.south() - (31.2854478)).abs() <= 1.0e-10)
  assert_true((box.west() - (179.381955566406)).abs() <= 1.0e-10)
  assert_true((box.north() - (31.285448)).abs() <= 1.0e-10)
  assert_true((box.east() - (179.381956054687)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:436" {
  let box = @geocodec.pluscode_bounds("269H0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("269H0000+"), 4)
  assert_true((box.south() - (-83)).abs() <= 1.0e-10)
  assert_true((box.west() - (-89)).abs() <= 1.0e-10)
  assert_true((box.north() - (-82)).abs() <= 1.0e-10)
  assert_true((box.east() - (-88)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:437" {
  let box = @geocodec.pluscode_bounds("CGVVG387+QJH").unwrap()
  assert_eq(@geocodec.pluscode_code_length("CGVVG387+QJH"), 11)
  assert_true((box.south() - (87.516925)).abs() <= 1.0e-10)
  assert_true((box.west() - (37.06409375)).abs() <= 1.0e-10)
  assert_true((box.north() - (87.51695)).abs() <= 1.0e-10)
  assert_true((box.east() - (37.064125)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:438" {
  let box = @geocodec.pluscode_bounds("4G3QVFJ3+QVHG2GV").unwrap()
  assert_eq(@geocodec.pluscode_code_length("4G3QVFJ3+QVHG2GV"), 15)
  assert_true((box.south() - (-48.11806444)).abs() <= 1.0e-10)
  assert_true((box.west() - (35.454735473633)).abs() <= 1.0e-10)
  assert_true((box.north() - (-48.1180644)).abs() <= 1.0e-10)
  assert_true((box.east() - (35.454735595703)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:439" {
  let box = @geocodec.pluscode_bounds("733HC4Q5+WWR").unwrap()
  assert_eq(@geocodec.pluscode_code_length("733HC4Q5+WWR"), 11)
  assert_true((box.south() - (11.43985)).abs() <= 1.0e-10)
  assert_true((box.west() - (-148.89025)).abs() <= 1.0e-10)
  assert_true((box.north() - (11.439875)).abs() <= 1.0e-10)
  assert_true((box.east() - (-148.89021875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:440" {
  let box = @geocodec.pluscode_bounds("3G000000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3G000000+"), 2)
  assert_true((box.south() - (-70)).abs() <= 1.0e-10)
  assert_true((box.west() - (20)).abs() <= 1.0e-10)
  assert_true((box.north() - (-50)).abs() <= 1.0e-10)
  assert_true((box.east() - (40)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:441" {
  let box = @geocodec.pluscode_bounds("53R6WJC7+H362").unwrap()
  assert_eq(@geocodec.pluscode_code_length("53R6WJC7+H362"), 12)
  assert_true((box.south() - (-13.0786)).abs() <= 1.0e-10)
  assert_true((box.west() - (-155.387375)).abs() <= 1.0e-10)
  assert_true((box.north() - (-13.078595)).abs() <= 1.0e-10)
  assert_true((box.east() - (-155.3873671875)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:442" {
  let box = @geocodec.pluscode_bounds("5P5V54JH+6WWC6MJ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("5P5V54JH+6WWC6MJ"), 15)
  assert_true((box.south() - (-26.81938828)).abs() <= 1.0e-10)
  assert_true((box.west() - (117.129812988281)).abs() <= 1.0e-10)
  assert_true((box.north() - (-26.81938824)).abs() <= 1.0e-10)
  assert_true((box.east() - (117.129813110352)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:443" {
  let box = @geocodec.pluscode_bounds("8MRVWQV6+FG").unwrap()
  assert_eq(@geocodec.pluscode_code_length("8MRVWQV6+FG"), 10)
  assert_true((box.south() - (46.943625)).abs() <= 1.0e-10)
  assert_true((box.west() - (97.76125)).abs() <= 1.0e-10)
  assert_true((box.north() - (46.94375)).abs() <= 1.0e-10)
  assert_true((box.east() - (97.761375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:444" {
  let box = @geocodec.pluscode_bounds("3Q86J233+323PP").unwrap()
  assert_eq(@geocodec.pluscode_code_length("3Q86J233+323PP"), 13)
  assert_true((box.south() - (-63.397357)).abs() <= 1.0e-10)
  assert_true((box.west() - (124.00255078125)).abs() <= 1.0e-10)
  assert_true((box.north() - (-63.397356)).abs() <= 1.0e-10)
  assert_true((box.east() - (124.002552734375)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:445" {
  let box = @geocodec.pluscode_bounds("969X6MMM+HQ").unwrap()
  assert_eq(@geocodec.pluscode_code_length("969X6MMM+HQ"), 10)
  assert_true((box.south() - (57.233875)).abs() <= 1.0e-10)
  assert_true((box.west() - (-80.315625)).abs() <= 1.0e-10)
  assert_true((box.north() - (57.234)).abs() <= 1.0e-10)
  assert_true((box.east() - (-80.3155)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:446" {
  let box = @geocodec.pluscode_bounds("98WQ0000+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("98WQ0000+"), 4)
  assert_true((box.south() - (68)).abs() <= 1.0e-10)
  assert_true((box.west() - (-45)).abs() <= 1.0e-10)
  assert_true((box.north() - (69)).abs() <= 1.0e-10)
  assert_true((box.east() - (-44)).abs() <= 1.0e-10)
}

///|
test "official OLC decoding.csv:447" {
  let box = @geocodec.pluscode_bounds("93G66JCP+").unwrap()
  assert_eq(@geocodec.pluscode_code_length("93G66JCP+"), 8)
  assert_true((box.south() - (60.22)).abs() <= 1.0e-10)
  assert_true((box.west() - (-155.365)).abs() <= 1.0e-10)
  assert_true((box.north() - (60.2225)).abs() <= 1.0e-10)
  assert_true((box.east() - (-155.3625)).abs() <= 1.0e-10)
}

///|
test "official OLC validityTests.csv:12" {
  assert_eq(@geocodec.pluscode_is_valid("8FWC2345+G6"), true)
  assert_eq(@geocodec.pluscode_is_short("8FWC2345+G6"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWC2345+G6"), true)
}

///|
test "official OLC validityTests.csv:13" {
  assert_eq(@geocodec.pluscode_is_valid("8FWC2345+G6G"), true)
  assert_eq(@geocodec.pluscode_is_short("8FWC2345+G6G"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWC2345+G6G"), true)
}

///|
test "official OLC validityTests.csv:14" {
  assert_eq(@geocodec.pluscode_is_valid("8fwc2345+"), true)
  assert_eq(@geocodec.pluscode_is_short("8fwc2345+"), false)
  assert_eq(@geocodec.pluscode_is_full("8fwc2345+"), true)
}

///|
test "official OLC validityTests.csv:15" {
  assert_eq(@geocodec.pluscode_is_valid("8FWCX400+"), true)
  assert_eq(@geocodec.pluscode_is_short("8FWCX400+"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWCX400+"), true)
}

///|
test "official OLC validityTests.csv:16" {
  assert_eq(@geocodec.pluscode_is_valid("84000000+"), true)
  assert_eq(@geocodec.pluscode_is_short("84000000+"), false)
  assert_eq(@geocodec.pluscode_is_full("84000000+"), true)
}

///|
test "official OLC validityTests.csv:22" {
  assert_eq(@geocodec.pluscode_is_valid("WC2345+G6g"), true)
  assert_eq(@geocodec.pluscode_is_short("WC2345+G6g"), true)
  assert_eq(@geocodec.pluscode_is_full("WC2345+G6g"), false)
}

///|
test "official OLC validityTests.csv:23" {
  assert_eq(@geocodec.pluscode_is_valid("2345+G6"), true)
  assert_eq(@geocodec.pluscode_is_short("2345+G6"), true)
  assert_eq(@geocodec.pluscode_is_full("2345+G6"), false)
}

///|
test "official OLC validityTests.csv:24" {
  assert_eq(@geocodec.pluscode_is_valid("45+G6"), true)
  assert_eq(@geocodec.pluscode_is_short("45+G6"), true)
  assert_eq(@geocodec.pluscode_is_full("45+G6"), false)
}

///|
test "official OLC validityTests.csv:25" {
  assert_eq(@geocodec.pluscode_is_valid("+G6"), true)
  assert_eq(@geocodec.pluscode_is_short("+G6"), true)
  assert_eq(@geocodec.pluscode_is_full("+G6"), false)
}

///|
test "official OLC validityTests.csv:31" {
  assert_eq(@geocodec.pluscode_is_valid("G+"), false)
  assert_eq(@geocodec.pluscode_is_short("G+"), false)
  assert_eq(@geocodec.pluscode_is_full("G+"), false)
}

///|
test "official OLC validityTests.csv:32" {
  assert_eq(@geocodec.pluscode_is_valid("+"), false)
  assert_eq(@geocodec.pluscode_is_short("+"), false)
  assert_eq(@geocodec.pluscode_is_full("+"), false)
}

///|
test "official OLC validityTests.csv:33" {
  assert_eq(@geocodec.pluscode_is_valid("8FWC2345+G"), false)
  assert_eq(@geocodec.pluscode_is_short("8FWC2345+G"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWC2345+G"), false)
}

///|
test "official OLC validityTests.csv:34" {
  assert_eq(@geocodec.pluscode_is_valid("8FWC2_45+G6"), false)
  assert_eq(@geocodec.pluscode_is_short("8FWC2_45+G6"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWC2_45+G6"), false)
}

///|
test "official OLC validityTests.csv:35" {
  assert_eq(@geocodec.pluscode_is_valid("8FWC2η45+G6"), false)
  assert_eq(@geocodec.pluscode_is_short("8FWC2η45+G6"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWC2η45+G6"), false)
}

///|
test "official OLC validityTests.csv:36" {
  assert_eq(@geocodec.pluscode_is_valid("8FWC2345+G6+"), false)
  assert_eq(@geocodec.pluscode_is_short("8FWC2345+G6+"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWC2345+G6+"), false)
}

///|
test "official OLC validityTests.csv:37" {
  assert_eq(@geocodec.pluscode_is_valid("8FWC2345G6+"), false)
  assert_eq(@geocodec.pluscode_is_short("8FWC2345G6+"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWC2345G6+"), false)
}

///|
test "official OLC validityTests.csv:38" {
  assert_eq(@geocodec.pluscode_is_valid("8FWC2300+G6"), false)
  assert_eq(@geocodec.pluscode_is_short("8FWC2300+G6"), false)
  assert_eq(@geocodec.pluscode_is_full("8FWC2300+G6"), false)
}

///|
test "official OLC validityTests.csv:39" {
  assert_eq(@geocodec.pluscode_is_valid("WC2300+G6g"), false)
  assert_eq(@geocodec.pluscode_is_short("WC2300+G6g"), false)
  assert_eq(@geocodec.pluscode_is_full("WC2300+G6g"), false)
}

///|
test "official OLC validityTests.csv:40" {
  assert_eq(@geocodec.pluscode_is_valid("WC2345+G"), false)
  assert_eq(@geocodec.pluscode_is_short("WC2345+G"), false)
  assert_eq(@geocodec.pluscode_is_full("WC2345+G"), false)
}

///|
test "official OLC validityTests.csv:41" {
  assert_eq(@geocodec.pluscode_is_valid("WC2300+"), false)
  assert_eq(@geocodec.pluscode_is_short("WC2300+"), false)
  assert_eq(@geocodec.pluscode_is_full("WC2300+"), false)
}

///|
test "official OLC validityTests.csv:42" {
  assert_eq(@geocodec.pluscode_is_valid("84900000+"), false)
  assert_eq(@geocodec.pluscode_is_short("84900000+"), false)
  assert_eq(@geocodec.pluscode_is_full("84900000+"), false)
}

///|
test "official OLC validityTests.csv:49" {
  assert_eq(@geocodec.pluscode_is_valid("849VGJQF+VX7QR3J"), true)
  assert_eq(@geocodec.pluscode_is_short("849VGJQF+VX7QR3J"), false)
  assert_eq(@geocodec.pluscode_is_full("849VGJQF+VX7QR3J"), true)
}

///|
test "official OLC validityTests.csv:50" {
  assert_eq(@geocodec.pluscode_is_valid("849VGJQF+VX7QR3U"), false)
  assert_eq(@geocodec.pluscode_is_short("849VGJQF+VX7QR3U"), false)
  assert_eq(@geocodec.pluscode_is_full("849VGJQF+VX7QR3U"), false)
}

///|
test "official OLC validityTests.csv:51" {
  assert_eq(@geocodec.pluscode_is_valid("849VGJQF+VX7QR3JW"), true)
  assert_eq(@geocodec.pluscode_is_short("849VGJQF+VX7QR3JW"), false)
  assert_eq(@geocodec.pluscode_is_full("849VGJQF+VX7QR3JW"), true)
}

///|
test "official OLC validityTests.csv:52" {
  assert_eq(@geocodec.pluscode_is_valid("849VGJQF+VX7QR3JU"), false)
  assert_eq(@geocodec.pluscode_is_short("849VGJQF+VX7QR3JU"), false)
  assert_eq(@geocodec.pluscode_is_full("849VGJQF+VX7QR3JU"), false)
}

///|
test "official OLC shortCodeTests.csv:6" {
  let reference = @geocodec.LatLng::new(51.3701125, -1.217765625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("+2VX"))
  assert_eq(@geocodec.pluscode_recover("+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:8" {
  let reference = @geocodec.LatLng::new(51.3708675, -1.217765625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("CJ+2VX"))
  assert_eq(@geocodec.pluscode_recover("CJ+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:9" {
  let reference = @geocodec.LatLng::new(51.3693575, -1.217765625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("CJ+2VX"))
  assert_eq(@geocodec.pluscode_recover("CJ+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:10" {
  let reference = @geocodec.LatLng::new(51.3701125, -1.218520625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("CJ+2VX"))
  assert_eq(@geocodec.pluscode_recover("CJ+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:11" {
  let reference = @geocodec.LatLng::new(51.3701125, -1.217010625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("CJ+2VX"))
  assert_eq(@geocodec.pluscode_recover("CJ+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:13" {
  let reference = @geocodec.LatLng::new(51.3852125, -1.217765625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("9QCJ+2VX"))
  assert_eq(@geocodec.pluscode_recover("9QCJ+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:14" {
  let reference = @geocodec.LatLng::new(51.3550125, -1.217765625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("9QCJ+2VX"))
  assert_eq(@geocodec.pluscode_recover("9QCJ+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:15" {
  let reference = @geocodec.LatLng::new(51.3701125, -1.232865625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("9QCJ+2VX"))
  assert_eq(@geocodec.pluscode_recover("9QCJ+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:16" {
  let reference = @geocodec.LatLng::new(51.3701125, -1.202665625).unwrap()
  assert_eq(@geocodec.pluscode_shorten("9C3W9QCJ+2VX", reference), Some("9QCJ+2VX"))
  assert_eq(@geocodec.pluscode_recover("9QCJ+2VX", reference), Some("9C3W9QCJ+2VX"))
}

///|
test "official OLC shortCodeTests.csv:18" {
  let reference = @geocodec.LatLng::new(42.899, 9.012).unwrap()
  assert_eq(@geocodec.pluscode_shorten("8FJFW222+", reference), Some("22+"))
  assert_eq(@geocodec.pluscode_recover("22+", reference), Some("8FJFW222+"))
}

///|
test "official OLC shortCodeTests.csv:19" {
  let reference = @geocodec.LatLng::new(14.95125, -23.5001).unwrap()
  assert_eq(@geocodec.pluscode_shorten("796RXG22+", reference), Some("22+"))
  assert_eq(@geocodec.pluscode_recover("22+", reference), Some("796RXG22+"))
}

///|
test "official OLC shortCodeTests.csv:21" {
  let reference = @geocodec.LatLng::new(46.976, 8.526).unwrap()
  assert_eq(@geocodec.pluscode_shorten("8FVC2GGG+GG", reference), Some("2GGG+GG"))
  assert_eq(@geocodec.pluscode_recover("2GGG+GG", reference), Some("8FVC2GGG+GG"))
}

///|
test "official OLC shortCodeTests.csv:23" {
  let reference = @geocodec.LatLng::new(47.026, 8.526).unwrap()
  assert_eq(@geocodec.pluscode_shorten("8FRCXGGG+GG", reference), Some("XGGG+GG"))
  assert_eq(@geocodec.pluscode_recover("XGGG+GG", reference), Some("8FRCXGGG+GG"))
}

///|
test "official OLC shortCodeTests.csv:25" {
  let reference = @geocodec.LatLng::new(46.526, 8.026).unwrap()
  assert_eq(@geocodec.pluscode_shorten("8FR9GXGG+GG", reference), Some("GXGG+GG"))
  assert_eq(@geocodec.pluscode_recover("GXGG+GG", reference), Some("8FR9GXGG+GG"))
}

///|
test "official OLC shortCodeTests.csv:27" {
  let reference = @geocodec.LatLng::new(46.526, 7.976).unwrap()
  assert_eq(@geocodec.pluscode_shorten("8FRCG2GG+GG", reference), Some("G2GG+GG"))
  assert_eq(@geocodec.pluscode_recover("G2GG+GG", reference), Some("8FRCG2GG+GG"))
}

///|
test "official OLC shortCodeTests.csv:30" {
  let reference = @geocodec.LatLng::new(89.6, 0).unwrap()
  assert_eq(@geocodec.pluscode_recover("2222+22", reference), Some("CFX22222+22"))
}

///|
test "official OLC shortCodeTests.csv:31" {
  let reference = @geocodec.LatLng::new(-81, 0).unwrap()
  assert_eq(@geocodec.pluscode_recover("XXXXXX+XX", reference), Some("2CXXXXXX+XX"))
}

///|
test "official OLC shortCodeTests.csv:33" {
  let reference = @geocodec.LatLng::new(46.526, 7.976).unwrap()
  assert_eq(@geocodec.pluscode_recover("8FRCG2GG+GG", reference), Some("8FRCG2GG+GG"))
}

///|
test "official OLC shortCodeTests.csv:35" {
  let reference = @geocodec.LatLng::new(46.526, 7.976).unwrap()
  assert_eq(@geocodec.pluscode_recover("8frCG2GG+gG", reference), Some("8FRCG2GG+GG"))
}
