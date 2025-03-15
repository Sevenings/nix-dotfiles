{ config, pkgs, ... }:

{
  programs.kitty = {
    themeFile = "Argonaut";
    font = {
      size = 13.0;
    };
  };
}
