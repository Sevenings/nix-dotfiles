{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.qbittorrent;
in
{
  options.userSettings.qbittorrent = {
    enable = lib.mkEnableOption "Enable qbittorrent";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    qbittorrent
  };
}
