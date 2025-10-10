{ inputs, pkgs, ... }:

{

  # Installed Plugins
  wayland.windowManager.hyprland.plugins = [
	  # inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
  ];

  # Plugins Settings
  wayland.windowManager.hyprland.settings.plugin = {

  };

}
