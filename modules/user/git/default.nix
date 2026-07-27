{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.git;
in
{
  options.userSettings.git = {
    enable = lib.mkEnableOption "Enable Git";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Lucas Vinícius";
          email = "lvlassis.2@gmail.com";
        };
      };
    };
  };
}
