{ stdenv, pkgs ? import <nixpkgs> {} }:

stdenv.mkDerivation {
  name = "openCalendar";
  src = ./.;
  
  buildInputs = with pkgs; [ kitty calcurse ];
  
  installPhase = ''
    mkdir -p $out/bin
    cp openCalendar.sh $out/bin/openCalendar
    cp kitty.conf $out/bin/
    cp divergencemeter.png $out/bin/
    chmod +x $out/bin/openCalendar
  '';
}

