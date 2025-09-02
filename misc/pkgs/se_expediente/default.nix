{ pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication rec {
  name = "se_expediente";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./${name}.sh;
})

