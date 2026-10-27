// Command-line front end for geocodec.
//
// Every subcommand is a thin wrapper over the library: it parses its arguments
// with the same total functions a caller would use, prints a short report, and
// never panics on bad input. The output is the contract recorded in README.md
// and docs/reproducible-demo.md, so keep it stable.

///|
fn main {
  let args = @env.args()
  // `moon run` may pass a runtime and a script path before the user's words
  // (node and main.js for the js backend, just the binary for native), so the
  // command is the first token that names one.
  let mut start = 1
  while start < args.length() && !is_command(args[start]) {
    start = start + 1
  }
  if start >= args.length() {
    print_usage()
    return
  }
  let command = args[start]
  let shifted : Array[String] = ["", ""]
  for i = start + 1; i < args.length(); i = i + 1 {
    shifted.push(args[i])
  }
  match command {
    "parse" => run_parse(arg_at(shifted, 2))
    "geohash" => run_geohash(shifted)
    "plus" => run_plus(shifted)
    "maidenhead" => run_maidenhead(shifted)
    "bbox" => run_bbox(arg_at(shifted, 2))
    "geouri" => run_geouri(arg_at(shifted, 2))
    "dms" => run_dms(shifted)
    "scan" => run_scan(join_from(shifted, 2))
    "cover" => run_cover(shifted)
    "info" => run_info(arg_at(shifted, 2))
    "convert" => run_convert(shifted)
    "json" => run_json(arg_at(shifted, 2))
    "demo" => run_demo()
    _ => print_usage()
  }
}

///|
fn is_command(text : String) -> Bool {
  match text {
    "parse"
    | "geohash"
    | "plus"
    | "maidenhead"
    | "bbox"
    | "geouri"
    | "dms"
    | "scan"
    | "cover"
    | "info"
    | "convert"
    | "json"
    | "demo" => true
    _ => false
  }
}

///|
fn print_usage() -> Unit {
  println(
    "usage: geocodec <command> [args]\n" +
    "  parse <coordinate>                     recognise any supported notation\n" +
    "  geohash <lat> <lng> [precision]        encode a geohash (default 7)\n" +
    "  plus <lat> <lng> [length]              encode a Plus Code (default 10)\n" +
    "  maidenhead <lat> <lng> [length]        encode a Maidenhead locator (default 6)\n" +
    "  bbox <code>                            bounds of a geohash, Plus Code or locator\n" +
    "  geouri <uri>                           parse an RFC 5870 geo: URI\n" +
    "  dms <value> <lat|lng>                  render decimal degrees as DMS\n" +
    "  scan <text>                            find every code in a sentence\n" +
    "  cover <south> <west> <north> <east> <precision> [max]\n" +
    "                                         geohash cells covering a box\n" +
    "  info <code>                            format, point, bounds, ground size\n" +
    "  convert <code> <geohash|plus|maidenhead> <precision>\n" +
    "                                         explicit point/cell quantisation\n" +
    "  json <code>                            one-line JSON (for scripts and agents)\n" +
    "  demo                                   a fixed tour of the codecs",
  )
}

///|
fn arg_at(args : Array[String], index : Int32) -> String {
  if index < args.length() {
    args[index]
  } else {
    ""
  }
}

///|
fn join_from(args : Array[String], index : Int32) -> String {
  let out = StringBuilder()
  let mut i = index
  while i < args.length() {
    if i > index {
      out.write_char(' ')
    }
    out.write_stringview(args[i])
    i = i + 1
  }
  out.to_string()
}

///|
fn point_from(lat_text : String, lng_text : String) -> @geocodec.LatLng? {
  let lat = @geocodec.parse_decimal(lat_text)
  let lng = @geocodec.parse_decimal(lng_text)
  match (lat, lng) {
    (Some(a), Some(b)) => @geocodec.LatLng::new(a, b)
    _ => None
  }
}

