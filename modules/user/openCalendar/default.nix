{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.openCalendar;
in
{
  options.userSettings.openCalendar = {
    enable = lib.mkEnableOption "Enable openCalendar";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      openCalendar
    ];
  };
}
