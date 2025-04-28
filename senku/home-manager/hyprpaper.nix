{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "/home/senku/.dotfiles/senku/wallpapers/1347179.png";
        "$secondMonitorPath" = "/home/senku/.dotfiles/senku/wallpapers/1347179.png";

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
