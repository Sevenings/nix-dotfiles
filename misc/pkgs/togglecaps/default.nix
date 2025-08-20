{ pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "togglecaps";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./toggleCapsLock.sh;
})

