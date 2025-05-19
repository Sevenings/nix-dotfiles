{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    general = {
      "col.active_border" = lib.mkForce "rgb(AEC2D2)";
    };

    animation = [
      "workspaces, 1, 2.6, rush"
    ];
    
  };
}
