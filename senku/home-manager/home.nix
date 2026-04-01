{ config, pkgs, ... }:

{
  imports = [
    ./caelestia
    ./hyprland/hyprland.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./packages.nix
    ./swaylock.nix
    ./kitty.nix
    ./waybar/waybar.nix
    ./legacy/legacy.nix
  ];
}
