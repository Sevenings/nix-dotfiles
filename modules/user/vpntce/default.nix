{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.vpntce;
in
{
  options.userSettings.vpntce = {
    enable = lib.mkEnableOption "Enable VPN TCE";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      openfortivpn
    ];

    programs.zsh.shellAliases = {
      "vpntce" = "sudo openfortivpn vpn.tce.go.gov.br:443 -u lvinicius";
    };
  };
}
