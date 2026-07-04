{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tinty
  ];
}
