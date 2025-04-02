{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    general = {
      "col.active_border" = lib.mkForce "rgb(3a67cf)";
    };

    animation = [
      "workspaces, 1, 2.6, rush"
    ];
    
  };
}
