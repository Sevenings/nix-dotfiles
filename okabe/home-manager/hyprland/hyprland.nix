{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
    };

    imports = [
        ./appearance.nix
        ./input.nix
        ./monitors.nix
        ./plugins.nix
    ];

}
