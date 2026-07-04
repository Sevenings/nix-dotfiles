{ pkgs, inputs, system, ... }:

let
  zen-wrapper = import ../../misc/wrappers/zen.nix { inherit pkgs inputs system; };
in
{
  home.packages = with pkgs; [
    playerctl
    keepassxc
    qbittorrent
    blender
    bambu-studio
    openCalendar
    actions
    nix-gc
    reload_waybar
    reload_wallpaper
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
    node
    # foliate
    zen-wrapper
  ];
  nixpkgs.config.allowUnfree = true;
}
