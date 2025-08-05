{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./waybar/gruvbox/config.json );
    };
    style = ./waybar/gruvbox/style.css;
  };

}
