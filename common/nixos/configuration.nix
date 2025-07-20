{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./packages.nix
      ./programs.nix
      ./python_packages.nix
      ./display_manager.nix
      ./docker.nix
      ./arduino.nix
      # ./printing.nix
      ./services.nix
      ./sound.nix
    ];

  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings.substituters = [
    "https://cache.nixos.org" 
    "https://nix-community.cachix.org" 
  ];

  # Nixpkgs
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  }; 
  

  # Boot configurations
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
  };

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";
  i18n = {
    defaultLocale = "pt_BR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  networking.extraHosts = ''
    172.17.120.54 tce-automacao
    192.168.0.84 beebopi
  '';

  networking.firewall.enable = false;

  # Fonts
  # fonts.fontDir.enable = true;
  # fonts.packages = [] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  # Before 25.05 (24.05 or earlier)
  fonts.packages = [] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
  };

  console.keyMap = "br-abnt2";

  security.polkit.enable = true;

}
