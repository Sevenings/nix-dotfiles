{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {

      # Execute your favorite apps at launch
    "exec-once" = [
      "systemctl --user start hyprpolkitagent"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "clipcatd"
      # "hyprctl plugin load \"$HYPR_PLUGIN_DIR/lib/libhyprexpo.so\""
    ];

  };
}
