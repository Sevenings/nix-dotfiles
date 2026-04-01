{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.python;
in
{
  options.userSettings.python = {
    enable = lib.mkEnableOption "Enable Python";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    home.packages = with pkgs; [
      python312
      python312Packages.pip
      python312Packages.virtualenv
      python312Packages.numpy
      python312Packages.pandas
      python312Packages.openpyxl
      zlib
      stdenv.cc  # Para compilar pacotes Python que precisam de C (ex: numpy)
    ];
  };
}
