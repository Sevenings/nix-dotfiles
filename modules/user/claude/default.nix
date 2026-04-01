{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.claude;
in
{
  options.userSettings.claude = {
    enable = lib.mkEnableOption "Enable claude";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      claude-code
    ];
  };
}
