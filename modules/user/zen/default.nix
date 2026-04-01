{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.zen;
in
{
  options.userSettings.zen = {
    enable = lib.mkEnableOption "Enable zen";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    let
      zen-wrapper = import ../../misc/wrappers/zen.nix { inherit pkgs inputs system; };
    in
    home.packages = with pkgs; [
      zen-wrapper
    ];
  };
}
