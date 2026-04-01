{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.userSettings.<module>;
in
{
  options.userSettings.<module> = {
    enable = lib.mkEnableOption "Enable <module>";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    colorscheme = inputs.nix-colors.colorschemes.ayu-dark;

    # Hyprland
    wayland.windowManager.hyprland = {
      settings = {
        source = ["~/.config/hypr/scheme/current.conf"];

        general = {
          "col.active_border" = "rgb($overlay2)";
          "col.inactive_border" = "rgba($cruste0)";
        };

      };
    };

    # Kitty - Em desenvolvimento
    programs.kitty = {
      enable = true;
      font.name = "VictorMono Nerd Font";
      themeFile = "Monokai";
      settings = {
        background = "#0d0f18";
        background_opacity = "0.75";
      };
    };
  };
}
