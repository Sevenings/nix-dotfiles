{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.obsidian;
in
{
  options.userSettings.obsidian = {
    enable = lib.mkEnableOption "Enable Obsidian";
  };

  config = lib.mkIf cfg.enable {

    # Configurações específicas do módulo
    home.packages = with pkgs; [ obsidian ];

    # Fix: Corrige o problema de clipboard do Web Clipper
    wayland.windowManager.hyprland.settings.windowrule = [ "match:class ^(obsidian)$, focus_on_activate on" ];
  };
}
