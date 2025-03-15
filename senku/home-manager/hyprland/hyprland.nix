{ config, pkgs, ... }:

{

  imports = [
    ./appearance.nix
    ./env_vars.nix
    ./plugins.nix
    ./workspaces.nix
  ];


  wayland.windowManager.hyprland.settings = {

    # Monitor configuration
    monitor = [
      # Monitor principal
      "DP-1, highres, 0x0, 1"

      # Meu segundo monitor
      "HDMI-A-1, highres, 1920x0, 1"	
    ];

  };
}
