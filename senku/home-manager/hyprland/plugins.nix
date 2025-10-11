{ inputs, pkgs, ... }:

{

  # Installed Plugins
  wayland.windowManager.hyprland.plugins = [
    inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    inputs.hyprland-plugins.packages.${pkgs.system}.hyprtrails
  ];

  # Plugins Settings
  wayland.windowManager.hyprland.settings = {
	  
	  plugin = { 

	  };

  };

}
