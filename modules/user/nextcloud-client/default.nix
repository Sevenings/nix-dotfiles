{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.nextcloud-client;
in
{
  options.userSettings.nextcloud-client = {
    enable = lib.mkEnableOption "Enable nextcloud-client";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      nextcloud-client
    ];
  };
}
