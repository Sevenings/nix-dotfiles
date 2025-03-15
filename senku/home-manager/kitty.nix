{ config, pkgs, ... }:

{
  programs.kitty = {
    themeFile = "Monokai";
    font = {
      size = 13.0;
    };
  };
}
