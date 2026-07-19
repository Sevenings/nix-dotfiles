{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.kubernetes-utils;
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
  };
}