///|
fn show_point(p : @geocodec.LatLng) -> Unit {
  println("point: " + p.to_text(digits=6))
  println(
    "dms: " +
    @geocodec.format_dms(p.lat(), true) +
    " " +
    @geocodec.format_dms(p.lng(), false),
  )
}

///|
fn show_bounds(b : @geocodec.BoundingBox) -> Unit {
  println("bounds: " + b.to_text(digits=6))
  match b.center() {
    Some(c) => println("center: " + c.to_text(digits=6))
    None => println("center: (unavailable)")
  }
}

///|
fn show_location(loc : @geocodec.Location) -> Unit {
  println("format: " + loc.format.name())
  if loc.is_cell() {
    println("kind: cell")
  } else {
    println("kind: point")
  }
  show_point(loc.point)
  println("region: " + loc.region.to_text(digits=6))
  println("resolution_m: " + @geocodec.format_fixed(loc.resolution_m, 3))
  println("uncertainty_m: " + @geocodec.format_fixed(loc.uncertainty_m, 3))
  println("uncertainty_known: " + loc.uncertainty_known.to_string())
  println("area_m2: " + @geocodec.format_fixed(loc.area_m2, 3))
  match loc.altitude_m {
    Some(v) => println("altitude_m: " + @geocodec.format_fixed(v, 3))
    None => println("altitude_m: (none)")
  }
  match loc.crs {
    Some(v) => println("crs: " + v)
    None => println("crs: wgs84")
  }
  println("raw: " + loc.raw)
  println("as_geouri: " + loc.to_geouri())
}

///|
fn run_parse(text : String) -> Unit {
  match @geocodec.parse_location(text) {
    None => println("parse: not recognised")
    Some(found) => show_location(found)
  }
}

///|
fn run_geohash(args : Array[String]) -> Unit {
  let p = match point_from(arg_at(args, 2), arg_at(args, 3)) {
    None => {
      println("geohash: need a latitude and longitude")
      return
    }
    Some(v) => v
  }
  let precision = integer_arg(arg_at(args, 4), 7)
  let code = match @geocodec.geohash_encode(p, precision) {
    None => {
      println("geohash: precision must be between 1 and 12")
      return
    }
    Some(v) => v
  }
  println("geohash: " + code)
  show_point(p)
  match @geocodec.geohash_bounds(code) {
    Some(b) => show_bounds(b)
    None => ()
  }
}

///|
fn run_plus(args : Array[String]) -> Unit {
  let p = match point_from(arg_at(args, 2), arg_at(args, 3)) {
    None => {
      println("plus: need a latitude and longitude")
      return
    }
    Some(v) => v
  }
  let length = integer_arg(arg_at(args, 4), 10)
  let code = match @geocodec.pluscode_encode(p, code_length=length) {
    None => {
      println("plus: length must be 2, 4, 6, 8, 10, 11, 12, 13, 14 or 15")
      return
    }
    Some(v) => v
  }
  println("plus: " + code)
  show_point(p)
  match @geocodec.pluscode_bounds(code) {
    Some(b) => show_bounds(b)
    None => ()
  }
}

///|
fn run_maidenhead(args : Array[String]) -> Unit {
  let p = match point_from(arg_at(args, 2), arg_at(args, 3)) {
    None => {
      println("maidenhead: need a latitude and longitude")
      return
    }
    Some(v) => v
  }
  let length = integer_arg(arg_at(args, 4), 6)
  let locator = match @geocodec.maidenhead_encode(p, precision=length) {
    None => {
      println("maidenhead: length must be even, from 2 to 10")
      return
    }
    Some(v) => v
  }
  println("maidenhead: " + locator)
  show_point(p)
  match @geocodec.maidenhead_bounds(locator) {
    Some(b) => show_bounds(b)
    None => ()
  }
}

