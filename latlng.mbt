// The two value types every codec shares: a validated point and a bounding
// box that can cross the antimeridian.

///|
/// A WGS84 latitude/longitude pair in decimal degrees.
///
/// Values are only produced through a validating constructor, so a `LatLng`
/// always has a latitude in `[-90, 90]` and a finite, normalised longitude.
pub struct LatLng {
  lat : Double
  lng : Double
} derive(Eq)

///|
/// Build a point, or `None` when the latitude is outside `[-90, 90]` or either
/// value is not finite. A longitude outside `[-180, 180)` is wrapped.
pub fn LatLng::new(lat : Double, lng : Double) -> LatLng? {
  if !is_finite(lat) || !is_finite(lng) {
    return None
  }
  if lat < -90.0 || lat > 90.0 {
    return None
  }
  Some({ lat, lng: normalize_lng(lng), })
}

///|
/// The latitude in degrees.
pub fn LatLng::lat(self : LatLng) -> Double {
  self.lat
}

///|
/// The longitude in degrees, in `[-180, 180)`.
pub fn LatLng::lng(self : LatLng) -> Double {
  self.lng
}

///|
/// `lat, lng` with a fixed number of decimals.
pub fn LatLng::to_text(self : LatLng, digits~ : Int32 = 6) -> String {
  format_latlng(self.lat, self.lng, digits)
}

///|
/// A rectangle in degrees. `west > east` means the box crosses the
/// antimeridian; `east == 180` is allowed for a box ending at the date line.
pub struct BoundingBox {
  south : Double
  west : Double
  north : Double
  east : Double
} derive(Eq)

///|
/// Build a box. The latitude bounds must be ordered and inside `[-90, 90]`;
/// longitudes are wrapped into `[-180, 180]`. Returns `None` for non-finite
/// input.
pub fn BoundingBox::new(
  south : Double,
  west : Double,
  north : Double,
  east : Double,
) -> BoundingBox? {
  if !is_finite(south) ||
    !is_finite(west) ||
    !is_finite(north) ||
    !is_finite(east) {
    return None
  }
  if south < -90.0 || north > 90.0 || south > north {
    return None
  }
  let w = if west == 180.0 { 180.0 } else { normalize_lng(west) }
  let e = if east == 180.0 { 180.0 } else { normalize_lng(east) }
  Some({ south, west: w, north, east: e, })
}

///|
pub fn BoundingBox::south(self : BoundingBox) -> Double {
  self.south
}

///|
pub fn BoundingBox::west(self : BoundingBox) -> Double {
  self.west
}

///|
pub fn BoundingBox::north(self : BoundingBox) -> Double {
  self.north
}

///|
pub fn BoundingBox::east(self : BoundingBox) -> Double {
  self.east
}

///|
/// True when the box crosses the antimeridian.
pub fn BoundingBox::crosses_antimeridian(self : BoundingBox) -> Bool {
  self.west > self.east
}

///|
/// Width in degrees, always in `[0, 360]`.
pub fn BoundingBox::width(self : BoundingBox) -> Double {
  let w = if self.west > self.east {
    self.east + 360.0 - self.west
  } else {
    self.east - self.west
  }
  w
}

///|
/// Height in degrees, always in `[0, 180]`.
pub fn BoundingBox::height(self : BoundingBox) -> Double {
  self.north - self.south
}

///|
/// True when the point lies inside the box, antimeridian crossing included.
pub fn BoundingBox::contains(self : BoundingBox, point : LatLng) -> Bool {
  // Edges are inclusive. A tiny tolerance absorbs the difference between a
  // decimal coordinate and the rounded cell edge produced by a codec, without
  // letting a genuinely outside point in (1e-9 degrees is about 0.1 mm).
  let eps = 1.0e-9
  if point.lat() < self.south - eps || point.lat() > self.north + eps {
    return false
  }
  let lng = point.lng()
  if self.west <= self.east {
    lng >= self.west - eps && lng <= self.east + eps
  } else {
    lng >= self.west - eps || lng <= self.east + eps
  }
}

///|
/// The centre of the box. For a box crossing the antimeridian the centre is
/// normalised, so it may read `-179.5` rather than `180.5`.
pub fn BoundingBox::center(self : BoundingBox) -> LatLng? {
  let lat = (self.south + self.north) / 2.0
  let lng = if self.west <= self.east {
    (self.west + self.east) / 2.0
  } else {
    normalize_lng((self.west + self.east + 360.0) / 2.0)
  }
  LatLng::new(lat, lng)
}

///|
/// True when two boxes share any area (touching edges count).
pub fn BoundingBox::intersects(self : BoundingBox, other : BoundingBox) -> Bool {
  if self.north < other.south || other.north < self.south {
    return false
  }
  lng_in_range(other.west, self) ||
  lng_in_range(other.east, self) ||
  lng_in_range(self.west, other) ||
  lng_in_range(self.east, other)
}

///|
/// Whether a longitude falls inside a box's longitude span.
fn lng_in_range(lng : Double, box : BoundingBox) -> Bool {
  if box.west <= box.east {
    lng >= box.west && lng <= box.east
  } else {
    lng >= box.west || lng <= box.east
  }
}

///|
/// `south,west,north,east` with a fixed number of decimals.
pub fn BoundingBox::to_text(self : BoundingBox, digits~ : Int32 = 6) -> String {
  format_fixed(self.south, digits) +
  "," +
  format_fixed(self.west, digits) +
  "," +
  format_fixed(self.north, digits) +
  "," +
  format_fixed(self.east, digits)
}

///|
pub extend LatLng with Eq::{not_equal, equal}

///|
pub extend BoundingBox with Eq::{not_equal, equal}
