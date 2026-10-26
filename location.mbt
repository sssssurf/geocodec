// One value for every supported notation.
//
// A Geohash/Plus Code/Maidenhead string denotes a *cell*: it has an extent,
// a resolution and a centre, and reducing it to a point loses the extent.
// A decimal pair, DMS pair or `geo:` URI denotes a *point*; a `geo:` URI may
// also carry an explicit uncertainty (`u=`). `Location` keeps both the
// representative point and the region, so a conversion can say what it lost
// instead of silently returning a centre.

///|
/// Whether the source notation denotes a cell or a point.
pub(all) enum LocationKind {
  Cell
  Point
} derive(Eq, Debug)

///|
pub impl Show for LocationKind with fn to_string(self : LocationKind) -> String {
  match self {
    Cell => "cell"
    Point => "point"
  }
}

///|
/// A parsed location with its region, resolution and uncertainty.
///
/// Invariants:
/// - `region` always contains `point`;
/// - `kind == Cell` means `region` is the exact cell, `point` is its centre;
/// - `kind == Point` means the notation itself is a point; when `u=` is given
///   the region is the square envelope of that uncertainty;
/// - `resolution_m` is the longer side of the region in metres (0 when the
///   notation carries no extent);
/// - `uncertainty_m` is the greatest distance from `point` to the region
///   boundary (0 for an exact point);
/// - `raw` keeps the text that produced the value, so the original notation is
///   never lost even when the point/region is converted further.
pub(all) struct Location {
  format : LocationFormat
  kind : LocationKind
  point : LatLng
  region : BoundingBox
  resolution_m : Double
  uncertainty_m : Double
  area_m2 : Double
  altitude_m : Double?
  crs : String?
  raw : String
} derive(Eq)

///|
/// Build a cell location from its exact bounds. The representative point is
/// the centre; the resolution is the longer side of the cell on the ground,
/// and the uncertainty is the distance from the centre to a corner.
fn cell_location(
  format : LocationFormat,
  raw : String,
  bounds : BoundingBox,
) -> Location? {
  let point = match bounds.center() {
    None => return None
    Some(p) => p
  }
  let width_m = bounds.width() * 111320.0 * @math.cos(to_radians(point.lat()))
  let height_m = bounds.height() * 110574.0
  let half_w = width_m / 2.0
  let half_h = height_m / 2.0
  let resolution = if width_m > height_m { width_m } else { height_m }
  Some({
    format,
    kind: Cell,
    point,
    region: bounds,
    resolution_m: resolution,
    uncertainty_m: (half_w * half_w + half_h * half_h).sqrt(),
    area_m2: width_m * height_m,
    altitude_m: None,
    crs: None,
    raw,
  })
}

///|
/// Build a point location. `uncertainty_m` is the `u=` value from a `geo:`
/// URI, if any; it expands the region to a square envelope around the point.
fn point_location(
  format : LocationFormat,
  raw : String,
  point : LatLng,
  altitude_m : Double?,
  crs : String?,
  uncertainty_m : Double?,
) -> Location? {
  match uncertainty_m {
    Some(u) if u > 0.0 && is_finite(u) => {
      let lat_delta = u / 110574.0
      let cos_lat = @math.cos(to_radians(point.lat()))
      let lng_delta = if cos_lat < 1.0e-12 {
        180.0
      } else {
        u / (111320.0 * cos_lat)
      }
      let region = if lat_delta >= 90.0 {
        BoundingBox::new(-90.0, -180.0, 90.0, 180.0)
      } else if lng_delta >= 180.0 {
        BoundingBox::new(
          clamp_lat(point.lat() - lat_delta),
          -180.0,
          clamp_lat(point.lat() + lat_delta),
          180.0,
        )
      } else {
        BoundingBox::new(
          clamp_lat(point.lat() - lat_delta),
          point.lng() - lng_delta,
          clamp_lat(point.lat() + lat_delta),
          point.lng() + lng_delta,
        )
      }
      match region {
        None => return None
        Some(box) =>
          Some({
            format,
            kind: Point,
            point,
            region: box,
            resolution_m: 2.0 * u,
            uncertainty_m: u,
            area_m2: 4.0 * u * u,
            altitude_m,
            crs,
            raw,
          })
      }
    }
    _ => {
      let region = match
        BoundingBox::new(point.lat(), point.lng(), point.lat(), point.lng()) {
        None => return None
        Some(b) => b
      }
      Some({
        format,
        kind: Point,
        point,
        region,
        resolution_m: 0.0,
        uncertainty_m: 0.0,
        area_m2: 0.0,
        altitude_m,
        crs,
        raw,
      })
    }
  }
}

