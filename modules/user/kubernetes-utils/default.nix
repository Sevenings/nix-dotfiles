{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.kubernetes-utils;
  zsh = config.userSettings.zsh;
in
{
  options.userSettings.kubernetes-utils = {
    enable = lib.mkEnableOption "Enable Kubernetes Utils";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      kubectl
      kubernetes-helm
      helmfile-wrapped
    ];

    # Aliás do zsh
    programs.zsh.shellAliases = lib.mkIf zsh.enable {
      "k" = "kubectl";
    };
  };
}
