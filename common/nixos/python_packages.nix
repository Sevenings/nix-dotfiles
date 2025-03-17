{ pkgs, ... }:

{
  environment.systemPackages = with pkgs.python3Packages; [
    numpy
    notebook
  ];
}

