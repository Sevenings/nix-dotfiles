{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blender
    bambu-studio
    openCalendar
    actions
    nix-gc
    reload_waybar
    reload_wallpaper
    claude-code
    gimp
    inkscape
    trash-cli
    fzf
    zoxide
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
