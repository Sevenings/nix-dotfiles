{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland.settings = {

        # Execute your favorite apps at launch
        "exec-once" = [
            "swaync"
            "waybar -c $HOME'/.config/waybar/gruvbox/config.jsonc' -s $HOME'/.config/waybar/gruvbox/style.css'"
            "/usr/lib/polkit-gnome-authentication-agent-1"
            # "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
            "hyprpaper"
            "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
            # "~/.config/hypr/nuclear-solution.sh"
            "JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab"
            # "eww --config $HOME/.config/eww/dashboard open powermenu"
            #exec-once = hyprpm reload hyprbars
        ];

    };
}
