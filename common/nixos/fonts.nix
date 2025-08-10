{ pkgs, lib, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    anonymousPro
    victor-mono
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}

