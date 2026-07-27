{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.docker;
in
{
  options.systemSettings.docker = {
    enable = lib.mkEnableOption "Enable docker";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
