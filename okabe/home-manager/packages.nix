{ pkgs, outputs, ... }:
{
  home.packages = with pkgs; [
    kicad
    se_expediente
    horario_ponto
    cura-appimage
    freecad-wayland
  ];
}
