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
/// - `region` always contains `point` geometrically, not necessarily the
///   physical subject when its accuracy is unknown;
/// - `kind == Cell` means `region` is the exact cell, `point` is its centre;
/// - `kind == Point` means the notation itself is a point; when `u=` is given
///   the region is the square envelope of that uncertainty;
/// - `resolution_m` is the longer side of the region in metres (0 when the
///   notation carries no extent);
/// - `uncertainty_m` is an optional coverage bound, never a zero placeholder;
/// - `cell_radius_m` describes grid geometry, independently of input accuracy;
/// - `raw` keeps the text that produced the value, so the original notation is
///   never lost even when the point/region is converted further.
pub struct Location {
  format : LocationFormat
  kind : LocationKind
  point : LatLng
  region : BoundingBox
  resolution_m : Double
  uncertainty_m : Double?
  cell_radius_m : Double?
  area_m2 : Double
  altitude_m : Double?
  crs : String?
  raw : String
} derive(Eq)

///|
/// Build a cell location from its exact bounds. The representative point is
/// the centre; the resolution is the longer side of the cell on the ground,
/// and the uncertainty is a conservative bound from the centre to any corner.
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
  let resolution = if width_m > height_m { width_m } else { height_m }
  Some({
    format,
    kind: Cell,
    point,
    region: bounds,
    resolution_m: resolution,
    uncertainty_m: Some(cell_radius_bound(bounds)),
    cell_radius_m: Some(cell_radius_bound(bounds)),
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
  if uncertainty_m is Some(u) && (!is_finite(u) || u < 0.0) {
    return None
  }
  match uncertainty_m {
    Some(u) if u > 0.0 && is_finite(u) => {
      // A sphere with radius below WGS84's minimum curvature radius gives
      // a conservative angular envelope, including at poles and date lines.
      let angle = u / 6335000.0
      let lat_delta = angle / 0.017453292519943295
      let cos_lat = @math.cos(to_radians(point.lat()))
      let touches_pole = point.lat().abs() + lat_delta >= 90.0
      let lng_delta = if touches_pole {
        180.0
      } else {
        @math.asin(@math.sin(angle) / cos_lat) / 0.017453292519943295
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
            uncertainty_m: Some(u),
            cell_radius_m: None,
            area_m2: if u > 20000000.0 {
              510100000000000.0
            } else {
              4.0 * u * u
            },
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
        uncertainty_m,
        cell_radius_m: None,
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
/// Notation geometry: the exact cell, a point's u envelope, or its degenerate
/// coordinate. For a physical-position envelope use `uncertainty_bounds`;
/// neither a degenerate coordinate nor a converted cell certifies accuracy.
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
/// Quantise the representative point and propagate source uncertainty.
/// The target region is grid geometry, not a new measurement. Unknown source
/// accuracy stays None even through repeated conversions; a known bound grows
/// by the centre displacement and covers at least the target cell geometry.
/// `precision` means characters for Geohash, significant digits for Plus Code
/// and characters for Maidenhead.
pub fn Location::to_cell(
  self : Location,
  format : LocationFormat,
  precision : Int32,
) -> Location? {
  let code = match format {
    GeoHash => geohash_encode(self.point, precision)
    PlusCode => pluscode_encode(self.point, code_length=precision)
    Maidenhead => maidenhead_encode(self.point, precision~)
    _ => None
  }
  match code {
    None => None
    Some(text) => {
      let target = match describe_code(text) {
        None => return None
        Some(v) => v
      }
      let uncertainty = match self.uncertainty_m {
        None => None
        Some(u) => {
          let sum = u + center_shift_bound(self.point, target.point)
          let propagated = sum + sum * 1.0e-12 + 1.0e-9
          if !is_finite(propagated) {
            None // No finite bound is representable; never claim zero.
          } else {
            let radius = target.cell_radius_m.unwrap()
            Some(if propagated > radius { propagated } else { radius })
          }
        }
      }
      Some({ ..target, uncertainty_m: uncertainty, })
    }
  }
}

///|
/// Whether a finite coverage bound is known. Derived from the optional value.
pub fn Location::uncertainty_known(self : Location) -> Bool {
  self.uncertainty_m is Some(_)
}

///|
/// Conservative horizontal envelope of the stated/propagated uncertainty.
/// None means no finite envelope is known. Unlike `bounds`, this does not
/// mistake the coordinate or quantised grid cell for the true-position region.
pub fn Location::uncertainty_bounds(self : Location) -> BoundingBox? {
  let u = match self.uncertainty_m {
    None => return None
    Some(v) => v
  }
  match point_location(self.format, self.raw, self.point, None, None, Some(u)) {
    None => None
    Some(loc) => Some(loc.region)
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
/// Render a representative point with its known/propagated uncertainty.
/// Unknown accuracy omits u, including after conversion to a grid. A freshly
/// decoded cell carries its geometric covering radius. Rectangle shape is lost.
pub fn Location::to_geouri(self : Location) -> String {
  // Keep all point-URI precision and parameters, including explicit u=0.
  if self.format == GeoUri {
    return self.raw
  }
  let mut out = "geo:" +
    trim_fraction(format_fixed(self.point.lat(), 9)) +
    "," +
    trim_fraction(format_fixed(self.point.lng(), 9))
  match self.altitude_m {
    None => ()
    Some(v) => out = out + "," + trim_fraction(format_fixed(v, 3))
  }
  match self.crs {
    None => ()
    Some(v) => out = out + ";crs=" + v
  }
  if self.uncertainty_m is Some(u) {
    // Round outward and include the displacement from coordinate rounding.
    let radius = u + 0.0002 + u * 1.0e-12
    if is_finite(radius) {
      // Keep fixed-point integer conversion within range, even for huge u.
      let rendered = if radius < 1.0e12 {
        trim_fraction(format_fixed((radius * 1000.0).ceil() / 1000.0, 3))
      } else {
        decimal_notation(radius)
      }
      out = out + ";u=" + rendered
    }
  }
  out
}

///|
/// Conservative WGS84 surface-distance bound along a straight path in angular
/// coordinates. 111700 m/degree bounds both meridional and equatorial scales.
/// This is a covering bound, not an ellipsoidal geodesic measurement.
fn cell_radius_bound(box : BoundingBox) -> Double {
  let near_lat = if box.south() <= 0.0 && box.north() >= 0.0 {
    0.0
  } else if box.south().abs() < box.north().abs() {
    box.south().abs()
  } else {
    box.north().abs()
  }
  let h = box.height() / 2.0
  let w = box.width() / 2.0 * @math.cos(to_radians(near_lat))
  111700.0 * (h * h + w * w).sqrt()
}

///|
/// An explicit conversion record retains source geometry, text and accuracy.
/// `uncertainty_bound_m` bounds the source position around the target centre;
/// None means the accuracy is unknown or no finite bound is representable.
pub struct LocationConversion {
  source : Location
  target : Location
  center_shift_bound_m : Double
  uncertainty_bound_m : Double?
}

///|
pub fn Location::convert_to_cell(
  self : Location,
  format : LocationFormat,
  precision : Int32,
) -> LocationConversion? {
  let target = match self.to_cell(format, precision) {
    None => return None
    Some(v) => v
  }
  let shift = center_shift_bound(self.point, target.point)
  Some({
    source: self,
    target,
    center_shift_bound_m: shift,
    uncertainty_bound_m: target.uncertainty_m,
  })
}

///|
fn center_shift_bound(source : LatLng, target : LatLng) -> Double {
  let lat = source.lat() - target.lat()
  let lng = lng_delta(source.lng(), target.lng())
  111700.0 * (lat * lat + lng * lng).sqrt()
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

///|
pub extend LocationKind with Eq::{not_equal, equal}

///|
pub extend LocationKind with @moonbitlang/core/debug.Debug::{to_repr}

///|
pub extend LocationKind with Show::{output, to_string}

///|
pub extend Location with Eq::{not_equal, equal}
