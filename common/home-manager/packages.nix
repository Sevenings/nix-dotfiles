{ pkgs, ... }:

{
  home.packages = with pkgs; [
    musicnow
    freecad-wayland
    rustc
    cargo
    foliate
  ];
}
