{ pkgs, outputs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    vscode
    horario_ponto
    cura-appimage
    freecad-wayland
  ];
}
