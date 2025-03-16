{ inputs, pkgs, ... }:

{

  # Installed Plugins
  wayland.windowManager.hyprland.plugins = [
	  inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
  ];

  # Plugins Settings
  wayland.windowManager.hyprland.settings = {
	  
	  plugin = { 

	  };

  };

}
