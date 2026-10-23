// Small text helpers shared by the codecs. All codecs work on ASCII, but the
// helpers are written over `Char` so a stray non-ASCII character is rejected
// rather than sliced in the middle of a UTF-8 sequence.

///|
/// The characters of a string, in order.
pub fn chars_of(s : String) -> Array[Char] {
  let out : Array[Char] = []
  for ch in s {
    out.push(ch)
  }
  out
}

///|
/// Build a string from characters.
pub fn string_of(chars : Array[Char]) -> String {
  let buf = StringBuilder()
  for ch in chars {
    buf.write_char(ch)
  }
  buf.to_string()
}

///|
/// True when every character is ASCII (code point below 128).
pub fn is_ascii(s : String) -> Bool {
  for ch in s {
    if ch.to_int() >= 128 {
      return false
    }
  }
  true
}

///|
/// ASCII uppercase for the codecs' alphabets: digits, `+`, `-`, `.`, space and
/// letters are the only inputs that matter.
pub fn ascii_upper_char(c : Char) -> Char {
  if c >= 'a' && c <= 'z' {
    (c.to_int() - 32).unsafe_to_char()
  } else {
    c
  }
}

///|
/// Uppercase a string using ASCII rules only.
pub fn ascii_upper(s : String) -> String {
  let out : Array[Char] = []
  for ch in s {
    out.push(ascii_upper_char(ch))
  }
  string_of(out)
}

///|
/// Lowercase a string using ASCII rules only.
pub fn ascii_lower(s : String) -> String {
  let out : Array[Char] = []
  for ch in s {
    if ch >= 'A' && ch <= 'Z' {
      out.push((ch.to_int() + 32).unsafe_to_char())
    } else {
      out.push(ch)
    }
  }
  string_of(out)
}

///|
/// A one-character string.
pub fn char_str(c : Char) -> String {
  let buf = StringBuilder()
  buf.write_char(c)
  buf.to_string()
}

///|
/// The index of `needle` in `chars`, or -1.
pub fn index_of(chars : Array[Char], needle : Char) -> Int {
  let mut i = 0
  while i < chars.length() {
    if chars[i] == needle {
      return i
    }
    i = i + 1
  }
  -1
}

///|
/// Remove leading and trailing ASCII whitespace.
pub fn trim_ascii(s : String) -> String {
  let chars = chars_of(s)
  let mut start = 0
  let mut end = chars.length()
  while start < end && is_space(chars[start]) {
    start = start + 1
  }
  while end > start && is_space(chars[end - 1]) {
    end = end - 1
  }
  let out : Array[Char] = []
  for i = start; i < end; i = i + 1 {
    out.push(chars[i])
  }
  string_of(out)
}

///|
fn is_space(c : Char) -> Bool {
  c == ' ' || c == '\t' || c == '\n' || c == '\r'
}

///|
/// The digit value of an ASCII character, or `None`.
pub fn digit_value(c : Char) -> Int? {
  if c >= '0' && c <= '9' {
    Some(c.to_int() - 48)
  } else {
    None
  }
}

///|
/// Parse a plain decimal number without exceptions: `[+-]?digits[.digits]`.
/// Coordinate text never needs an exponent, and refusing one keeps the parser
/// total and predictable.
pub fn parse_decimal(text : String) -> Double? {
  let chars = chars_of(trim_ascii(text))
  let n = chars.length()
  if n == 0 {
    return None
  }
  let mut i = 0
  let mut sign = 1.0
  if chars[i] == '-' || chars[i] == '+' {
    if chars[i] == '-' {
      sign = -1.0
    }
    i = i + 1
  }
  let mut int_part = 0.0
  let mut digits = 0
  while i < n && digit_value(chars[i]) is Some(d) {
    int_part = int_part * 10.0 + d.to_double()
    digits = digits + 1
    i = i + 1
  }
  let mut frac = 0.0
  let mut factor = 0.1
  if i < n && chars[i] == '.' {
    i = i + 1
    while i < n && digit_value(chars[i]) is Some(d) {
      frac = frac + d.to_double() * factor
      factor = factor / 10.0
      digits = digits + 1
      i = i + 1
    }
  }
  if digits == 0 || i != n {
    return None
  }
  Some(sign * (int_part + frac))
}

///|
/// Split on ASCII whitespace, dropping empty fields.
pub fn split_whitespace(text : String) -> Array[String] {
  let chars = chars_of(trim_ascii(text))
  let out : Array[String] = []
  let mut current : Array[Char] = []
  for ch in chars {
    if ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r' {
      if current.length() > 0 {
        out.push(string_of(current))
        current = []
      }
    } else {
      current.push(ch)
    }
  }
  if current.length() > 0 {
    out.push(string_of(current))
  }
  out
}

///|
/// Drop trailing zeros (and a trailing point) from a fixed-point rendering.
pub fn trim_fraction(text : String) -> String {
  let chars = chars_of(text)
  let mut end = chars.length()
  while end > 0 && chars[end - 1] == '0' {
    end = end - 1
  }
  if end > 0 && chars[end - 1] == '.' {
    end = end - 1
  }
  let out : Array[Char] = []
  for i = 0; i < end; i = i + 1 {
    out.push(chars[i])
  }
  string_of(out)
}
