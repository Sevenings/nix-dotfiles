{ pkgs, outputs, ... }:
{
  home.packages = with pkgs; [
    horario_ponto
  ];
}
