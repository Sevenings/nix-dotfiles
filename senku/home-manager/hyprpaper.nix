{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "/home/senku/Imagens/green-plains.png";
        "$secondMonitorPath" = "/home/senku/Imagens/green-plains.png";

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
