{ stdenv, ... }:
stdenv.mkDerivation {
  name = "nrdxp.dev";
  src = ./site/build;
  installPhase =
  ''
  mkdir -p "$out/www"
  cp -ra * "$out/www"
  '';
}
