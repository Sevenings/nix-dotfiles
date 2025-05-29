{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland.settings = {

        # Execute your favorite apps at launch
        "exec-once" = [
          "waybar"
          "swaync"
          "systemctl --user start hyprpolkitagent"
          "hyprpaper"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        ];

    };
}
