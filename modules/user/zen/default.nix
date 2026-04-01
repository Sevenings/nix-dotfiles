{ config, lib, pkgs, inputs, system, ... }:

let
  cfg = config.userSettings.zen;
  zen-wrapper = import ../../../misc/wrappers/zen.nix { inherit pkgs inputs system; };
in
{
  options.userSettings.zen = {
    enable = lib.mkEnableOption "Enable zen";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      zen-wrapper
    ];
  };
}
