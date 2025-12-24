{ pkgs, outputs, ... }:
{
  home.packages = with pkgs; [
    foliate
    openfortivpn
    tesseract
    ocrmypdf
    kicad
    se_expediente
    horario_ponto
    cura-appimage
    freecad-wayland
  ];
}
