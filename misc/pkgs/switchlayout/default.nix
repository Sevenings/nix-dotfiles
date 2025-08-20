{ pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "switchlayout";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./switchLayout.sh;
})

