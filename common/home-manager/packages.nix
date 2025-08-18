{ pkgs, ... }:

{
  home.packages = with pkgs; [
    freecad-wayland
    rustc
    cargo
    foliate
  ];
}
