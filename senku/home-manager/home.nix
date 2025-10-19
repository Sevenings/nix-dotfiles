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


  home.sessionVariables = {
    WLR_RENDERER = "vulkan";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    
    # XDG Base Directory Specification
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
    XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
