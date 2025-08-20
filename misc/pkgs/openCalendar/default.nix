{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "openCalendar";
  runtimeInputs = with pkgs; [ kitty calcurse ];
  text = builtins.readFile ./openCalendar.sh;
})

