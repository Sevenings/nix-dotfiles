{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "python_calculator";
  runtimeInputs = with pkgs; [ kitty ];
  text = builtins.readFile ./python_calculator.sh;
})

