{ config, pkgs, lib, ... }:

{
  # Configurações específicas do Senku
  wayland.windowManager.hyprland.settings = {

    general = {
      "col.active_border" = lib.mkForce "rgb(193549)";
      # "col.inactive_border" = "rgb(221f22)";
    };

    animation = [
      "workspaces, 1, 3, default, slidefadevert 10%"
    ];

  };
}
