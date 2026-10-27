// A permissive front door: one string in, one `Location` out. The result keeps
// the notation, the representative point, the region, the resolution and any
// explicit uncertainty, so callers can see what a conversion would lose.

///|
/// The notation a coordinate string was written in.
pub(all) enum LocationFormat {
  GeoUri
  PlusCode
  Maidenhead
  GeoHash
  Decimal
  Dms
} derive(Eq, Debug)

///|
pub impl Show for LocationFormat with fn to_string(self : LocationFormat) -> String {
  match self {
    GeoUri => "geo-uri"
    PlusCode => "plus-code"
    Maidenhead => "maidenhead"
    GeoHash => "geohash"
    Decimal => "decimal"
    Dms => "dms"
  }
}

///|
/// Recognise one coordinate written as a geo URI, Plus Code, Maidenhead
/// locator, geohash, decimal pair or DMS pair.
pub fn parse_location(input : String) -> Location? {
  let s = trim_ascii(input)
  if s == "" {
    return None
  }
  if s.length() >= 4 && ascii_lower(s[0:4].to_owned()) == "geo:" {
    match geouri_parse(s) {
      Some(uri) => {
        match uri.crs {
          Some(crs) if ascii_lower(crs) != "wgs84" => return None
          _ => ()
        }
        return point_location(
          GeoUri,
          s,
          uri.point,
          uri.altitude,
          uri.crs,
          uri.uncertainty,
        )
      }
      None => return None
    }
  }
  if s.contains("+") {
    match pluscode_bounds(s) {
      Some(b) => return cell_location(PlusCode, s, b)
      None => ()
    }
  }
  let fields = split_whitespace(s)
  let comma = split_text(s, ',')
  if comma.length() == 2 {
    let lat = parse_decimal(comma[0])
    let lng = parse_decimal(comma[1])
    if lat is Some(a) && lng is Some(b) {
      match LatLng::new(a, b) {
        Some(p) => return point_location(Decimal, s, p, None, None, None)
        None => ()
      }
    }
    let lat_dms = parse_dms(comma[0], true)
    let lng_dms = parse_dms(comma[1], false)
    if lat_dms is Some(a) && lng_dms is Some(b) {
      match LatLng::new(a, b) {
        Some(p) => return point_location(Dms, s, p, None, None, None)
        None => ()
      }
    }
  }
  if fields.length() == 2 {
    let lat = parse_decimal(fields[0])
    let lng = parse_decimal(fields[1])
    if lat is Some(a) && lng is Some(b) {
      match LatLng::new(a, b) {
        Some(p) => return point_location(Decimal, s, p, None, None, None)
        None => ()
      }
    }
    let lat_dms = parse_dms(fields[0], true)
    let lng_dms = parse_dms(fields[1], false)
    if lat_dms is Some(a) && lng_dms is Some(b) {
      match LatLng::new(a, b) {
        Some(p) => return point_location(Dms, s, p, None, None, None)
        None => ()
      }
    }
  }
  match maidenhead_bounds(s) {
    Some(b) => return cell_location(Maidenhead, s, b)
    None => ()
  }
  match geohash_bounds(s) {
    Some(b) => return cell_location(GeoHash, s, b)
    None => ()
  }
  None
}

///|
/// Scan free text for up to `max_results` location codes. Tokens are split on
/// whitespace and common surrounding punctuation is removed before each token
/// is offered to `parse_location`. This is deliberately conservative: a token
/// that is not a complete code is ignored, and a result already seen at the
/// same format and point is not repeated.
pub fn parse_codes(
  text : String,
  max_results~ : Int32 = 100,
) -> Array[Location] {
  let limit = if max_results < 1 { 1 } else { max_results }
  let out : Array[Location] = []
  let seen : Array[String] = []
  for raw in split_whitespace(text) {
    if out.length() >= limit {
      break
    }
    let token = strip_code_punctuation(raw)
    if token == "" {
      continue
    }
    // Short English words such as "meet" and "send" are legal geohash strings,
    // and a bare number such as "12345" can also decode as one. In free text,
    // require both a digit and a letter before treating a token as a geohash.
    if !has_digit(token) && !token.contains("+") {
      continue
    }
    match parse_location(token) {
      None => ()
      Some(found) => {
        if found.format == GeoHash && (token.length() < 5 || !has_letter(token)) {
          continue
        }
        let key = found.format.name() +
          "|" +
          found.point.lat().to_string() +
          "|" +
          found.point.lng().to_string()
        if index_of_string(seen, key) < 0 {
          seen.push(key)
          out.push(found)
        }
      }
    }
  }
  out
}

///|
/// Remove punctuation that commonly wraps a code in prose (`(`, `,`, `.`,
/// quotes) without touching the characters inside it.
fn strip_code_punctuation(text : String) -> String {
  let chars = chars_of(text)
  let mut start = 0
  let mut end = chars.length()
  while start < end && is_code_punctuation(chars[start]) {
    start = start + 1
  }
  while end > start && is_code_punctuation(chars[end - 1]) {
    end = end - 1
  }
  let out : Array[Char] = []
  for i = start; i < end; i = i + 1 {
    out.push(chars[i])
  }
  string_of(out)
}

///|
fn has_digit(text : String) -> Bool {
  for ch in text {
    if ch >= '0' && ch <= '9' {
      return true
    }
  }
  false
}

///|
fn has_letter(text : String) -> Bool {
  for ch in text {
    if (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') {
      return true
    }
  }
  false
}

///|
fn is_code_punctuation(c : Char) -> Bool {
  c == ',' ||
  c == ';' ||
  c == ':' ||
  c == '!' ||
  c == '?' ||
  c == '(' ||
  c == ')' ||
  c == '[' ||
  c == ']' ||
  c == '{' ||
  c == '}' ||
  c == '<' ||
  c == '>' ||
  c == '"' ||
  c == '\'' ||
  c == '.'
}

///|
fn index_of_string(values : Array[String], needle : String) -> Int32 {
  let mut i = 0
  while i < values.length() {
    if values[i] == needle {
      return i
    }
    i = i + 1
  }
  -1
}

///|
pub extend LocationFormat with Eq::{not_equal, equal}

///|
pub extend LocationFormat with @moonbitlang/core/debug.Debug::{to_repr}

///|
pub extend LocationFormat with Show::{output, to_string}
