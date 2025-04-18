{ config, pkgs, ... }:

{
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
        
        "$imagePath" = "~/.dotfiles/okabe/wallpapers/nix-wallpaper-gear.png";
        "$secondMonitorPath" = "~/.dotfiles/okabe/wallpapers/nix-wallpaper-gear.png";

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
