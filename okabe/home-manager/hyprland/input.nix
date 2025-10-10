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
    
  };
}
