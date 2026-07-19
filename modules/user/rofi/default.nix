{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.rofi;
in
{
  options.userSettings.rofi = {
    enable = lib.mkEnableOption "Enable rofi";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    programs.rofi = {
      enable = true;
      plugins = [pkgs.rofi-emoji];
    };

    home.file.".config/rofi".source = ./dotfiles;
  };
}
