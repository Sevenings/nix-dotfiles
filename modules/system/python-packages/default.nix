{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.python-packages;
in
{
  options.systemSettings.python-packages = {
    enable = lib.mkEnableOption "Enable python-packages";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (python3.withPackages (ps: with ps; [
        numpy
        scipy
        matplotlib
        pandas
        openpyxl
      ]))
    ];
  };
}
