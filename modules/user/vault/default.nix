{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.vault;
in
{
  options.userSettings.vault = {
    enable = lib.mkEnableOption "Enable Hashicorp Vault";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      vault
    ];
  };
}
