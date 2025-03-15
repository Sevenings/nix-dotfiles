{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {

    # Keyboard and Mouse
    input = {
      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
      };
    };
    
    gestures = {
      workspace_swipe = true;
      workspace_swipe_cancel_ratio = 0.10;
    };

  };
}
