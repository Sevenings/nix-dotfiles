{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "$XDG_STATE_HOME/wallpaper/main";
        "$secondMonitorPath" = "$XDG_STATE_HOME/wallpaper/up";

        preload = [
            "$imagePath"
            "$secondMonitorPath"
        ];

        wallpaper = [
            "eDP-1, $imagePath"
            "HDMI-A-1, $secondMonitorPath"
        ];

        ipc = "off";

        splash = false;
    };
}
