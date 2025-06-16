{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: with ps; [ 
      numpy 
      scipy 
      matplotlib
      pandas
      openpyxl
    ]))
  ];
}

