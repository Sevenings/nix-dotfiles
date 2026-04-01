{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.python_calculator;
in
{
  options.userSettings.python_calculator = {
    enable = lib.mkEnableOption "Enable python_calculator";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      python_calculator
    ];
  };
}
