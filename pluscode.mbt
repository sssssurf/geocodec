// Open Location Code (Plus Codes), per the published OLC specification.
//
// The first ten significant characters encode five latitude/longitude pairs in
// base 20. Characters eleven to fifteen refine the cell with a 5x4 grid. The
// implementation works in the integer domain the specification defines, so
// encode/decode are exact rather than accumulating floating-point error.

///|
/// The OLC alphabet. `0`, `+` and the vowels are deliberately absent.
pub const PLUSCODE_ALPHABET : String = "23456789CFGHJMPQRVWX"

///|
/// The character that separates the area code from the local code.
pub const PLUSCODE_SEPARATOR : Char = '+'

///|
/// The padding character used by area-only codes.
pub const PLUSCODE_PADDING : Char = '0'

///|
/// The precision of the latitude/longitude pair section (20^3).
const OLC_PAIR_PRECISION : Int64 = 8000L

///|
/// The latitude scale that makes a coordinate an integer (20^3 * 5^5).
const OLC_FINAL_LAT_PRECISION : Int64 = 25000000L

///|
/// The longitude scale that makes a coordinate an integer (20^3 * 4^5).
const OLC_FINAL_LNG_PRECISION : Int64 = 8192000L

///|
/// Latitude offset in integer units (90 degrees).
const OLC_LAT_OFFSET : Int64 = 2250000000L

///|
/// Longitude offset in integer units (180 degrees).
const OLC_LNG_OFFSET : Int64 = 1474560000L

///|
/// The number of longitude integer units in a full turn.
const OLC_LNG_RANGE : Int64 = 2949120000L

///|
/// The first pair's place value (20^4).
const OLC_PAIR_FIRST_PLACE : Int64 = 160000L

///|
/// The resolution of each pair in degrees.
let olc_pair_resolutions : Array[Double] = [20.0, 1.0, 0.05, 0.0025, 0.000125]

///|
/// Encode a point as a Plus Code. `code_length` counts significant characters
/// and excludes the separator; 10 (about 13.5 m) is the default, 11 to 15 add
/// grid refinement, and 2/4/6/8 are the area-only lengths.
pub fn pluscode_encode(point : LatLng, code_length? : Int = 10) -> String? {
  let length = if code_length < 2 {
    return None
  } else if code_length < 10 && code_length % 2 == 1 {
    return None
  } else if code_length > 15 {
    15
  } else {
    code_length
  }
  let alphabet = chars_of(PLUSCODE_ALPHABET)
  let mut lat_val = olc_lat_integer(point.lat())
  let mut lng_val = olc_lng_integer(point.lng())
  let reversed : Array[Char] = []
  if length > 10 {
    for _ in 0..<5 {
      let lat_digit = (lat_val % 5L).to_int()
      let lng_digit = (lng_val % 4L).to_int()
      reversed.push(alphabet[lat_digit * 4 + lng_digit])
      lat_val = lat_val / 5L
      lng_val = lng_val / 4L
    }
  } else {
    lat_val = lat_val / 3125L
    lng_val = lng_val / 1024L
  }
  for _ in 0..<5 {
    let lng_digit = (lng_val % 20L).to_int()
    let lat_digit = (lat_val % 20L).to_int()
    reversed.push(alphabet[lng_digit])
    reversed.push(alphabet[lat_digit])
    lat_val = lat_val / 20L
    lng_val = lng_val / 20L
  }
  let chars : Array[Char] = []
  let mut i = reversed.length()
  while i > 0 {
    i = i - 1
    chars.push(reversed[i])
  }
  // Build the full 15-character form with the separator at position 8.
  let buf = StringBuilder()
  let mut k = 0
  while k < chars.length() {
    if k == 8 {
      buf.write_char(PLUSCODE_SEPARATOR)
    }
    buf.write_char(chars[k])
    k = k + 1
  }
  if k == 8 {
    buf.write_char(PLUSCODE_SEPARATOR)
  }
  let full = buf.to_string()
  if length >= 8 {
    Some(full[0:length + 1].to_owned())
  } else {
    Some(full[0:length].to_owned() + "0".repeat(8 - length) + "+")
  }
}

///|
/// Turn a latitude into the OLC integer grid, clamping to the legal range.
fn olc_lat_integer(lat : Double) -> Int64 {
  let limit = OLC_LAT_OFFSET * 2L
  let mut v = (lat * OLC_FINAL_LAT_PRECISION.to_double()).floor().to_int64() +
    OLC_LAT_OFFSET
  if v < 0L {
    v = 0L
  } else if v >= limit {
    v = limit - 1L
  }
  v
}

///|
/// Turn a longitude into the OLC integer grid, wrapping around the date line.
fn olc_lng_integer(lng : Double) -> Int64 {
  let mut v = (lng * OLC_FINAL_LNG_PRECISION.to_double()).floor().to_int64() +
    OLC_LNG_OFFSET
  v = (v % OLC_LNG_RANGE + OLC_LNG_RANGE) % OLC_LNG_RANGE
  v
}

