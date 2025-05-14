{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    general = {
      "col.active_border" = lib.mkForce "rgb(F7F7F7)";
    };

    animation = [
      "workspaces, 1, 2.6, rush"
    ];
    
  };
}
