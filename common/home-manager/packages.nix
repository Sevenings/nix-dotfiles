{ pkgs, ... }:

{
  home.packages = with pkgs; [
    babel
    colorpicker
    musicnow
    python_calculator
    switchlayout
    togglecapslock
    workspace
    freecad-wayland
    rustc
    cargo
    foliate
  ];
}
