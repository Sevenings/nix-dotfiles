{ config, lib, ... }:

let
  cfg = config.userSettings.clipcat;
in
{
  options.userSettings.clipcat = {
    enable = lib.mkEnableOption "Enable Clipcat";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.file.".config/clipcat".source = ./config;
  };
}
