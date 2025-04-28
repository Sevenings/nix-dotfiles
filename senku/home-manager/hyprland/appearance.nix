{ config, pkgs, ... }:

{
  # Configurações específicas do Senku
  wayland.windowManager.hyprland.settings = {

    general = {
      "col.active_border" = "rgb(F9F2FA)";
      # "col.inactive_border" = "rgb(221f22)";
    };

    animation = [
      "workspaces, 1, 2.6, rush, slidevert"
    ];

  };
}
