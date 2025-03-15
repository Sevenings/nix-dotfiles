{ config, pkgs, ... }:

{

  imports = [
    ./appearance.nix
    ./auto-start.nix
    ./bindings.nix
    ./env_vars.nix
    ./plugins.nix
    ./window_rules.nix
    ./input.nix
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
