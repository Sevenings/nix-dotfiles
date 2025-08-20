{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "focusmode";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./focusmode.sh
})

