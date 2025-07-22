{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./waybar/linux-mobile/config.json );
    };
    style = ./waybar/linux-mobile/style.css;
  };

}