///|
/// The representative point (cell centre, or the coordinate itself).
pub fn Location::center(self : Location) -> LatLng {
  self.point
}

///|
/// The region: the exact cell for a cell code, the uncertainty envelope for a
/// point with `u=`, or a degenerate box at the point otherwise.
pub fn Location::bounds(self : Location) -> BoundingBox {
  self.region
}

///|
/// True when the source notation denotes an area rather than a point.
pub fn Location::is_cell(self : Location) -> Bool {
  self.kind == Cell
}

///|
/// True when the source notation denotes a point.
pub fn Location::is_point(self : Location) -> Bool {
  self.kind == Point
}

///|
/// Quantise the representative point to a cell of `format` at `precision`.
/// This is the explicit point→cell conversion: the result is a new `Location`
/// whose `region` is the cell that contains `point`, so the caller can compare
/// the new `resolution_m`/`uncertainty_m` with the source's and see the loss.
/// `precision` means characters for Geohash, significant digits for Plus Code
/// and characters for Maidenhead.
pub fn Location::to_cell(
  self : Location,
  format : LocationFormat,
  precision : Int,
) -> Location? {
  let code = match format {
    GeoHash => geohash_encode(self.point, precision)
    PlusCode => pluscode_encode(self.point, code_length=precision)
    Maidenhead => maidenhead_encode(self.point, precision~)
    _ => None
  }
  match code {
    None => None
    Some(text) => describe_code(text)
  }
}

///|
/// True when the point lies inside the region.
pub fn Location::contains_point(self : Location, point : LatLng) -> Bool {
  self.region.contains(point)
}

///|
/// True when every point of `other` is inside this region. A cell can contain
/// a point only when the point is inside the cell; a point can contain only a
/// degenerate point at the same coordinate.
pub fn Location::contains(self : Location, other : Location) -> Bool {
  box_contains(self.region, other.region)
}

///|
/// True when the two regions overlap (touching edges count).
pub fn Location::intersects(self : Location, other : Location) -> Bool {
  self.region.intersects(other.region)
}

///|
/// Render the representative point as an RFC 5870 `geo:` URI. A cell becomes
/// its centre plus `;u=<half diagonal>`, so the circle around the point covers
/// the original cell; the shape (rectangle) is still lost, which is exactly
/// what `region` is for.
pub fn Location::to_geouri(self : Location) -> String {
  let mut out = "geo:" +
    trim_fraction(format_fixed(self.point.lat(), 6)) +
    "," +
    trim_fraction(format_fixed(self.point.lng(), 6))
  match self.altitude_m {
    None => ()
    Some(v) => out = out + "," + trim_fraction(format_fixed(v, 3))
  }
  if self.uncertainty_m > 0.0 {
    out = out + ";u=" + trim_fraction(format_fixed(self.uncertainty_m, 3))
  }
  match self.crs {
    None => ()
    Some(v) => out = out + ";crs=" + v
  }
  out
}

///|
/// Whether `outer` contains every point of `inner`, antimeridian included.
fn box_contains(outer : BoundingBox, inner : BoundingBox) -> Bool {
  let eps = 1.0e-9
  if inner.south() < outer.south() - eps || inner.north() > outer.north() + eps {
    return false
  }
  let ow = outer.west()
  let oe = outer.east()
  let iw = inner.west()
  let ie = inner.east()
  let outer_cross = ow > oe
  let inner_cross = iw > ie
  if !inner_cross {
    if !outer_cross {
      iw >= ow - eps && ie <= oe + eps
    } else {
      (iw >= ow - eps && ie <= 180.0 + eps) ||
      (iw >= -180.0 - eps && ie <= oe + eps)
    }
  } else if !outer_cross {
    // A non-crossing outer box can contain a crossing inner box only if it
    // spans the whole longitude range.
    ow <= -180.0 + eps && oe >= 180.0 - eps
  } else {
    iw >= ow - eps && ie <= oe + eps
  }
}

///|
/// Describe a Geohash, Plus Code or Maidenhead locator as a `Location`.
pub fn describe_code(text : String) -> Location? {
  let s = trim_ascii(text)
  match pluscode_bounds(s) {
    Some(b) => return cell_location(PlusCode, s, b)
    None => ()
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
