{ pkgs, outputs, ... }:
{
  nixpkgs.overlays = [ outputs.overlays.additions ];

  home.packages = with pkgs; [
    horario_ponto
  ];
}
