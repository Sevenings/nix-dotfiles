{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.foliate;
in
{
  options.userSettings.foliate = {
    enable = lib.mkEnableOption "Enable foliate";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      foliate
    ];
  };
}
