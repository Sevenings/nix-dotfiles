{ config, pkgs, ... }:

{
  programs.kitty = {
    themeFile = "Monokai";
    font = {
      size = 14.0;
    };
  };
}
