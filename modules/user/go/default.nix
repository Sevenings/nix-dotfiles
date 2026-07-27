{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.go;
in
{
  options.userSettings.go = {
    enable = lib.mkEnableOption "Enable go";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      go
    ];
  };
}
