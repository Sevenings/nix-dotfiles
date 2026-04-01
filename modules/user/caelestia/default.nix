{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.caelestia;
in
{
  options.userSettings.caelestia = {
    enable = lib.mkEnableOption "Enable Caelestia";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      quickshell
    ];

    programs.caelestia = {
      enable = true;
      systemd = {
        enable = true;
        target = "graphical-session.target";
        environment = [];
      };
      cli = {
        enable = true; # Also add caelestia-cli to path
        settings = {
          theme.enableGtk = false;
        };
      };
      settings = {
        background = {
          desktopClock.enabled = true;
        };

        bar = {
          status = {
            showBattery = true;
          };
          workspaces = {
            label = "";
            occupiedLabel = "";
            activeLabel = "";
            showWindows = false;
          };
        };

        launcher = {
          actionPrefix = ":";
          vimKeybinds = true;
        };

        session = {
          vimKeybinds = true;
          commands = {
            logout = ["loginctl" "terminate-user" ""];
            shutdown = ["systemctl" "poweroff"];
            hibernate = ["systemctl" "suspend"];
            reboot = ["systemctl" "reboot"];
          };
        };

        paths.wallpaperDir = "~/Imagens/Wallpapers";
      };
    };
  };
}
