///|
pub fn LocationFormat::name(self : LocationFormat) -> String {
  match self {
    GeoUri => "geo-uri"
    PlusCode => "plus-code"
    Maidenhead => "maidenhead"
    GeoHash => "geohash"
    Decimal => "decimal"
    Dms => "dms"
  }
}
