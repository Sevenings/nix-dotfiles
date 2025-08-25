{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "colorpicker";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./colorPicker.sh;
})

