{ pkgs, lib, ... }:

{
  # Fonts
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    anonymousPro
    victor-mono
    corefonts # Inclui Times New Roman
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}

