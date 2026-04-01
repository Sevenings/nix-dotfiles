{ config, pkgs, ... }:

{
  # Em desenvolvimento
  programs.kitty = {
    enable = true;
    font.name = "VictorMono Nerd Font";
    themeFile = "Monokai";
    settings = {
      background = "#0d0f18";
      background_opacity = "0.75";
    };
  };
}
