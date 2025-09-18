{ pkgs, outputs, ... }:
{
  home.packages = with pkgs; [
    tesseract
    ocrmypdf
    projectlibre
    kicad
    se_expediente
    horario_ponto
    cura-appimage
    freecad-wayland
  ];
}
