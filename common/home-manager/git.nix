{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Lucas Vinícius";
    userEmail = "lvlassis.2@gmail.com";
  };
}
