{ config, pkgs, ... }:

{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
        xdg-desktop-portal-termfilechooser
      ];
    };
    config.common = {
      "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
    };
  };
}

