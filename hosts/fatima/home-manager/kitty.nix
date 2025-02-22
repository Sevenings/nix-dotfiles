{ config, pkgs, ... }:

{
  home.file = {
    ".config/kitty".source = ./kitty;
  };

  programs.kitty.enable = true;
}
