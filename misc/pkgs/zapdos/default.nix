{ pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "zapdos";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./zapdos.sh;
})

