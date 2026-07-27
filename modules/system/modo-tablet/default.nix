{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.modo-tablet;
in
{
  options.systemSettings.modo-tablet = {
    enable = lib.mkEnableOption "Enable modo-tablet";
  };

  config = lib.mkIf cfg.enable {
    # Adiciona rotação de tela
    hardware.sensor.iio.enable = true;

    # Pacote de rotação de tela
    environment.systemPackages = with pkgs; [
      rot8
    ];
  };
}
