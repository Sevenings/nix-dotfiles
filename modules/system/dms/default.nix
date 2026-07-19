{ config, lib, ... }:

let
  cfg = config.systemSettings.dms;
in
{
  options.systemSettings.dms = {
    enable = lib.mkEnableOption "Enable dms";
  };

  config = lib.mkIf cfg.enable {
    programs.dms-shell = {
      enable = true;
      systemd.enable = true;
    };
  };
}
