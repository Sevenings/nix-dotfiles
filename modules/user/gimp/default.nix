{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.gimp;
in
{
  options.userSettings.gimp = {
    enable = lib.mkEnableOption "Enable gimp";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      gimp
    ];
  };
}