///|
/// True when the string is a syntactically valid OLC, either full or short.
pub fn pluscode_is_valid(code : String) -> Bool {
  let s = ascii_upper(trim_ascii(code))
  let chars = chars_of(s)
  if chars.length() < 2 {
    return false
  }
  let mut separators = 0
  let mut sep = -1
  for i = 0; i < chars.length(); i = i + 1 {
    if chars[i] == PLUSCODE_SEPARATOR {
      separators = separators + 1
      sep = i
    }
  }
  if separators != 1 || sep % 2 == 1 || sep > 8 {
    return false
  }
  let mut padding = -1
  for i = 0; i < chars.length(); i = i + 1 {
    if chars[i] == PLUSCODE_PADDING && padding == -1 {
      padding = i
    }
  }
  if padding != -1 {
    if sep < 8 {
      return false
    }
    if padding == 0 {
      return false
    }
    let mut last = padding
    while last < chars.length() && chars[last] == PLUSCODE_PADDING {
      last = last + 1
    }
    if (last - padding) % 2 == 1 {
      return false
    }
    if last != sep {
      return false
    }
    if chars[chars.length() - 1] != PLUSCODE_SEPARATOR {
      return false
    }
  }
  if chars.length() - sep - 1 == 1 {
    return false
  }
  let alphabet = chars_of(PLUSCODE_ALPHABET)
  for ch in chars {
    if ch == PLUSCODE_SEPARATOR || ch == PLUSCODE_PADDING {
      continue
    }
    if index_of(alphabet, ch) < 0 {
      return false
    }
  }
  true
}

///|
/// True when the string is a valid short code (the separator comes before
/// position eight).
pub fn pluscode_is_short(code : String) -> Bool {
  if !pluscode_is_valid(code) {
    return false
  }
  let chars = chars_of(ascii_upper(trim_ascii(code)))
  let sep = index_of(chars, PLUSCODE_SEPARATOR)
  sep >= 0 && sep < 8
}

///|
/// True when the string is a valid full code: valid, not short, and with the
/// first pair inside the latitude/longitude ranges.
pub fn pluscode_is_full(code : String) -> Bool {
  if !pluscode_is_valid(code) || pluscode_is_short(code) {
    return false
  }
  let chars = chars_of(ascii_upper(trim_ascii(code)))
  let alphabet = chars_of(PLUSCODE_ALPHABET)
  let first_lat = index_of(alphabet, chars[0])
  let first_lng = index_of(alphabet, chars[1])
  if first_lat < 0 || first_lng < 0 {
    return false
  }
  first_lat * 20 < 180 && first_lng * 20 < 360
}

///|
/// The number of significant characters in a full code (separator and padding
/// removed), capped at 15.
pub fn pluscode_code_length(code : String) -> Int {
  let chars = chars_of(ascii_upper(trim_ascii(code)))
  let mut n = 0
  for ch in chars {
    if ch != PLUSCODE_SEPARATOR && ch != PLUSCODE_PADDING {
      n = n + 1
    }
  }
  if n > 15 {
    15
  } else {
    n
  }
}

///|
/// The bounding box a full Plus Code denotes.
pub fn pluscode_bounds(code : String) -> BoundingBox? {
  if !pluscode_is_full(code) {
    return None
  }
  let alphabet = chars_of(PLUSCODE_ALPHABET)
  let raw = chars_of(ascii_upper(trim_ascii(code)))
  let mut chars : Array[Char] = []
  for ch in raw {
    if ch != PLUSCODE_SEPARATOR && ch != PLUSCODE_PADDING {
      chars.push(ch)
    }
  }
  if chars.length() > 15 {
    let cut : Array[Char] = []
    for i = 0; i < 15; i = i + 1 {
      cut.push(chars[i])
    }
    chars = cut
  }
  let digits = if chars.length() < 10 { chars.length() } else { 10 }
  let mut normal_lat = -90L * OLC_PAIR_PRECISION
  let mut normal_lng = -180L * OLC_PAIR_PRECISION
  let mut place = OLC_PAIR_FIRST_PLACE
  let mut i = 0
  while i < digits {
    normal_lat = normal_lat + index_of(alphabet, chars[i]).to_int64() * place
    normal_lng = normal_lng +
      index_of(alphabet, chars[i + 1]).to_int64() * place
    if i < digits - 2 {
      place = place / 20L
    }
    i = i + 2
  }
  let mut lat_precision = place.to_double() / OLC_PAIR_PRECISION.to_double()
  let mut lng_precision = lat_precision
  let mut grid_lat = 0L
  let mut grid_lng = 0L
  if chars.length() > 10 {
    // The place values always start at the finest pair (5^4 and 4^4) and
    // divide once per grid character, regardless of how many are present.
    let mut row_place = 625L
    let mut col_place = 256L
    let mut j = 10
    while j < chars.length() {
      let value = index_of(alphabet, chars[j])
      let row = value / 4
      let col = value % 4
      grid_lat = grid_lat + row.to_int64() * row_place
      grid_lng = grid_lng + col.to_int64() * col_place
      if j < chars.length() - 1 {
        row_place = row_place / 5L
        col_place = col_place / 4L
      }
      j = j + 1
    }
    lat_precision = row_place.to_double() / OLC_FINAL_LAT_PRECISION.to_double()
    lng_precision = col_place.to_double() / OLC_FINAL_LNG_PRECISION.to_double()
  }
  let lat = round_to(
    normal_lat.to_double() / OLC_PAIR_PRECISION.to_double() +
    grid_lat.to_double() / OLC_FINAL_LAT_PRECISION.to_double(),
    14,
  )
  let lng = round_to(
    normal_lng.to_double() / OLC_PAIR_PRECISION.to_double() +
    grid_lng.to_double() / OLC_FINAL_LNG_PRECISION.to_double(),
    14,
  )
  BoundingBox::new(lat, lng, lat + lat_precision, lng + lng_precision)
}

