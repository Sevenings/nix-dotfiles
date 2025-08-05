{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "/home/okabe/Imagens/Wallpapers/wallhaven-1q83qg_1920x1080.png";
        "$secondMonitorPath" = "/home/okabe/Imagens/Wallpapers/wallhaven-1q83qg_1920x1080.png";

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
