{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.rust;
in
{
  options.userSettings.rust = {
    enable = lib.mkEnableOption "Enable rust";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      rustc
      cargo
    ];
  };
}
