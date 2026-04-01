{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.kubernetes-local-cluster;
in
{
  options.userSettings.kubernetes-local-cluster = {
    enable = lib.mkEnableOption "Enable Kubernetes Local Cluster";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      kubernetes
      minikube
    ];
  };
}
