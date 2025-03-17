{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {

    general = {
      "col.active_border" = "rgb(83c092)";
      "col.inactive_border" = "rgba(595959aa)";
    };
    
  };
}
