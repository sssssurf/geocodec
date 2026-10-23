// Geohash: interleaved base-32 latitude/longitude cells.
//
// The encoding is the classic Gustavo Niemeyer scheme: longitudes are split
// first, then latitudes, and every five bits select one character from the
// alphabet `0123456789bcdefghjkmnpqrstuvwxyz` (a, i, l and o are omitted).

///|
/// The geohash alphabet, in value order.
pub const GEOHASH_ALPHABET : String = "0123456789bcdefghjkmnpqrstuvwxyz"

///|
/// The maximum number of characters a geohash can have here. Twelve
/// characters already resolve to under a centimetre.
pub const GEOHASH_MAX_PRECISION : Int = 12

///|
/// Encode a point as a geohash of `precision` characters (1 to 12).
pub fn geohash_encode(point : LatLng, precision : Int) -> String? {
  if precision < 1 || precision > GEOHASH_MAX_PRECISION {
    return None
  }
  let alphabet = chars_of(GEOHASH_ALPHABET)
  let mut lat_min = -90.0
  let mut lat_max = 90.0
  let mut lng_min = -180.0
  let mut lng_max = 180.0
  let mut bits = 0
  let mut filled = 0
  let mut split_lng = true
  let out : Array[Char] = []
  for _ in 0..<(precision * 5) {
    let mut bit = false
    if split_lng {
      let mid = (lng_min + lng_max) / 2.0
      if point.lng() >= mid {
        bit = true
        lng_min = mid
      } else {
        lng_max = mid
      }
    } else {
      let mid = (lat_min + lat_max) / 2.0
      if point.lat() >= mid {
        bit = true
        lat_min = mid
      } else {
        lat_max = mid
      }
    }
    bits = bits << 1
    if bit {
      bits = bits | 1
    }
    filled = filled + 1
    if filled == 5 {
      out.push(alphabet[bits])
      bits = 0
      filled = 0
    }
    split_lng = !split_lng
  }
  Some(string_of(out))
}

///|
/// The bounding box a geohash denotes, or `None` when the string is not a
/// geohash.
pub fn geohash_bounds(code : String) -> BoundingBox? {
  let chars = chars_of(ascii_lower(trim_ascii(code)))
  if chars.length() < 1 || chars.length() > GEOHASH_MAX_PRECISION {
    return None
  }
  let alphabet = chars_of(GEOHASH_ALPHABET)
  let mut lat_min = -90.0
  let mut lat_max = 90.0
  let mut lng_min = -180.0
  let mut lng_max = 180.0
  let mut split_lng = true
  for ch in chars {
    let value = index_of(alphabet, ch)
    if value < 0 {
      return None
    }
    let mut mask = 16
    while mask > 0 {
      let on = (value & mask) != 0
      if split_lng {
        let mid = (lng_min + lng_max) / 2.0
        if on {
          lng_min = mid
        } else {
          lng_max = mid
        }
      } else {
        let mid = (lat_min + lat_max) / 2.0
        if on {
          lat_min = mid
        } else {
          lat_max = mid
        }
      }
      mask = mask >> 1
      split_lng = !split_lng
    }
  }
  BoundingBox::new(lat_min, lng_min, lat_max, lng_max)
}

///|
/// The centre of a geohash cell.
pub fn geohash_decode(code : String) -> LatLng? {
  match geohash_bounds(code) {
    None => None
    Some(b) => b.center()
  }
}

///|
/// The cell immediately `dx` cells east and `dy` cells north. The result is
/// `None` when the input is not a geohash; at a pole the latitude is clamped,
/// so a northward move from the top row can repeat the same cell.
pub fn geohash_adjacent(code : String, dx : Int, dy : Int) -> String? {
  match geohash_bounds(code) {
    None => None
    Some(b) => {
      let center = match b.center() {
        None => return None
        Some(c) => c
      }
      let lat = clamp_lat(center.lat() + (b.north - b.south) * dy.to_double())
      let lng = normalize_lng(center.lng() + b.width() * dx.to_double())
      match LatLng::new(lat, lng) {
        None => None
        Some(p) => geohash_encode(p, chars_of(trim_ascii(code)).length())
      }
    }
  }
}

