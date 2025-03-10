{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Monokai";
    font = {
      name = "Source Code Pro";
      size = 13.0;
    };
  };
}
