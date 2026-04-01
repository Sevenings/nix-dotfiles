{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.colorpicker;
in
{
  options.userSettings.colorpicker = {
    enable = lib.mkEnableOption "Enable colorpicker";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      colorpicker
    ];
  };
}
