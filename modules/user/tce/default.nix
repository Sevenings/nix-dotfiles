{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.tce;
in
{
  options.userSettings.tce = {
    enable = lib.mkEnableOption "Enable TCE";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      openfortivpn
      glab
      copier
    ];

    programs.zsh.shellAliases = {
      "vpntce" = "sudo openfortivpn vpn.tce.go.gov.br:443 -u lvinicius";
      "padrao-devops" = "copier copy https://gitsource.tce.go.gov.br/GER-TI/tce.kubernetes/templates/devops-copier.git .";
    };
  };
}
