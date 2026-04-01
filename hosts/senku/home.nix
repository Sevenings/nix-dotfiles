{ config, lib, ... }:

let
  importDir = import ../../misc/auxiliar/importDir.nix {inherit lib;};
in
{
  imports = importDir ../../modules/user;

  config.userSettings = {
    actions.enable = true;
    babel.enable = true;
    bambu-studio.enable = true;
    blender.enable = true;
    caelestia.enable = true;
    claude.enable = true;
    clipcat.enable = true;
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
    scripts.enable = false;
    vpntce.enable = true;
    vscode.enable = false;
    xdg.enable = true;
    yazi.enable = true;
    zathura.enable = true;
    zen.enable = true;
    zsh.enable = true;
  };

}
