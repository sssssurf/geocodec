// RFC 5870 `geo:` URIs: a latitude, longitude and optional altitude, plus
// optional uncertainty and coordinate reference system parameters.

///|
/// A validated WGS84 `geo:` URI. Unsupported CRSs are rejected before a
/// coordinate can escape as LatLng. Readonly outside the defining package.
pub struct GeoUri {
  point : LatLng
  altitude : Double?
  uncertainty : Double?
  crs : String?
  raw : String
} derive(Eq)

///|
/// Parse a `geo:` URI. Returns `None` for a bad prefix, a coordinate outside
/// its range, a malformed number/parameter, or an unsupported CRS.
pub fn geouri_parse(input : String) -> GeoUri? {
  let s = trim_ascii(input)
  if s.length() < 5 || ascii_lower(s[0:4].to_owned()) != "geo:" {
    return None
  }
  let body = s[4:].to_owned()
  let sections = split_text(body, ';')
  if sections.length() == 0 {
    return None
  }
  let coords = split_text(sections[0], ',')
  if coords.length() < 2 || coords.length() > 3 {
    return None
  }
  let lat = match parse_decimal(coords[0]) {
    None => return None
    Some(v) => v
  }
  let lng = match parse_decimal(coords[1]) {
    None => return None
    Some(v) => v
  }
  if !geo_number(coords[0], true) ||
    !geo_number(coords[1], true) ||
    lng < -180.0 ||
    lng > 180.0 {
    return None
  }
  let point = match LatLng::new(lat, lng) {
    None => return None
    Some(p) => p
  }
  let mut altitude : Double? = None
  if coords.length() == 3 {
    if !geo_number(coords[2], true) {
      return None
    }
    match parse_decimal(coords[2]) {
      None => return None
      Some(v) => {
        if !is_finite(v) {
          return None
        }
        altitude = Some(v)
      }
    }
  }
  let mut uncertainty : Double? = None
  let mut crs : String? = None
  let mut extensions = false
  for i = 1; i < sections.length(); i = i + 1 {
    let section = sections[i]
    if section == "" {
      return None
    }
    let kv = split_text(section, '=')
    if !geo_label(kv[0]) || kv.length() > 2 {
      return None
    }
    if kv.length() == 2 {
      let key = ascii_lower(kv[0])
      let value = kv[1]
      if key == "u" {
        if extensions || uncertainty is Some(_) || !geo_number(value, false) {
          return None
        }
        match parse_decimal(value) {
          None => return None
          Some(v) => {
            if v < 0.0 || !is_finite(v) || (v == 0.0 && geo_nonzero(value)) {
              return None
            }
            uncertainty = Some(v)
          }
        }
      } else if key == "crs" {
        if extensions ||
          uncertainty is Some(_) ||
          crs is Some(_) ||
          ascii_lower(value) != "wgs84" {
          return None
        }
        crs = Some(value)
      } else {
        if !geo_parameter_value(value) {
          return None
        }
        extensions = true
      }
    } else if ascii_lower(kv[0]) == "u" || ascii_lower(kv[0]) == "crs" {
      return None
    } else {
      extensions = true
    }
  }
  Some({ point, altitude, uncertainty, crs, raw: s, })
}

///|
/// RFC 5870 num/pnum: no leading plus, exponent or surrounding whitespace.
fn geo_number(text : String, signed : Bool) -> Bool {
  let cs = chars_of(text)
  let mut i = if signed && cs.length() > 0 && cs[0] == '-' { 1 } else { 0 }
  let begin = i
  while i < cs.length() && cs[i] >= '0' && cs[i] <= '9' {
    i = i + 1
  }
  if i == begin {
    return false
  }
  if i < cs.length() && cs[i] == '.' {
    i = i + 1
    let fraction = i
    while i < cs.length() && cs[i] >= '0' && cs[i] <= '9' {
      i = i + 1
    }
    if i == fraction {
      return false
    }
  }
  i == cs.length()
}

///|
fn geo_label(text : String) -> Bool {
  if text == "" {
    return false
  }
  for c in text {
    if !((c >= '0' && c <= '9') ||
      (c >= 'A' && c <= 'Z') ||
      (c >= 'a' && c <= 'z') ||
      c == '-') {
      return false
    }
  }
  true
}

///|
/// Preserve the validated URI exactly, including tiny u, explicit zero,
/// coordinate/altitude precision and extension parameters. Reformatting to a
/// fixed number of decimals could move the centre or turn a positive u into 0.
pub fn geouri_format(uri : GeoUri) -> String {
  uri.raw
}

///|
fn geo_parameter_value(text : String) -> Bool {
  if text == "" {
    return false
  }
  let cs = chars_of(text)
  let mut i = 0
  while i < cs.length() {
    let c = cs[i]
    if c == '%' {
      if i + 2 >= cs.length() || !geo_hex(cs[i + 1]) || !geo_hex(cs[i + 2]) {
        return false
      }
      i = i + 3
    } else if (c >= 'a' && c <= 'z') ||
      (c >= 'A' && c <= 'Z') ||
      (c >= '0' && c <= '9') ||
      "-_.!~*'()[]:&+$".contains(char_str(c)) {
      i = i + 1
    } else {
      return false
    }
  }
  true
}

///|
fn geo_hex(c : Char) -> Bool {
  (c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F')
}

///|
fn geo_nonzero(text : String) -> Bool {
  for c in text {
    if c >= '1' && c <= '9' {
      return true
    }
  }
  false
}

///|
/// Split a string on a single-character delimiter, keeping empty fields.
pub fn split_text(text : String, delimiter : Char) -> Array[String] {
  let chars = chars_of(text)
  let out : Array[String] = []
  let mut current : Array[Char] = []
  for ch in chars {
    if ch == delimiter {
      out.push(string_of(current))
      current = []
    } else {
      current.push(ch)
    }
  }
  out.push(string_of(current))
  out
}

///|
pub extend GeoUri with Eq::{not_equal, equal}
