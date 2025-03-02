{ config, pkgs, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovide.desktop" ];
    "application/pdf" = [ "zathura.desktop" ];
    "image/*" = [ "eog.desktop" ];
    "video/*" = [ "mpv.desktop" ];
  };

}
