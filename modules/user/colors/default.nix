{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.userSettings.colors;
in
{
  options.userSettings.colors = {
    enable = lib.mkEnableOption "Enable colors";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      # Configurações específicas do módulo
      colorscheme = inputs.nix-colors.colorschemes.ayu-dark;

      # Kitty - Em desenvolvimento
      # programs.kitty = {
      #   enable = true;
      #   font.name = "VictorMono Nerd Font";
      #   themeFile = "Monokai";
      #   settings = {
      #     background = "#0d0f18";
      #     background_opacity = "0.75";
      #   };
      # };
    })

    # Hyprland
    (lib.mkIf (cfg.enable && config.userSettings.hyprland.enable) {
      wayland.windowManager.hyprland.settings = {
        source = ["~/.config/hypr/scheme/current.conf"];

        general = {
          "col.active_border" = "rgb($overlay2)";
          "col.inactive_border" = "rgba($cruste0)";
        };
      };
    })
  ];
}
