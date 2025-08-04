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

  };

  hardware.xone.enable = true; # support for the xbox controller USB dongle

  services.getty.autologinUser = "senku";

  environment = {
    systemPackages = pkgs.mangohud;
    loginShellInit = ''
      [[ "$(tty)" = "/dev/tty1" ]] && ./gs.sh
    '';
  };
}
