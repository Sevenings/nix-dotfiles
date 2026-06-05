{ pkgs, ... }:
{ 
  home.packages = with pkgs; [
    kubectl
    kubernetes-helm
    helmfile-wrapped
  ];
}
