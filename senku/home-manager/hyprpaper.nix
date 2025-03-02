{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "~/Imagens/wallpapers/ghibli-totoro.png";
        # "$secondMonitorPath" = "~/Imagens/wallpapers/sky.png";

        preload = [
            "$imagePath"
            # "$secondMonitorPath"
        ];

        wallpaper = [
            "eDP-1, $imagePath"
            "HDMI-A-1, $imagePath"
        ];

        ipc = "off";

        splash = false;
    };
}
