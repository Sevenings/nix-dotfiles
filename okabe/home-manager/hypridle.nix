{ config, pkgs, ... }:

{
    services.hypridle.enable = true;

    services.hypridle.settings = {

        general = {
            lock_cmd = "swaylock -e --timestr '%H:%M' --datestr '%d/%m/%y'";
            before_sleep_cmd = "loginctl lock-session";
        };

        listener = [
            {
                timeout = 180; # 3mins
                on-timeout = "hyprctl dispatch dpms off";
                on-resume = "hyprctl dispatch dpms on";
            }

            {
                timeout = 300; # 5mins
                on-timeout = "loginctl lock-session";
            }

            {
                timeout = 485; # 4mins 2s
                on-timeout = "systemctl suspend";
            }
        ];

    };
}
