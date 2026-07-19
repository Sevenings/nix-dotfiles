{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.kitty;
in
{
  options.userSettings.kitty = {
    enable = lib.mkEnableOption "Enable Kitty";

    fontSize = lib.mkOption {
      type = lib.types.number;
      default = 11.0;
      description = "Tamanho da fonte do kitty";
    };
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    programs.kitty = {
      enable = true;
      font.name = "VictorMono Nerd Font";
      font.size = cfg.fontSize;
      themeFile = "Monokai";
      settings = {
        background = "#0d0f18";
        background_opacity = "0.75";

        confirm_os_window_close = 0;
        enable_audio_bell = false;
        remember_window_size = false;
      };
    };
  };
}
