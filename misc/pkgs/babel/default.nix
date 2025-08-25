{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "babel";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./babel.sh;
})

