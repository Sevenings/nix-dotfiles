{ config, pkgs, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./packages.nix
    ./swaylock.nix
    ./kitty.nix
    ./waybar/waybar.nix
    ./legacy/legacy.nix
  ];


  manual.html.enable = true;

  # Home Manager needs a bit of information about you and the paths it should manage.
  home = {
    username = "senku";
    homeDirectory = "/home/senku";
    stateVersion = "24.11"; # Do not change
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
