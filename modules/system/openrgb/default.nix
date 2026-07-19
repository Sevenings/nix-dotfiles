{ config, lib, ... }:

let
  cfg = config.systemSettings.openrgb;
in
{
  options.systemSettings.openrgb = {
    enable = lib.mkEnableOption "Enable openrgb";
  };

  config = lib.mkIf cfg.enable {
    services.hardware.openrgb.enable = true;
  };
}
