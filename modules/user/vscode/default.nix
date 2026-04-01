{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.vscode;
in
{
  options.userSettings.vscode = {
    enable = lib.mkEnableOption "Enable vscode";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      vscode
    ];
  };
}
