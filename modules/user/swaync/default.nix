{ config, lib, ... }:

let
  cfg = config.userSettings.swaync;
in
{
  options.userSettings.swaync = {
    enable = lib.mkEnableOption "Enable swaync";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/swaync".source = ./dotfiles;
  };
}
