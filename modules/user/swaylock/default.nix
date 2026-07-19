{ config, lib, ... }:

let
  cfg = config.userSettings.swaylock;
in
{
  options.userSettings.swaylock = {
    enable = lib.mkEnableOption "Enable swaylock";

    image = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Caminho da imagem de fundo do lockscreen";
    };

    indicatorImage = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Caminho da imagem do indicador, se houver";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.swaylock.enable = true;

    programs.swaylock.settings = {
      image = cfg.image;
      indicator = true;
      indicator-radius = 150;
      indicator-thickness = 8;
      ring-color = "00AA00";
      key-hl-color = "88EE33";
      line-color = "000000";
      inside-color = "00000088";
      separator-color = "000000";
      text-color = "f4ffe8";
      screenshots = true;
      inside-wrong-color = "EE000088";
    } // lib.optionalAttrs (cfg.indicatorImage != null) {
      indicator-image = cfg.indicatorImage;
    };
  };
}
