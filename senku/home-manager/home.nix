{ config, pkgs, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./swaylock.nix
    ./environment_variables.nix
    ./kitty.nix
    ./gtk.nix
    ./waybar/waybar.nix
    ./legacy/legacy.nix
    ./scripts/scripts.nix
    ./python/environment.nix
    ./git.nix
    ./mimetypes.nix
    # ./colorschemes.nix
    ./yazi/yazi.nix
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
