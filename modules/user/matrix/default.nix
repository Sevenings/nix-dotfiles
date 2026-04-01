{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.matrix;
in
{
  options.userSettings.matrix = {
    enable = lib.mkEnableOption "Enable Matrix";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      iamb
    ];

    home.file.".config/iamb/config.toml".source = ./config.toml;
  };
}
