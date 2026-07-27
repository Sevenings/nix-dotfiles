{ config, lib, pkgs, ... }:

let
  importDir = import ../../misc/auxiliar/importDir.nix { inherit lib; };
in
{
  imports = importDir ../../modules/system ++ [
    ./hardware-configuration.nix
    ./hd_mounting.nix
  ];

  systemSettings = {
    username = "senku";

    arduino.enable = true;
    devices.enable = true;
    display-manager.enable = true;
    dms.enable = false;
    docker.enable = true;
    fonts.enable = true;
    modo-tablet.enable = false;
    nvidia.enable = true;
    ollama.enable = false;
    opentabletdriver.enable = true;
    openrgb.enable = true;
    packages.enable = true;
    power-management.enable = false;
    printing.enable = true;
    programs.enable = true;
    python-packages.enable = true;
    services.enable = true;
    session-variables.enable = true;
    steam.enable = true;
    syncthing.enable = true;
    tailscale.enable = true;
  };

  networking.hostName = "stonebox"; # Define your hostname.

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.senku = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" "adbusers" "input" ]; # Enable 'sudo' for the user.
    description = "Ishigami Senku";
  };
  users.defaultUserShell = pkgs.zsh;

  systemd.settings.Manager = {
    DefaultTimeoutStopSec = 10;
    DefaultTimeoutAbortSec = 10;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
