{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "colorpicker";
  runtimeInputs = with pkgs; [ babel ];
  text = builtins.readFile ./colorPicker.sh;
})

