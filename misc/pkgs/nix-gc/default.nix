{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "nix-gc";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./nix-gc.sh;
})

