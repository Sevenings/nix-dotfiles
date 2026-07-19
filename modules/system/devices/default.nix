{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.devices;
in
{
  options.systemSettings.devices = {
    enable = lib.mkEnableOption "Enable devices";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      simple-mtpfs
      jmtpfs
      gvfs
    ];
  };
}
