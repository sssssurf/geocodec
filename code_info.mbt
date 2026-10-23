// Human-scale facts about a location code: where it points, how large its
// cell is on the ground, and how the code was written.

///|
/// A decoded code with its ground size. `precision_m` is the longer side of
/// the cell in metres at the code's latitude; `area_m2` is the rectangle's
/// approximate area on the ground.
pub(all) struct CodeInfo {
  format : LocationFormat
  point : LatLng
  bounds : BoundingBox
  precision_m : Double
  area_m2 : Double
} derive(Eq)

///|
/// Describe a Geohash, Plus Code or Maidenhead locator.
pub fn describe_code(text : String) -> CodeInfo? {
  let s = trim_ascii(text)
  let plus = pluscode_bounds(s)
  if plus is Some(b) {
    return build_info(PlusCode, b)
  }
  let maidenhead = maidenhead_bounds(s)
  if maidenhead is Some(b) {
    return build_info(Maidenhead, b)
  }
  let geohash_box = geohash_bounds(s)
  if geohash_box is Some(b) {
    return build_info(GeoHash, b)
  }
  None
}

///|
fn build_info(format : LocationFormat, bounds : BoundingBox) -> CodeInfo? {
  let point = match bounds.center() {
    None => return None
    Some(p) => p
  }
  let width_m = bounds.width() * 111320.0 * @math.cos(to_radians(point.lat()))
  let height_m = bounds.height() * 110574.0
  let precision = if width_m > height_m { width_m } else { height_m }
  Some({
    format,
    point,
    bounds,
    precision_m: precision,
    area_m2: width_m * height_m,
  })
}
