{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # foliate
    kdePackages.kdenlive
    # inkscape
    # tuxguitar
  ];
}
