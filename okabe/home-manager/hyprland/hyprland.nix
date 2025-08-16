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

    wayland.windowManager.hyprland.settings = {
      "$keyboard" = "at-translated-set-2-keyboard";
    };

}
