{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    general = {
      "col.active_border" = lib.mkForce "rgb(ad3434)";
    };

    animation = [
      "workspaces, 1, 2.6, rush"
    ];
    
  };
}
