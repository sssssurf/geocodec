// RFC 5870 `geo:` URIs: a latitude, longitude and optional altitude, plus
// optional uncertainty and coordinate reference system parameters.

///|
/// A parsed `geo:` URI. `crs` is kept as written; the library only interprets
/// WGS84 coordinates, so a non-default CRS is reported but not reprojected.
pub(all) struct GeoUri {
  point : LatLng
  altitude : Double?
  uncertainty : Double?
  crs : String?
} derive(Eq)

///|
/// Parse a `geo:` URI. Returns `None` for a bad prefix, a coordinate outside
/// its range, a malformed number, or a negative uncertainty.
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
  for i = 1; i < sections.length(); i = i + 1 {
    let section = sections[i]
    if section == "" {
      return None
    }
    let kv = split_text(section, '=')
    if kv.length() == 2 {
      let key = ascii_lower(kv[0])
      let value = kv[1]
      if key == "u" {
        if uncertainty is Some(_) || !geo_number(value, false) {
          return None
        }
        match parse_decimal(value) {
          None => return None
          Some(v) => {
            if v < 0.0 || !is_finite(v) {
              return None
            }
            uncertainty = Some(v)
          }
        }
      } else if key == "crs" {
        if value == "" || crs is Some(_) || !geo_label(value) {
          return None
        }
        crs = Some(value)
      }
    } else if ascii_lower(kv[0]) == "u" || ascii_lower(kv[0]) == "crs" {
      return None
    }
  }
  Some({ point, altitude, uncertainty, crs, })
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
/// Render a `geo:` URI with six decimals for the coordinates and no trailing
/// zeros.
pub fn geouri_format(uri : GeoUri) -> String {
  let mut out = "geo:" +
    trim_fraction(format_fixed(uri.point.lat(), 6)) +
    "," +
    trim_fraction(format_fixed(uri.point.lng(), 6))
  match uri.altitude {
    None => ()
    Some(v) => out = out + "," + trim_fraction(format_fixed(v, 3))
  }
  match uri.crs {
    None => ()
    Some(v) => out = out + ";crs=" + v
  }
  match uri.uncertainty {
    None => ()
    Some(v) => out = out + ";u=" + trim_fraction(format_fixed(v, 3))
  }
  out
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
