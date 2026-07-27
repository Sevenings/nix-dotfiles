{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.arduino;
in
{
  options.systemSettings.arduino = {
    enable = lib.mkEnableOption "Enable arduino";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      arduino-cli
    ];

    services.udev.packages = with pkgs; [
      platformio # já inclui regras de udev para placas suportadas
    ];
  };
}
