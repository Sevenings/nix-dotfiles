{ config, pkgs, ... }:

{
  programs.waybar = {
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./config.json );
    };
  };
}
