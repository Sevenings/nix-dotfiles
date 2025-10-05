{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "$XDG_STATE_HOME/wallpaper/left_monitor";
        "$secondMonitorPath" = "$XDG_STATE_HOME/wallpaper/right_monitor";

        preload = [
            "$imagePath"
            "$secondMonitorPath"
        ];

        wallpaper = [
            "DP-1, $imagePath"
            "HDMI-A-1, $secondMonitorPath"
        ];

        ipc = "off";

        splash = false;
    };
}
