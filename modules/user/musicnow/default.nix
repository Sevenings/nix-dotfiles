{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.musicnow;
in
{
  options.userSettings.musicnow = {
    enable = lib.mkEnableOption "Enable musicnow";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      musicnow
    ];
  };
}
