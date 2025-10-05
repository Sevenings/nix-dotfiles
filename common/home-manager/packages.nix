{ pkgs, ... }:

{
  home.packages = with pkgs; [
    reload_wallpaper
    claude-code
    gimp
    inkscape
    trash-cli
    fzf
    zoxide
    morgen
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
