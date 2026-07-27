{ config, lib, ... }:

let
  cfg = config.userSettings.fastfetch;
in
{
  options.userSettings.fastfetch = {
    enable = lib.mkEnableOption "Enable Fastfetch";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos";
          padding = {
            right = 1;
          };
        };
        modules = [
          "title"
          "separator"
          "os"
          "host"
          "wm"
          "terminal"
          "shell"
          # "packages" # Comentado pois é lento (enumera 7000+ pacotes)
          "battery"
          "memory"
          "disk"
          "uptime"
          "separator"
          "break"
          "colors"
        ];
      };
    };
  };
}
