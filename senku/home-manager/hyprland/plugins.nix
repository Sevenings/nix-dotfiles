{ inputs, pkgs, ... }:

{

  # Installed Plugins
  wayland.windowManager.hyprland.plugins = [
	  pkgs.hyprlandPlugins.hyprbars
  ];

  # Plugins Settings
  wayland.windowManager.hyprland.settings = {
	  
	  plugin = { 

	  };

  };

}
