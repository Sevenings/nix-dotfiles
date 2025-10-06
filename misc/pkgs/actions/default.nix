{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "actions";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./actions.sh;
})

