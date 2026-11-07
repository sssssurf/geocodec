# Third-party data and references

The library implementation is MoonBit code licensed under Apache-2.0.
The pinned test fixtures under data/olc come from Google Open Location Code,
commit 83986da0156bbf51fba33d0327d8ca4b7f955c89, licensed under Apache-2.0.
Copyright Google Inc. and the Open Location Code authors. Their complete
license is retained in data/olc/LICENSE. Fixture contents are unmodified;
paths, exact hashes and counts are recorded in data/olc/provenance.json.

olc_official_test.mbt is generated from those published test vectors. The
separate adjacent-float checks use Python's Decimal for exact decimal scaling
and the pinned upstream encodeIntegers operation for independent expected
digits. Upstream source implementations are not shipped with the runtime.
The library does not call JavaScript, Python, BigInt or a network service.

Other algorithm references are the RFC 5870 geo URI specification, the geohash
description and the IARU Maidenhead scheme. No third-party runtime package or
implementation is vendored. See LICENSE and docs/pluscode-conformance.md.
