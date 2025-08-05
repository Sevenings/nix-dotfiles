{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./waybar/monokai/config.json );
    };
    style = ./waybar/monokai/style.css;
  };

}