///|
/// The eight neighbouring cells, ordered south-west, south, south-east, west,
/// east, north-west, north, north-east.
pub fn geohash_neighbors(code : String) -> Array[String]? {
  if geohash_bounds(code) is None {
    return None
  }
  let out : Array[String] = []
  for dy in [-1, 0, 1] {
    for dx in [-1, 0, 1] {
      if dx != 0 || dy != 0 {
        match geohash_adjacent(code, dx, dy) {
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
/// The smallest precision whose cell is no larger than `meters` at the
/// equator. Returns 12 for sub-centimetre requests.
pub fn geohash_precision_for_meters(meters : Double) -> Int? {
  if !is_finite(meters) || meters <= 0.0 {
    return None
  }
  let mut p = 1
  while p < GEOHASH_MAX_PRECISION {
    let lng_bits = p * 5 / 2 + p * 5 % 2
    let lat_bits = p * 5 / 2
    let cell_w = 360.0 / pow2(lng_bits) * 111320.0
    let cell_h = 180.0 / pow2(lat_bits) * 110574.0
    let side = if cell_w > cell_h { cell_w } else { cell_h }
    if side <= meters {
      return Some(p)
    }
    p = p + 1
  }
  Some(GEOHASH_MAX_PRECISION)
}

///|
/// The geohash cells that cover a bounding box at `precision`. Cells are
/// returned in ascending latitude, then ascending longitude, and the list is
/// `None` when it would exceed `max_cells` (default 1,000). A box crossing the
/// antimeridian produces cells on both sides of the date line.
pub fn geohash_cover(
  box : BoundingBox,
  precision : Int,
  max_cells? : Int = 1000,
) -> Array[String]? {
  if precision < 1 || precision > GEOHASH_MAX_PRECISION || max_cells < 1 {
    return None
  }
  let bits = precision * 5
  let lng_bits = bits / 2 + bits % 2
  let lat_bits = bits / 2
  let columns = 1 << lng_bits
  let rows = 1 << lat_bits
  let width = 360.0 / columns.to_double()
  let height = 180.0 / rows.to_double()
  let row_start = clamp_int(
    ((box.south() + 90.0) / height).floor().to_int(),
    0,
    rows - 1,
  )
  let row_end = clamp_int(
    ((box.north() + 90.0) / height).floor().to_int(),
    0,
    rows - 1,
  )
  let segments : Array[(Int, Int)] = []
  if !box.crosses_antimeridian() {
    let start = clamp_int(
      ((box.west() + 180.0) / width).floor().to_int(),
      0,
      columns - 1,
    )
    let end = clamp_int(
      ((box.east() + 180.0) / width).floor().to_int(),
      0,
      columns - 1,
    )
    segments.push((start, end))
  } else {
    let west_start = clamp_int(
      ((box.west() + 180.0) / width).floor().to_int(),
      0,
      columns - 1,
    )
    segments.push((west_start, columns - 1))
    let east_end = clamp_int(
      ((box.east() + 180.0) / width).floor().to_int(),
      0,
      columns - 1,
    )
    segments.push((0, east_end))
  }
  let row_count = row_end - row_start + 1
  if row_count < 1 {
    return None
  }
  let mut total = 0
  for segment in segments {
    let column_count = segment.1 - segment.0 + 1
    if column_count < 1 {
      continue
    }
    // Guard the multiplication before it can overflow a 32-bit Int.
    if row_count > max_cells || column_count > max_cells {
      return None
    }
    if row_count * column_count > max_cells - total {
      return None
    }
    total = total + row_count * column_count
  }
  if total == 0 || total > max_cells {
    return None
  }
  let out : Array[String] = []
  for row in row_start..<=row_end {
    let lat = -90.0 + (row.to_double() + 0.5) * height
    for segment in segments {
      for column in segment.0..<=segment.1 {
        let lng = -180.0 + (column.to_double() + 0.5) * width
        match LatLng::new(lat, lng) {
          None => return None
          Some(center) =>
            match geohash_encode(center, precision) {
              None => return None
              Some(code) => out.push(code)
            }
        }
      }
    }
  }
  Some(out)
}

///|
/// Clamp an integer into `[low, high]`.
fn clamp_int(value : Int, low : Int, high : Int) -> Int {
  if value < low {
    low
  } else if value > high {
    high
  } else {
    value
  }
}

///|
/// `2.0 ^ n` for a small non-negative integer.
fn pow2(n : Int) -> Double {
  let mut p = 1.0
  for _ in 0..<n {
    p = p * 2.0
  }
  p
}
