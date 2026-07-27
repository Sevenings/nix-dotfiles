{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.mimetypes;
  browser = "userapp-Zen-HINHD3.desktop";
in
{
  options.userSettings.mimetypes = {
    enable = lib.mkEnableOption "Enable Mimetypes";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    xdg.mimeApps.enable = true;
    xdg.mimeApps.defaultApplications = {
      "text/plain" = [ "neovide.desktop" ];
      "text/html" = browser;
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "image/*" = [ "eog.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "x-scheme-handler/mailto" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/about" = browser;
      "x-scheme-handler/unknown" = browser;
    };
  };
}
