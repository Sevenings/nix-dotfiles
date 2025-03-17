{ config, pkgs, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./swaylock.nix
    ./kitty.nix
    ./waybar.nix
    ./legacy/legacy.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home = {
    username = "okabe";
    homeDirectory = "/home/okabe";
    stateVersion = "24.11"; # Do not change
  };

}
