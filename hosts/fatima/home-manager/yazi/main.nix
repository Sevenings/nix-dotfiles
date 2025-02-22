{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    initLua = ./init.lua;
    flavors = {
      everforest = ./flavors/everforest-medium.yazi;
    };
  };

  imports = [ 
    ./yazi.nix
    ./theme.nix
    ./keymap.nix
    ./plugins.nix
  ]
}
