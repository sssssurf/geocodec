// Maidenhead locators (also called QTH locators): alternating letter and
// digit pairs that divide the world into fields, squares, subsquares and
// extended squares. Amateur radio uses four or six characters most often;
// eight and ten are supported here as well.

///|
/// Encode a point as a Maidenhead locator. `precision` is the number of
/// characters and must be even, from 2 to 10.
pub fn maidenhead_encode(point : LatLng, precision? : Int = 6) -> String? {
  if precision < 2 || precision > 10 || precision % 2 == 1 {
    return None
  }
  let lng_widths : Array[Double] = [
    20.0,
    2.0,
    2.0 / 24.0,
    2.0 / 240.0,
    2.0 / 2400.0,
  ]
  let lat_widths : Array[Double] = [
    10.0,
    1.0,
    1.0 / 24.0,
    1.0 / 240.0,
    1.0 / 2400.0,
  ]
  let mut lng = point.lng() + 180.0
  let mut lat = point.lat() + 90.0
  let out : Array[Char] = []
  let pairs = precision / 2
  for pair in 0..<pairs {
    let lng_index = clamp_index(
      (lng / lng_widths[pair]).floor().to_int(),
      if pair == 0 {
        17
      } else if pair % 2 == 0 {
        23
      } else {
        9
      },
    )
    let lat_index = clamp_index(
      (lat / lat_widths[pair]).floor().to_int(),
      if pair == 0 {
        17
      } else if pair % 2 == 0 {
        23
      } else {
        9
      },
    )
    if pair % 2 == 0 {
      out.push(('A'.to_int() + lng_index).unsafe_to_char())
      out.push(('A'.to_int() + lat_index).unsafe_to_char())
    } else {
      out.push(('0'.to_int() + lng_index).unsafe_to_char())
      out.push(('0'.to_int() + lat_index).unsafe_to_char())
    }
    lng = lng - lng_index.to_double() * lng_widths[pair]
    lat = lat - lat_index.to_double() * lat_widths[pair]
  }
  Some(string_of(out))
}

///|
/// The bounding box a Maidenhead locator denotes.
pub fn maidenhead_bounds(locator : String) -> BoundingBox? {
  let s = ascii_upper(trim_ascii(locator))
  let chars = chars_of(s)
  if chars.length() < 2 || chars.length() > 10 || chars.length() % 2 == 1 {
    return None
  }
  let lng_widths : Array[Double] = [
    20.0,
    2.0,
    2.0 / 24.0,
    2.0 / 240.0,
    2.0 / 2400.0,
  ]
  let lat_widths : Array[Double] = [
    10.0,
    1.0,
    1.0 / 24.0,
    1.0 / 240.0,
    1.0 / 2400.0,
  ]
  let mut lng = -180.0
  let mut lat = -90.0
  let mut i = 0
  while i < chars.length() {
    let pair = i / 2
    let lng_char = chars[i]
    let lat_char = chars[i + 1]
    let mut lng_index = -1
    let mut lat_index = -1
    if pair % 2 == 0 {
      if lng_char >= 'A' && lng_char <= 'X' {
        lng_index = lng_char.to_int() - 'A'.to_int()
      }
      if lat_char >= 'A' && lat_char <= 'X' {
        lat_index = lat_char.to_int() - 'A'.to_int()
      }
      if lng_index > (if pair == 0 { 17 } else { 23 }) ||
        lat_index > (if pair == 0 { 17 } else { 23 }) {
        return None
      }
    } else {
      if lng_char >= '0' && lng_char <= '9' {
        lng_index = lng_char.to_int() - '0'.to_int()
      }
      if lat_char >= '0' && lat_char <= '9' {
        lat_index = lat_char.to_int() - '0'.to_int()
      }
    }
    if lng_index < 0 || lat_index < 0 {
      return None
    }
    lng = lng + lng_index.to_double() * lng_widths[pair]
    lat = lat + lat_index.to_double() * lat_widths[pair]
    i = i + 2
  }
  let width = lng_widths[chars.length() / 2 - 1]
  let height = lat_widths[chars.length() / 2 - 1]
  BoundingBox::new(lat, lng, lat + height, lng + width)
}

///|
/// The centre of a Maidenhead locator.
pub fn maidenhead_decode(locator : String) -> LatLng? {
  match maidenhead_bounds(locator) {
    None => None
    Some(b) => b.center()
  }
}

///|
/// Clamp a cell index into `[0, max]`. Only the exact north/east edge of the
/// world can overflow, and there the last cell is the right answer.
fn clamp_index(value : Int, max : Int) -> Int {
  if value < 0 {
    0
  } else if value > max {
    max
  } else {
    value
  }
}
