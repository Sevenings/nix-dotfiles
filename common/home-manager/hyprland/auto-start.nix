{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland.settings = {

        # Execute your favorite apps at launch
        "exec-once" = [
          "waybar"
          "swaync"
          "/usr/lib/polkit-gnome-authentication-agent-1"
          # "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
          "hyprpaper"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        ];

    };
}
