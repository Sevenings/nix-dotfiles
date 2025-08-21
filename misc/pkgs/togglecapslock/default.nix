{ pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "togglecapslock";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./toggleCapsLock.sh;
})

