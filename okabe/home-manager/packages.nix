{ pkgs, outputs, inputs, system, ... }:
{
  home.packages = with pkgs; [
    tesseract
    ocrmypdf
    # kicad
    se_expediente
    horario_ponto
    cura-appimage
  ];
}
