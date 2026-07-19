{ config, lib, ... }:

let
  cfg = config.systemSettings.opentabletdriver;
in
{
  options.systemSettings.opentabletdriver = {
    enable = lib.mkEnableOption "Habilita o OpenTabletDriver para mesa digitalizadora";
  };

  config = lib.mkIf cfg.enable {
    hardware.opentabletdriver.enable = true;
  };
}
