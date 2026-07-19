{ config, lib, ... }:

let
  cfg = config.userSettings.ranger;
in
{
  options.userSettings.ranger = {
    enable = lib.mkEnableOption "Enable ranger";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/ranger".source = ./dotfiles;
  };
}
