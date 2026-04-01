{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.freecad;
in
{
  options.userSettings.freecad = {
    enable = lib.mkEnableOption "Enable freecad";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      freecad-wayland
    ];
  };
}
