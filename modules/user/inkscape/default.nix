{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.inkscape;
in
{
  options.userSettings.inkscape = {
    enable = lib.mkEnableOption "Enable inkscape";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      inkscape
    ];
  };
}
