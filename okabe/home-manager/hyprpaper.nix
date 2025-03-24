{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "~/Imagens/Wallpapers/tengen toppa gurren langann/851137.png";
        "$secondMonitorPath" = "~/Imagens/Wallpapers/tengen toppa gurren langann/851137.png";

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
