// Shared numeric helpers: longitudes, latitudes and fixed-point formatting.
// Everything here is total: no input can make these functions panic, and
// non-finite inputs are rejected by the callers that need a value.

///|
/// Degrees to radians.
pub fn to_radians(degrees : Double) -> Double {
  degrees * 0.017453292519943295
}

///|
/// Normalise a longitude into `[-180, 180)`. Non-finite values are returned
/// unchanged so callers can test them.
pub fn normalize_lng(lng : Double) -> Double {
  if lng.is_nan() || lng.is_inf() {
    return lng
  }
  let mut x = lng
  while x < -180.0 {
    x = x + 360.0
  }
  while x >= 180.0 {
    x = x - 360.0
  }
  x
}

///|
/// The signed shortest difference `b - a` between two longitudes, in degrees.
pub fn lng_delta(a : Double, b : Double) -> Double {
  normalize_lng(b - a)
}

///|
/// Clamp a latitude into `[-90, 90]`. Non-finite values are returned unchanged.
pub fn clamp_lat(lat : Double) -> Double {
  if lat.is_nan() {
    lat
  } else if lat < -90.0 {
    -90.0
  } else if lat > 90.0 {
    90.0
  } else {
    lat
  }
}

///|
/// True when a double is finite (not NaN, not infinite).
pub fn is_finite(x : Double) -> Bool {
  !(x.is_nan() || x.is_inf())
}

///|
/// Round `x` to `digits` decimal places, half away from zero.
pub fn round_to(x : Double, digits : Int) -> Double {
  let scale = pow10(digits)
  if x >= 0.0 {
    (x * scale + 0.5).floor() / scale
  } else {
    (x * scale - 0.5).ceil() / scale
  }
}

///|
/// `10.0 ^ n` for a small non-negative `n`.
fn pow10(n : Int) -> Double {
  let mut p = 1.0
  for _ in 0..<n {
    p = p * 10.0
  }
  p
}

///|
/// `10L ^ n` for a small non-negative `n`.
fn pow10_i64(n : Int) -> Int64 {
  let mut p = 1L
  for _ in 0..<n {
    p = p * 10L
  }
  p
}

///|
/// Format a double with exactly `digits` digits after the decimal point.
/// Values are rounded half away from zero. Used by the CLI and the docs so
/// that recorded output is stable.
pub fn format_fixed(x : Double, digits : Int) -> String {
  if x.is_nan() {
    return "nan"
  }
  if x.is_inf() {
    if x > 0.0 {
      return "inf"
    }
    return "-inf"
  }
  let d = if digits < 0 { 0 } else if digits > 9 { 9 } else { digits }
  let scale = pow10_i64(d).to_double()
  let scaled = x * scale
  let rounded : Int64 = if scaled >= 0.0 {
    (scaled + 0.5).floor().to_int64()
  } else {
    (scaled - 0.5).ceil().to_int64()
  }
  let negative = rounded < 0L
  let magnitude = if negative { -rounded } else { rounded }
  let raw = magnitude.to_string()
  let padded = if d == 0 {
    raw
  } else if raw.length() <= d {
    "0".repeat(d - raw.length() + 1) + raw
  } else {
    raw
  }
  let body = if d == 0 {
    padded
  } else {
    let cut = padded.length() - d
    padded[0:cut].to_owned() + "." + padded[cut:].to_owned()
  }
  if negative && magnitude != 0L {
    "-" + body
  } else {
    body
  }
}

///|
/// Format a latitude/longitude pair as `lat, lng`.
pub fn format_latlng(lat : Double, lng : Double, digits : Int) -> String {
  format_fixed(lat, digits) + ", " + format_fixed(lng, digits)
}

///|
/// A degree symbol, quoted so the source stays ASCII-only.
pub const DEGREE : String = "\u{00B0}"

///|
/// A prime (minutes) symbol.
pub const PRIME : String = "\u{2032}"

///|
/// A double prime (seconds) symbol.
pub const DOUBLE_PRIME : String = "\u{2033}"

///|
/// Two-letter hemisphere suffix for a coordinate value.
pub fn hemisphere_suffix(value : Double, is_lat : Bool) -> String {
  if is_lat {
    if value < 0.0 {
      "S"
    } else {
      "N"
    }
  } else if value < 0.0 {
    "W"
  } else {
    "E"
  }
}
