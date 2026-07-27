{ config, lib, ... }:

let
  cfg = config.userSettings.calcurse;
in
{
  options.userSettings.calcurse = {
    enable = lib.mkEnableOption "Enable calcurse";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/calcurse".source = ./dotfiles;
  };
}
