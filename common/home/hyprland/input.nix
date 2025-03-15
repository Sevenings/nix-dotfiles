{ ... }:

{

  wayland.windowManager.hyprland.settings = {

    # Keyboard and Mouse
    input = {
      kb_layout = "br, us";
      kb_options = "caps:escape";

      repeat_rate = 35;
      repeat_delay = 340;

      follow_mouse = 1;

      sensitivity = 1.0; # -1.0 - 1.0, 0 means no modification.
      accel_profile = "flat";
    };

  };
}
