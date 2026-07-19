{ config, pkgs, ... }:

{
  imports = [
    ./caelestia
    ./hyprland/hyprland.nix
    # ./hyprpaper.nix
    ./hypridle.nix
    ./packages.nix
    # ./swaylock.nix
    ./kitty.nix
    # ./waybar/waybar.nix
    ./legacy/legacy.nix
  ];


  manual.html.enable = true;

  # Home Manager needs a bit of information about you and the paths it should manage.
  home = {
    username = "senku";
    homeDirectory = "/home/senku";
    stateVersion = "24.11"; # Do not change
  };


  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
