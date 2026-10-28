///|
fn main {
  let unknown = @geocodec.parse_location("geo:1,2").unwrap()
  println("unknown_is_none: " + (unknown.uncertainty_m is None).to_string())
  let first = unknown.to_cell(@geocodec.PlusCode, 10).unwrap()
  let second = first.to_cell(@geocodec.GeoHash, 8).unwrap()
  println(
    "chained_unknown_is_none: " + (second.uncertainty_m is None).to_string(),
  )
  println(
    "chained_URI_omits_u: " + (!second.to_geouri().contains(";u=")).to_string(),
  )
  let exact = @geocodec.parse_location("geo:1,2;u=0").unwrap()
  println("explicit_zero: " + (exact.uncertainty_m == Some(0.0)).to_string())
  println(
    "unknown_CRS_rejected: " +
    (@geocodec.geouri_parse("geo:1,2;crs=custom-grid") is None).to_string(),
  )
  let tiny = "geo:1.123456789123,2;u=0.0000001"
  println(
    "tiny_u_preserved: " +
    (@geocodec.geouri_format(@geocodec.geouri_parse(tiny).unwrap()) == tiny).to_string(),
  )
  let uncertain = @geocodec.parse_location("geo:48.198634,16.371648;u=40").unwrap()
  let fine = uncertain.to_cell(@geocodec.PlusCode, 15).unwrap()
  println(
    "fine_grid_keeps_40m_bound: " +
    (fine.uncertainty_m.unwrap() >= 40.0).to_string(),
  )
  println(
    "grid_radius_below_1cm: " + (fine.cell_radius_m.unwrap() < 0.01).to_string(),
  )
}