///|
/// The centre of a full Plus Code.
pub fn pluscode_decode(code : String) -> LatLng? {
  match pluscode_bounds(code) {
    None => None
    Some(b) => b.center()
  }
}

///|
/// The cell immediately `dx` cells east and `dy` cells north, at the same
/// precision. At a pole the latitude is clamped, so a northward move from the
/// top row can repeat the same cell.
pub fn pluscode_adjacent(code : String, dx : Int, dy : Int) -> String? {
  let bounds = match pluscode_bounds(code) {
    None => return None
    Some(b) => b
  }
  let center = match bounds.center() {
    None => return None
    Some(c) => c
  }
  let lat = clamp_lat(center.lat() + bounds.height() * dy.to_double())
  let lng = normalize_lng(center.lng() + bounds.width() * dx.to_double())
  let point = match LatLng::new(lat, lng) {
    None => return None
    Some(p) => p
  }
  pluscode_encode(point, code_length=pluscode_code_length(code))
}

///|
/// The eight neighbouring cells, in the same order as `geohash_neighbors`.
pub fn pluscode_neighbors(code : String) -> Array[String]? {
  if pluscode_bounds(code) is None {
    return None
  }
  let out : Array[String] = []
  for dy in [-1, 0, 1] {
    for dx in [-1, 0, 1] {
      if dx != 0 || dy != 0 {
        match pluscode_adjacent(code, dx, dy) {
          Some(n) => out.push(n)
          None => return None
        }
      }
    }
  }
  if out.length() != 8 {
    return None
  }
  Some(out)
}

///|
/// Remove as many leading characters as the reference point safely allows.
/// Returns the original code when the reference is not close enough, and
/// `None` when the input is not a full, unpadded code of at least six digits.
pub fn pluscode_shorten(code : String, reference : LatLng) -> String? {
  if !pluscode_is_full(code) {
    return None
  }
  let s = ascii_upper(trim_ascii(code))
  if s.contains("0") {
    return None
  }
  let length = pluscode_code_length(s)
  if length < 6 {
    return None
  }
  let center = match pluscode_decode(s) {
    None => return None
    Some(p) => p
  }
  let range = max_double(
    (center.lat() - reference.lat()).abs(),
    lng_delta(center.lng(), reference.lng()).abs(),
  )
  let mut i = 3
  while i > 0 {
    if range < olc_pair_resolutions[i] * 0.3 {
      return Some(s[(i + 1) * 2:].to_owned())
    }
    i = i - 1
  }
  Some(s)
}

///|
/// Recover a full code from a short code, choosing the candidate nearest to
/// `reference`. A full code is returned normalised.
pub fn pluscode_recover(short : String, reference : LatLng) -> String? {
  let s = ascii_upper(trim_ascii(short))
  if pluscode_is_full(s) {
    return Some(s)
  }
  if !pluscode_is_short(s) {
    return None
  }
  let chars = chars_of(s)
  let sep = index_of(chars, PLUSCODE_SEPARATOR)
  let padding_length = 8 - sep
  let resolution = pow_double(20.0, 2.0 - padding_length.to_double() / 2.0)
  let half = resolution / 2.0
  let prefix = match pluscode_encode(reference, code_length=10) {
    None => return None
    Some(full) => full[0:padding_length].to_owned()
  }
  let combined = prefix + s
  let center = match pluscode_decode(combined) {
    None => return None
    Some(p) => p
  }
  let mut lat = center.lat()
  let mut lng = center.lng()
  if reference.lat() + half < lat && lat - resolution >= -90.0 {
    lat = lat - resolution
  } else if reference.lat() - half > lat && lat + resolution <= 90.0 {
    lat = lat + resolution
  }
  if lng_delta(reference.lng(), lng) > half {
    lng = normalize_lng(lng - resolution)
  } else if lng_delta(lng, reference.lng()) > half {
    lng = normalize_lng(lng + resolution)
  }
  match LatLng::new(lat, lng) {
    None => None
    Some(adjusted) =>
      pluscode_encode(adjusted, code_length=pluscode_code_length(combined))
  }
}

///|
fn pow_double(base : Double, exponent : Double) -> Double {
  @math.pow(base, exponent)
}

///|
fn max_double(a : Double, b : Double) -> Double {
  if a > b {
    a
  } else {
    b
  }
}
