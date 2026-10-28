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
  let mut x = lng % 360.0
  if x < -180.0 {
    x = x + 360.0
  }
  if x >= 180.0 {
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
/// Lossless Double text without an exponent, for RFC 5870 and JSON consumers.
/// Fixed decimal rounding must not turn a tiny positive uncertainty into zero.
pub fn decimal_notation(value : Double) -> String {
  let text = ascii_lower(value.to_string())
  let parts = split_text(text, 'e')
  if parts.length() != 2 {
    return text
  }
  let exponent = parse_decimal(parts[1]).unwrap().to_int()
  let negative = parts[0][0] == '-'
  let mantissa = if negative { parts[0][1:].to_owned() } else { parts[0] }
  let digits = split_text(mantissa, '.')
  let tail = if digits.length() == 2 { digits[1] } else { "" }
  let all = digits[0] + tail
  let place = digits[0].length() + exponent
  let expanded = if place <= 0 {
    "0." + "0".repeat(-place) + all
  } else if place >= all.length() {
    all + "0".repeat(place - all.length())
  } else {
    all[0:place].to_owned() + "." + all[place:].to_owned()
  }
  if negative {
    "-" + expanded
  } else {
    expanded
  }
}

///|
/// Round `x` to `digits` decimal places, half away from zero.
pub fn round_to(x : Double, digits : Int32) -> Double {
  let scale = pow10(digits)
  if x >= 0.0 {
    (x * scale + 0.5).floor() / scale
  } else {
    (x * scale - 0.5).ceil() / scale
  }
}

///|
/// `10.0 ^ n` for a small non-negative `n`.
fn pow10(n : Int32) -> Double {
  let mut p = 1.0
  for _ in 0..<n {
    p = p * 10.0
  }
  p
}

///|
/// `10L ^ n` for a small non-negative `n`.
fn pow10_i64(n : Int32) -> Int64 {
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
pub fn format_fixed(x : Double, digits : Int32) -> String {
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
pub fn format_latlng(lat : Double, lng : Double, digits : Int32) -> String {
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
