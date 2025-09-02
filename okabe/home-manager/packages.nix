{ pkgs, outputs, ... }:
{
  home.packages = with pkgs; [
    se_expediente
    horario_ponto
    cura-appimage
    freecad-wayland
  ];
}
