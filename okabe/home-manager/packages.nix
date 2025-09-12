{ pkgs, outputs, ... }:
{
  home.packages = with pkgs; [
    projectlibre
    kicad
    se_expediente
    horario_ponto
    cura-appimage
    freecad-wayland
  ];
}
