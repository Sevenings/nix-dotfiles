{ config, lib, ... }:

let
  importDir = import ../../misc/auxiliar/importDir.nix {inherit lib;};
in
{
  imports = importDir ../../modules/user;


  userSettings = {
    username = "okabe";

    actions.enable = true;
    aseprite.enable = false;
    babel.enable = true;
    bambu-studio.enable = false;
    blender.enable = false;
    caelestia.enable = true;
    claude.enable = true;
    clipcat.enable = true;
    colors.enable = true;
    colorpicker.enable = true;
    cruise.enable = false;
    elixir.enable = false;
    fastfetch.enable = true;
    foliate.enable = true;
    freecad.enable = true;
    general.enable = true;
    gimp.enable = true;
    git.enable = true;
    go.enable = true;
    gtk.enable = true;
    hyprland.enable = true;
    inkscape.enable = false;
    keepass.enable = true;
    kitty.enable = true;
    kubernetes-local-cluster.enable = true;
    kubernetes-utils.enable = true;
    matrix.enable = false;
    mimetypes.enable = true;
    mpd.enable = true;
    musicnow.enable = true;
    nvim.enable = true;
    obsidian.enable = true;
    openCalendar.enable = false;
    python.enable = true;
    python_calculator.enable = false;
    qbittorrent.enable = false;
    rofi.enable = true;
    rust.enable = true;
    taskwarrior.enable = true;
    tce.enable = true;
    tinty.enable = true;
    vscode.enable = false;
    xdg.enable = true;
    yazi.enable = true;
    zathura.enable = true;
    zen.enable = true;
    zsh.enable = true;
  };

  # Home Manager needs a bit of information about you and the paths it should manage.
  home = {
    username = config.userSettings.username;
    homeDirectory = "/home/${config.userSettings.username}";
    stateVersion = "24.11"; # Do not change
  };

  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  manual.html.enable = true;

}
