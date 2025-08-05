{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages; # (this is the default) some amdgpu issues on 6.10

  programs = {

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      gamescopeSession.enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode.enable = true;

  };

  environment.systemPackages = with pkgs; [
    mangohud
    steam-run
    xdg-utils               # xdg-open
    pkgsi686Linux.libxkbcommon
    wayland
    pkgsi686Linux.wayland
  ];

  # Force o uso de Wayland no SDL
  environment.variables.SDL_VIDEODRIVER = "wayland";

}
