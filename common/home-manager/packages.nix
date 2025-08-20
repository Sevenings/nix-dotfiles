{ pkgs, ... }:

{
  home.packages = with pkgs; [
    babel
    colorpicker
    musicnow
    python_calculator
    switchlayout
    togglecaps
    workspace
    freecad-wayland
    rustc
    cargo
    foliate
  ];
}
