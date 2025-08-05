{ pkgs, ... }:
let
  python = pkgs.python3.override {
    packageOverrides = self: super: {
      opencv4 = super.opencv4.override {
        enableGtk2 = true;
        gtk2 = pkgs.gtk2;
      };
    };
  };
in
{
  environment.systemPackages = with pkgs; [
    (python.withPackages (ps: with ps; [ 
      numpy 
      scipy 
      matplotlib
      pandas
      openpyxl
      opencv4 
    ]))
  ];
}

