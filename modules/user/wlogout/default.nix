{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.wlogout;
in
{
  options.userSettings.wlogout = {
    enable = lib.mkEnableOption "Enable wlogout";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    programs.wlogout = {
      enable = true;
      style = ./styleGoku.css;

      layout = [
        {
            label = "shutdown";
            action = "systemctl poweroff";
            text = "Shutdown (S) ";
            keybind = "s";
        }
        {
            label = "reboot";
            action = "systemctl reboot";
            text = "Reboot (R) ";
            keybind = "r";
        }
        {
            label = "suspend";
            action = "systemctl suspend; sleep 2 && swaylock";
            text = "Suspend (U) ";
            keybind = "u";
        }
        {
            label = "logout";
            action = "hyprctl dispatch exit";
            text = "Logout (E) ";
            keybind = "e";
        }
      ];
    };
  };
}
