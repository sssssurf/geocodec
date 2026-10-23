// A permissive front door: one string in, one point and the notation it used
// out. This is what the CLI's `parse` and `scan` commands expose.

///|
/// The notation a coordinate string was written in.
pub(all) enum LocationFormat {
  GeoUri
  PlusCode
  Maidenhead
  GeoHash
  Decimal
  Dms
} derive(Eq)

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
/// A point plus the notation it was recognised in.
pub(all) struct ParsedLocation {
  format : LocationFormat
  point : LatLng
} derive(Eq)

///|
/// Recognise one coordinate written as a geo URI, Plus Code, Maidenhead
/// locator, geohash, decimal pair or DMS pair.
pub fn parse_location(input : String) -> ParsedLocation? {
  let s = trim_ascii(input)
  if s == "" {
    return None
  }
  if s.length() >= 4 && ascii_lower(s[0:4].to_owned()) == "geo:" {
    match geouri_parse(s) {
      Some(uri) => return Some({ format: GeoUri, point: uri.point })
      None => return None
    }
  }
  if s.contains("+") {
    match pluscode_decode(s) {
      Some(p) => return Some({ format: PlusCode, point: p })
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
        Some(p) => return Some({ format: Decimal, point: p })
        None => ()
      }
    }
    let lat_dms = parse_dms(comma[0], true)
    let lng_dms = parse_dms(comma[1], false)
    if lat_dms is Some(a) && lng_dms is Some(b) {
      match LatLng::new(a, b) {
        Some(p) => return Some({ format: Dms, point: p })
        None => ()
      }
    }
  }
  if fields.length() == 2 {
    let lat = parse_decimal(fields[0])
    let lng = parse_decimal(fields[1])
    if lat is Some(a) && lng is Some(b) {
      match LatLng::new(a, b) {
        Some(p) => return Some({ format: Decimal, point: p })
        None => ()
      }
    }
    let lat_dms = parse_dms(fields[0], true)
    let lng_dms = parse_dms(fields[1], false)
    if lat_dms is Some(a) && lng_dms is Some(b) {
      match LatLng::new(a, b) {
        Some(p) => return Some({ format: Dms, point: p })
        None => ()
      }
    }
  }
  match maidenhead_decode(s) {
    Some(p) => return Some({ format: Maidenhead, point: p })
    None => ()
  }
  match geohash_decode(s) {
    Some(p) => return Some({ format: GeoHash, point: p })
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
  max_results? : Int = 100,
) -> Array[ParsedLocation] {
  let limit = if max_results < 1 { 1 } else { max_results }
  let out : Array[ParsedLocation] = []
  let seen : Array[String] = []
  for raw in split_whitespace(text) {
    if out.length() >= limit {
      break
    }
    let token = strip_code_punctuation(raw)
    if token == "" {
      continue
    }
    // Short English words such as "meet" and "send" are legal geohash strings.
    // In free text, require a digit before treating a token as a code; every
    // real code in these notations contains one.
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
fn index_of_string(values : Array[String], needle : String) -> Int {
  let mut i = 0
  while i < values.length() {
    if values[i] == needle {
      return i
    }
    i = i + 1
  }
  -1
}
