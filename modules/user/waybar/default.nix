{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.waybar;
in
{
  options.userSettings.waybar = {
    enable = lib.mkEnableOption "Enable waybar";

    configFile = lib.mkOption {
      type = lib.types.path;
      default = ./modules.json;
      description = "Arquivo JSON com a configuração do mainBar, pode ser sobrescrito por host";
    };
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    programs.waybar = {
      enable = true;
      style = ./css/monokai.css;
      settings = {
        mainBar = builtins.fromJSON ( builtins.readFile cfg.configFile );
      };
    };

    home.packages = with pkgs; [
      reload_waybar
    ];
  };
}
