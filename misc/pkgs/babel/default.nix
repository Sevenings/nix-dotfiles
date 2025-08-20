{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "babel";
  runtimeInputs = with pkgs; [ babel ];
  text = builtins.readFile ./babel.sh;
})