///|
fn run_bbox(code : String) -> Unit {
  match @geocodec.pluscode_bounds(code) {
    Some(b) => {
      println("format: plus-code")
      show_bounds(b)
      return
    }
    None => ()
  }
  match @geocodec.maidenhead_bounds(code) {
    Some(b) => {
      println("format: maidenhead")
      show_bounds(b)
      return
    }
    None => ()
  }
  match @geocodec.geohash_bounds(code) {
    Some(b) => {
      println("format: geohash")
      show_bounds(b)
      return
    }
    None => ()
  }
  println("bbox: not a recognised code")
}

///|
fn run_geouri(text : String) -> Unit {
  match @geocodec.parse_location(text) {
    None => println("geouri: not a valid geo: URI")
    Some(loc) => {
      if loc.format != @geocodec.GeoUri {
        println("geouri: not a valid geo: URI")
        return
      }
      show_location(loc)
      println("formatted: " + loc.to_geouri())
    }
  }
}

///|
fn run_dms(args : Array[String]) -> Unit {
  let value = @geocodec.parse_decimal(arg_at(args, 2))
  let kind = @geocodec.ascii_upper(arg_at(args, 3))
  let is_lat = kind == "LAT" || kind == "LATITUDE"
  let is_lng = kind == "LNG" || kind == "LON" || kind == "LONGITUDE"
  match value {
    None => println("dms: need a decimal value")
    Some(v) =>
      if is_lat {
        println(@geocodec.format_dms(v, true))
      } else if is_lng {
        println(@geocodec.format_dms(v, false))
      } else {
        println("dms: the second argument must be lat or lng")
      }
  }
}

///|
fn run_scan(text : String) -> Unit {
  let found = @geocodec.parse_codes(text, max_results=20)
  println("found: " + found.length().to_string())
  for item in found {
    let kind = if item.is_cell() { "cell" } else { "point" }
    println(
      item.format.name() +
      ": " +
      item.point.to_text(digits=6) +
      " [" +
      kind +
      ", " +
      @geocodec.format_fixed(item.resolution_m, 1) +
      " m]",
    )
  }
}

///|
fn run_cover(args : Array[String]) -> Unit {
  let south = @geocodec.parse_decimal(arg_at(args, 2))
  let west = @geocodec.parse_decimal(arg_at(args, 3))
  let north = @geocodec.parse_decimal(arg_at(args, 4))
  let east = @geocodec.parse_decimal(arg_at(args, 5))
  let precision = integer_arg(arg_at(args, 6), 0)
  let max_cells = integer_arg(arg_at(args, 7), 1000)
  match (south, west, north, east) {
    (Some(s), Some(w), Some(n), Some(e)) => {
      let box = match @geocodec.BoundingBox::new(s, w, n, e) {
        None => {
          println("cover: not a valid box")
          return
        }
        Some(b) => b
      }
      let cells = match @geocodec.geohash_cover(box, precision, max_cells~) {
        None => {
          println("cover: too many cells, or an invalid precision")
          return
        }
        Some(v) => v
      }
      println("cells: " + cells.length().to_string())
      for code in cells {
        println(code)
      }
    }
    _ => println("cover: need south, west, north, east, precision")
  }
}

///|
fn run_info(code : String) -> Unit {
  match @geocodec.describe_code(code) {
    None => println("info: not a geohash, Plus Code or locator")
    Some(loc) => show_location(loc)
  }
}

///|
fn run_convert(args : Array[String]) -> Unit {
  let code = arg_at(args, 2)
  let format = @geocodec.ascii_lower(arg_at(args, 3))
  let precision = integer_arg(arg_at(args, 4), -1)
  if code == "" || format == "" || precision < 0 {
    println("convert: need a code, a target format and a precision")
    return
  }
  let target = match format {
    "geohash" => @geocodec.GeoHash
    "plus" | "plus-code" => @geocodec.PlusCode
    "maidenhead" => @geocodec.Maidenhead
    _ => {
      println("convert: target must be geohash, plus or maidenhead")
      return
    }
  }
  let source = match @geocodec.parse_location(code) {
    None => {
      println("convert: source is not a recognised location")
      return
    }
    Some(loc) => loc
  }
  println("source:")
  show_location(source)
  match source.convert_to_cell(target, precision) {
    None => println("convert: cannot encode at this precision")
    Some(conversion) => {
      println("converted:")
      show_location(conversion.target)
      match conversion.uncertainty_bound_m {
        Some(u) =>
          println("source_uncertainty_bound_m: " + @geocodec.format_fixed(u, 3))
        None => println("source_uncertainty_bound_m: (unspecified)")
      }
    }
  }
}

