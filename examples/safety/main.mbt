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
  println(
    "plus_boundary: " +
    @geocodec.pluscode_encode(
      @geocodec.LatLng::new(40.6, 129.7).unwrap(),
      code_length=8,
    ).unwrap(),
  )
  println(
    "plus_west_neighbor: " +
    @geocodec.pluscode_encode(
      @geocodec.LatLng::new(40.6, 129.69999999999996).unwrap(),
      code_length=8,
    ).unwrap(),
  )
  println(
    "plus_south_neighbor: " +
    @geocodec.pluscode_encode(
      @geocodec.LatLng::new(40.599999999999994, 129.7).unwrap(),
      code_length=8,
    ).unwrap(),
  )
  let from_text = @geocodec.parse_location("-2.804,7.003").unwrap()
  println(
    "text_pluscode: " + from_text.to_cell(@geocodec.PlusCode, 13).unwrap().raw,
  )
  let edge = @geocodec.BoundingBox::new(-1.0, 179.0, 1.0, 180.0).unwrap()
  println(
    "date_line_alias: " +
    edge.contains(@geocodec.LatLng::new(0.0, -180.0).unwrap()).to_string(),
  )
  println(
    "DMS_seconds_positive: " +
    (@geocodec.parse_dms("51d30m26.5s", true).unwrap() > 0.0).to_string(),
  )
  let almost_world = @geocodec.BoundingBox::new(-1.0, 170.0, 1.0, 160.0).unwrap()
  println(
    "unique_cover_budget: " +
    (@geocodec.geohash_cover(almost_world, 1, max_cells=16).unwrap().length() ==
    16).to_string(),
  )
}
