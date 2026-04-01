{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.keepass;
in
{
  options.userSettings.keepass = {
    enable = lib.mkEnableOption "Enable keepass";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      keepassxc
    ];
  };
}
