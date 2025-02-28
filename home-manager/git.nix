{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Lucas V.";
    userEmail = "lvlassis.2@gmail.com";
  };
}
