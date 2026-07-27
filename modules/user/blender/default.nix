{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.blender;
in
{
  options.userSettings.blender = {
    enable = lib.mkEnableOption "Enable blender";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      blender
    ];
  };
}
