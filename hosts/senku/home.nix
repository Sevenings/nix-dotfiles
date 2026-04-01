{ config, lib, ... }:

let
  importDir = import ../../misc/auxiliar/importDir.nix {inherit lib;};
in
{
  imports = importDir ../../modules/user;


  config.userSettings = {
    username = "senku";

    actions.enable = true;
    babel.enable = true;
    bambu-studio.enable = true;
    blender.enable = true;
    caelestia.enable = true;
    claude.enable = true;
    clipcat.enable = true;
    colors.enable = true;
    colorpicker.enable = true;
    cruise.enable = true;
    elixir.enable = true;
    fastfetch.enable = true;
    foliate.enable = false;
    freecad.enable = true;
    gimp.enable = true;
    git.enable = true;
    gtk.enable = true;
    hyprland.enable = true;
    inkscape.enable = true;
    keepass.enable = true;
    kitty.enable = true;
    kubernetes-local-cluster.enable = true;
    kubernetes-utils.enable = true;
    matrix.enable = true;
    mimetypes.enable = true;
    mpd.enable = true;
    musicnow.enable = true;
    nvim.enable = true;
    obsidian.enable = true;
    openCalendar.enable = true;
    python.enable = false;
    python_calculator.enable = true;
    qbittorrent.enable = true;
    rofi.enable = true;
    rust.enable = true;
    vpntce.enable = true;
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
    WLR_NO_HARDWARE_CURSORS = "1";
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  manual.html.enable = true;

}
