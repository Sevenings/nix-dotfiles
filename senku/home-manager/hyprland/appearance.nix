{ config, pkgs, lib, ... }:

{
  # Configurações específicas do Senku
  wayland.windowManager.hyprland.settings = {

    general = {
    };

    animation = [
      "workspaces, 1, 3, default, slidefadevert 10%"
    ];

  };
}
