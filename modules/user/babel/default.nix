{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.babel;
in
{
  options.userSettings.babel = {
    enable = lib.mkEnableOption "Enable babel";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      babel
    ];
  };
}
