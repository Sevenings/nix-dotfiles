{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.elixir;
in
{
  options.userSettings.elixir = {
    enable = lib.mkEnableOption "Enable Elixir";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      beamMinimal27Packages.elixir_1_17
    ];
  };
}
