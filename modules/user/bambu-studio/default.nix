{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.bambu-studio;
in
{
  options.userSettings.bambu-studio = {
    enable = lib.mkEnableOption "Enable bambu-studio";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      bambu-studio
    ];

  };
}
