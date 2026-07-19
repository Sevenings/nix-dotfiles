{ config, lib, ... }:

let
  cfg = config.userSettings.hypridle;
in
{
  options.userSettings.hypridle = {
    enable = lib.mkEnableOption "Enable hypridle";

    dpmsTimeout = lib.mkOption {
      type = lib.types.int;
      default = 180;
      description = "Segundos até desligar o DPMS (dpms off/on)";
    };

    lockTimeout = lib.mkOption {
      type = lib.types.int;
      default = 240;
      description = "Segundos até travar a sessão (loginctl lock-session)";
    };

    suspendTimeout = lib.mkOption {
      type = lib.types.int;
      default = 300;
      description = "Segundos até suspender o sistema (systemctl suspend)";
    };
  };

  config = lib.mkIf cfg.enable {
    services.hypridle.enable = true;

    services.hypridle.settings = {
      general = {
        lock_cmd = "swaylock -e --timestr '%H:%M' --datestr '%d/%m/%y'";
        before_sleep_cmd = "loginctl lock-session";
      };

      listener = [
        {
          timeout = cfg.dpmsTimeout;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = cfg.lockTimeout;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = cfg.suspendTimeout;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
