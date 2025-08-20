{ pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "workspace";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./workspace.sh;
})

