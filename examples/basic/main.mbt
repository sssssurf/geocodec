// A small end-to-end example: parse a cell, inspect its region and precision,
// convert it to a point+uncertainty URI, and scan a sentence.
//
// Run with:
//   moon run examples/basic

///|
fn main {
  let cell = @geocodec.parse_location("8FVC9G8F+6X").unwrap()
  println("format: " + cell.format.name())
  println("kind: " + (if cell.is_cell() { "cell" } else { "point" }))
  println("point: " + cell.point.to_text(digits=6))
  println("region: " + cell.region.to_text(digits=6))
  println("resolution_m: " + @geocodec.format_fixed(cell.resolution_m, 3))
  println("uncertainty_m: " + @geocodec.format_fixed(cell.uncertainty_m, 3))
  println("as_geouri: " + cell.to_geouri())

  let coarse = cell.to_cell(@geocodec.GeoHash, 6).unwrap()
  println(
    "as_geohash6: " +
    coarse.raw +
    " (" +
    @geocodec.format_fixed(coarse.resolution_m, 1) +
    " m)",
  )

  let text = "Meet at 8FVC9G8F+6X near IO91WM, or send geo:48.198634,16.371648;u=40."
  let found = @geocodec.parse_codes(text)
  println("scanned: " + found.length().to_string())
  for item in found {
    println("  " + item.format.name() + " " + item.point.to_text(digits=6))
  }
}
