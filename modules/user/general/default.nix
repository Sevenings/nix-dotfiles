{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.general;
in
{
  options.userSettings.general = {
    enable = lib.mkEnableOption "Enable general";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      ffmpeg
    ];
  };
}
