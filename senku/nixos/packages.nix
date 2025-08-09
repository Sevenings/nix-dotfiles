{ pkgs, system, inputs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
      ncmpc
      ncmpcpp
      pms
      mmtc
      inori
      vimpc
      mpc
      prismlauncher
      inkscape
      tuxguitar
    ];
}
