{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.cruise;
in
{
  options.userSettings.cruise = {
    enable = lib.mkEnableOption "Enable Cruise";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      cruise
    ];
  };
}
