{ config, lib, ... }:

let
  cfg = config.systemSettings.power-management;
in
{
  options.systemSettings.power-management = {
    enable = lib.mkEnableOption "Enable power-management";
  };

  config = lib.mkIf cfg.enable {
    services.upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
    };

    services.power-profiles-daemon.enable = true;
  };
}
