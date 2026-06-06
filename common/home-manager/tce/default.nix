{ pkgs, ... }:
{
  home.packages = with pkgs; [
    openfortivpn
    glab
    copier
  ];

  programs.zsh.shellAliases = {
      "padrao-devops" = "copier copy https://gitsource.tce.go.gov.br/GER-TI/tce.kubernetes/templates/devops-copier.git .";
      "vpntce" = "sudo openfortivpn vpn.tce.go.gov.br:443 -u lvinicius";
  };
}
