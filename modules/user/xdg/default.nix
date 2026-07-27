{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.xdg;
in
{
  options.userSettings.xdg = {
    enable = lib.mkEnableOption "Enable XDG";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          # xdg-desktop-portal-hyprland # Não é necessário, o hyprland já possui e dá erro de build
          xdg-desktop-portal-termfilechooser
          xdg-desktop-portal-gtk
        ];
        config.common = {
          default = [ "hyprland" "gtk" ];
          "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
        };
      };
    };
  };
}
