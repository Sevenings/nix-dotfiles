{ inputs, pkgs, ... }:

{

  # Installed Plugins
  wayland.windowManager.hyprland.plugins = [
	  pkgs.hyprlandPlugins.hyprbars
	  inputs.split-monitor-workspaces.packages.${pkgs}
  ];

  # Plugins Settings
  wayland.windowManager.hyprland.settings = {
	  
	  plugin = { 

	  };

  };

}
