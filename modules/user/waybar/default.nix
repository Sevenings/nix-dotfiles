{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.waybar;
in
{
  options.userSettings.waybar = {
    enable = lib.mkEnableOption "Enable waybar";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    programs.waybar = {
      enable = true;
      style = ./css/monokai.css;
      settings = {
        mainBar = builtins.fromJSON ( builtins.readFile ./modules.json );
      };
    };

    home.packages = with pkgs; [
      reload_waybar
    ];
  };
}
