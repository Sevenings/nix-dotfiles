{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    general = {
      "col.active_border" = lib.mkForce "rgb(028D75)";
    };

    animation = [
      "workspaces, 1, 3, default, slidefade 10%"
    ];
    
  };
}
