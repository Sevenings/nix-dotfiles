{ config, lib, ... }:

let
  cfg = config.userSettings.hyprpaper;
in
{
  options.userSettings.hyprpaper = {
    enable = lib.mkEnableOption "Enable hyprpaper";

    preload = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Caminhos de imagem para pré-carregar";
    };

    wallpapers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Linhas 'MONITOR, caminho' de atribuição de wallpaper por monitor";
    };
  };

  config = lib.mkIf cfg.enable {
    services.hyprpaper.enable = true;

    services.hyprpaper.settings = {
      preload = cfg.preload;
      wallpaper = cfg.wallpapers;
      ipc = "off";
      splash = false;
    };
  };
}
