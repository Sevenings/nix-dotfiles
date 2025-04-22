{ config, pkgs, ... }:

{
  programs.kitty = {
    themeFile = "Monokai";
    font = {
      size = 12.0;
    };
  };
}
