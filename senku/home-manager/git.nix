{ config, pkgs, ... }:

{
  programs.git = {
    enable = false;
    userName = "Sevenings";
    userEmail = "lvlassis.2@gmail.com";
  };
}
