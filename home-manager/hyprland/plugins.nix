{ config, pkgs, ... }:

{

  # Installed Plugins
  wayland.windowManager.hyprland.plugins = [
	# pkgs.hyprlandPlugins.hyprbars
	pkgs.hyprlandPlugins.hyprgrass
  ];

  # Plugins Settings
  wayland.windowManager.hyprland.settings = {
	  
	  plugin = { 

		touch_gestures = {

		  # The default sensitivity is probably too low on tablet screens,
		  # I recommend turning it up to 4.0
		  sensitivity = 4.0;

		  # must be >= 3
		  workspace_swipe_fingers = 3;

		  # switching workspaces by swiping from an edge, this is separate from workspace_swipe_fingers
		  # and can be used at the same time
		  # possible values: l, r, u, or d
		  # to disable it set it to anything else
		  workspace_swipe_edge = "d";

		  # in milliseconds
		  long_press_delay = 400;

		  # resize windows by long-pressing on window borders and gaps.
		  # If general:resize_on_border is enabled, general:extend_border_grab_area is used for floating
		  # windows
		  resize_on_border_long_press = true;

		  # in pixels, the distance from the edge that is considered an edge
		  edge_margin = 10;

		  # emulates touchpad swipes when swiping in a direction that does not trigger workspace swipe.
		  # ONLY triggers when finger count is equal to workspace_swipe_fingers
		  #
		  # might be removed in the future in favor of event hooks
		  emulate_touchpad_swipe = false;

		  experimental = {
			# send proper cancel events to windows instead of hacky touch_up events,
			# NOT recommended as it crashed a few times, once it's stabilized I'll make it the default
			send_cancel = 0;
		  };

		};

	  };

  };

}
