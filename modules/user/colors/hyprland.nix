{ config, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      source = ["~/.config/hypr/scheme/current.conf"];

      general = {
        "col.active_border" = "rgb($overlay2)";
        "col.inactive_border" = "rgba($cruste0)";
      };

    };
  };
}
