{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    general = {
    };

    animation = [
      "workspaces, 1, 3, default, slidefade 10%"
    ];
    
  };
}
