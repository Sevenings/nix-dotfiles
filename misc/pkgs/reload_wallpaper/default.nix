{ pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "reload_wallpaper";
  runtimeInputs = with pkgs; [];
  text = builtins.readFile ./reload_wallpaper.sh;
})

