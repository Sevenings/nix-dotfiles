{ config, pkgs, ... }:

{
    programs.swaylock.enable = true;
    
    # security.pam.services.swaylock = {};

    programs.swaylock.settings = {
        
        image = "/home/okabe/Imagens/wallpapers/steins-gate-rainbow.png";
        # clock = true;
        indicator = true;
        indicator-radius = 150;
        indicator-thickness = 8;
        ring-color = "00AA00";
        key-hl-color = "88EE33";
        line-color = "000000";
        inside-color = "00000088";
        separator-color = "000000";
        # effect-blur = "10x3";
        text-color = "f4ffe8";
        screenshots = true;
        indicator-image = "/home/okabe/Imagens/wallpapers/swaylock/omnitrix.png";
        inside-wrong-color = "EE000088";

    };
}
