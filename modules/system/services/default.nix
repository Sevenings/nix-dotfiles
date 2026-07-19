{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.services;
in
{
  options.systemSettings.services = {
    enable = lib.mkEnableOption "Enable services";
  };

  config = lib.mkIf cfg.enable {
    services = {
      clipcat.enable = true;

      pipewire = {
        enable = true;
        alsa.enable = true;
        jack.enable = true;
        pulse.enable = true;
        wireplumber.enable = true;
      };

      udisks2.enable = true;

      dbus.enable = true;

      udev = {
        packages = [ pkgs.libmtp ];
        extraRules = ''
          KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
        '';
      };
    };
  };
}
