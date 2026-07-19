{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.aseprite;
in
{
  options.userSettings.aseprite = {
    enable = lib.mkEnableOption "Enable aseprite";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      aseprite
    ];
  };
}
