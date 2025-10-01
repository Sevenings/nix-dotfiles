# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hd_mounting.nix
      ./nvidia.nix
      ./packages.nix
      ./programs.nix
      ./services.nix
      ./steam.nix
    ];

  networking = {
    hostName = "stonebox"; # Define your hostname.
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.senku = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" ]; # Enable ‘sudo’ for the user.
    description = "Ishigami Senku";
  };
  users.defaultUserShell = pkgs.zsh;


  # Nixpkgs
  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
  }; 

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
    DefaultTimeoutAbortSec=10s
  '';

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

