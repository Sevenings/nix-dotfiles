{ config, pkgs, ... }:

{
  xdg = {
    portal = {
      enable = true;
      
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-termfilechooser
      ];

      config.common = {
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
    };

    configFile."xdg-desktop-portal-termfilechooser/config".text = ''
      [filechooser]
      # usa o script de wrapper instalado junto ao pacote
      cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
      default_dir=${config.home.homeDirectory}/Downloads
    '';
  };
}
