{ config, pkgs, ... }:

{
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
}

