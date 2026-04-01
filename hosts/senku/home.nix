{ config, lib, ... }:

let
  importDir = import ../../misc/auxiliar/importDir.nix {inherit lib;};
in
{
  imports = importDir ../../modules/user;

  config.userSettings = {
    bambu-studio.enable = true;
    caelestia.enable = true;
    clipcat.enable = true;
    cruise.enable = true;
    elixir.enable = true;
    fastfetch.enable = true;
    hyprland.enable = true;
    kitty.enable = true;
    kubernetes-local-cluster.enable = true;
    kubernetes-utils.enable = true;
    matrix.enable = true;
    mpd.enable = true;
    nvim.enable = true;
    obsidian.enable = true;
    python.enable = false;
    rofi.enable = true;
    vpntce.enable = true;
    yazi.enable = true;
    zathura.enable = true;
    zsh.enable = true;
  };

}