///|
fn run_json(code : String) -> Unit {
  let loc = match @geocodec.parse_location(code) {
    None => {
      println("{\"error\":\"not a recognised location\"}")
      return
    }
    Some(loc) => loc
  }
  let kind = if loc.is_cell() { "cell" } else { "point" }
  let altitude = match loc.altitude_m {
    Some(v) => @geocodec.format_fixed(v, 3)
    None => "null"
  }
  let crs = match loc.crs {
    Some(v) => "\"" + json_escape(v) + "\""
    None => "null"
  }
  println(
    "{\"format\":\"" +
    loc.format.name() +
    "\",\"kind\":\"" +
    kind +
    "\",\"lat\":" +
    @geocodec.format_fixed(loc.point.lat(), 9) +
    ",\"lng\":" +
    @geocodec.format_fixed(loc.point.lng(), 9) +
    ",\"south\":" +
    @geocodec.format_fixed(loc.region.south(), 9) +
    ",\"west\":" +
    @geocodec.format_fixed(loc.region.west(), 9) +
    ",\"north\":" +
    @geocodec.format_fixed(loc.region.north(), 9) +
    ",\"east\":" +
    @geocodec.format_fixed(loc.region.east(), 9) +
    ",\"resolution_m\":" +
    @geocodec.format_fixed(loc.resolution_m, 3) +
    ",\"uncertainty_m\":" +
    @geocodec.format_fixed(loc.uncertainty_m, 3) +
    ",\"uncertainty_known\":" +
    loc.uncertainty_known.to_string() +
    ",\"area_m2\":" +
    @geocodec.format_fixed(loc.area_m2, 3) +
    ",\"altitude_m\":" +
    altitude +
    ",\"crs\":" +
    crs +
    ",\"raw\":\"" +
    json_escape(loc.raw) +
    "\",\"as_geouri\":\"" +
    json_escape(loc.to_geouri()) +
    "\"}",
  )
}

///|
fn json_escape(text : String) -> String {
  let out = StringBuilder()
  for ch in text {
    if ch == '"' {
      out.write_stringview("\\\"")
    } else if ch == '\\' {
      out.write_stringview("\\\\")
    } else if ch.to_int() < 32 {
      out.write_char(' ')
    } else {
      out.write_char(ch)
    }
  }
  out.to_string()
}

///|
fn integer_arg(text : String, fallback : Int32) -> Int32 {
  match @geocodec.parse_decimal(text) {
    None => fallback
    Some(v) => if v < 0.0 { fallback } else { v.to_int() }
  }
}

///|
fn run_demo() -> Unit {
  let places : Array[(String, @geocodec.LatLng)] = [
    ("Beijing", @geocodec.LatLng::new(39.9042, 116.4074).unwrap()),
    ("London", @geocodec.LatLng::new(51.5074, -0.1278).unwrap()),
    ("Sydney", @geocodec.LatLng::new(-33.8688, 151.2093).unwrap()),
  ]
  for entry in places {
    let name = entry.0
    let p = entry.1
    println("== " + name + " ==")
    show_point(p)
    match @geocodec.geohash_encode(p, 9) {
      Some(v) => println("geohash: " + v)
      None => ()
    }
    match @geocodec.pluscode_encode(p, code_length=10) {
      Some(v) => println("plus: " + v)
      None => ()
    }
    match @geocodec.maidenhead_encode(p, precision=8) {
      Some(v) => println("maidenhead: " + v)
      None => ()
    }
  }
}
