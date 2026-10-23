// Degrees/minutes/seconds parsing and formatting. The parser is deliberately
// strict: a value with minutes or seconds outside their range is rejected
// instead of being silently normalised, because a coordinate with a typo is
// worse than an error.

///|
/// Parse one angle written as decimal degrees or as degrees/minutes/seconds.
///
/// Accepted forms include `51.5`, `-51.5`, `51 30 26.5 N`, `51°30'26.5"N`,
/// `51d30m26.5sN`, `51:30:26.5N` and a leading sign in place of a hemisphere.
/// `is_lat` selects the latitude range and the accepted hemisphere letters.
pub fn parse_dms(input : String, is_lat : Bool) -> Double? {
  let s = ascii_upper(trim_ascii(input))
  let chars = chars_of(s)
  let mut end = chars.length()
  if end == 0 {
    return None
  }
  let mut sign = 1.0
  let last = chars[end - 1]
  if last == 'N' || last == 'S' || last == 'E' || last == 'W' {
    if is_lat && (last == 'E' || last == 'W') {
      return None
    }
    if !is_lat && (last == 'N' || last == 'S') {
      return None
    }
    if last == 'S' || last == 'W' {
      sign = -1.0
    }
    end = end - 1
  }
  let mut start = 0
  while start < end && is_space_char(chars[start]) {
    start = start + 1
  }
  if start < end && (chars[start] == '-' || chars[start] == '+') {
    if chars[start] == '-' {
      sign = -sign
    }
    start = start + 1
  }
  let values = number_tokens(chars, start, end)
  if values.length() == 0 || values.length() > 3 {
    return None
  }
  let deg = values[0]
  let min = if values.length() > 1 { values[1] } else { 0.0 }
  let sec = if values.length() > 2 { values[2] } else { 0.0 }
  if !is_finite(deg) || !is_finite(min) || !is_finite(sec) {
    return None
  }
  if deg < 0.0 || min < 0.0 || sec < 0.0 {
    return None
  }
  if min >= 60.0 || sec >= 60.0 {
    return None
  }
  let limit = if is_lat { 90.0 } else { 180.0 }
  if deg > limit {
    return None
  }
  if deg == limit && (min > 0.0 || sec > 0.0) {
    return None
  }
  let value = deg + min / 60.0 + sec / 3600.0
  Some(sign * value)
}

///|
fn is_space_char(c : Char) -> Bool {
  c == ' ' || c == '\t'
}

///|
/// Split a run of characters into numeric tokens, treating the usual degree
/// symbols as separators. Returns the parsed values.
fn number_tokens(chars : Array[Char], start : Int, end : Int) -> Array[Double] {
  let out : Array[Double] = []
  let mut token : Array[Char] = []
  let mut i = start
  while i < end {
    let c = chars[i]
    if is_number_char(c) {
      token.push(c)
    } else if is_separator(c) {
      if token.length() > 0 {
        match parse_token(token) {
          Some(v) => out.push(v)
          None => return []
        }
        token = []
      }
    } else {
      // An unknown character means the whole spelling is malformed.
      return []
    }
    i = i + 1
  }
  if token.length() > 0 {
    match parse_token(token) {
      Some(v) => out.push(v)
      None => return []
    }
  }
  out
}

///|
fn is_number_char(c : Char) -> Bool {
  (c >= '0' && c <= '9') || c == '.' || c == '-' || c == '+'
}

///|
/// Characters that may separate the degree, minute and second fields. The
/// degree symbols are the Unicode ones as well as the ASCII spellings `d`,
/// `m` and `s`.
fn is_separator(c : Char) -> Bool {
  c == ' ' ||
  c == '\t' ||
  c == ',' ||
  c == ':' ||
  c == '\'' ||
  c == '"' ||
  c == 'D' ||
  c == 'M' ||
  c == 'S' ||
  c.to_int() == 0x00B0 ||
  c.to_int() == 0x2032 ||
  c.to_int() == 0x2033
}

///|
/// Parse a plain decimal number without exceptions. Coordinate tokens never
/// need an exponent, so this intentionally accepts only `[+-]?digits[.digits]`.
fn parse_token(chars : Array[Char]) -> Double? {
  parse_decimal(string_of(chars))
}

///|
/// Format an angle as `D°M′S″H` with two decimal places on the seconds.
pub fn format_dms(value : Double, is_lat : Bool) -> String {
  if !is_finite(value) {
    return "--"
  }
  let limit = if is_lat { 90.0 } else { 180.0 }
  let total = value.abs()
  if total > limit {
    return "--"
  }
  let d0 = total.floor()
  let rem = (total - d0) * 60.0
  let m0 = rem.floor()
  let mut sec = round_to((rem - m0) * 60.0, 2)
  let mut min = m0.to_int()
  let mut deg = d0.to_int()
  if sec >= 60.0 {
    sec = sec - 60.0
    min = min + 1
  }
  if min >= 60 {
    min = min - 60
    deg = deg + 1
  }
  let sec_text = format_fixed(sec, 2)
  let sec_padded = if sec_text.length() < 5 {
    "0".repeat(5 - sec_text.length()) + sec_text
  } else {
    sec_text
  }
  let min_text = if min < 10 { "0" + min.to_string() } else { min.to_string() }
  let suffix = hemisphere_suffix(value, is_lat)
  deg.to_string() +
  DEGREE +
  min_text +
  PRIME +
  sec_padded +
  DOUBLE_PRIME +
  suffix
}
