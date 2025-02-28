{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    python312
    python312Packages.pip
    python312Packages.virtualenv
    zlib
    stdenv.cc  # Para compilar pacotes Python que precisam de C (ex: numpy)
  ];
}

