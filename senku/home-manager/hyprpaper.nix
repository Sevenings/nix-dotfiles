{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "/home/senku/Imagens/Wallpapers/wake_up_neo.png";
        "$secondMonitorPath" = "/home/senku/Imagens/Wallpapers/i_have_no_enemies.png";

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
