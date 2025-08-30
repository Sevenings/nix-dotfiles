{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
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
    # foliate
  ];
  nixpkgs.config.allowUnfree = true;
}
