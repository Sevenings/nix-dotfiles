{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Sevenings";
    userEmail = "lvlassis.2@gmail.com";
  };
}
