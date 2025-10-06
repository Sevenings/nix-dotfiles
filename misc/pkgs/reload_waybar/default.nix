{ pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "reload_waybar";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./reload_waybar.sh;
})

