{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.actions;
in
{
  options.userSettings.actions = {
    enable = lib.mkEnableOption "Enable actions";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      actions
      nix-gc
      reload_wallpaper
    ];
  };
}
