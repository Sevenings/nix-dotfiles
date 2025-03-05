{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
      undollar
      cargo
      nodePackages.live-server
      postman
      wiki-tui
      direnv
      obsidian
      mpv
      obs-studio
      mosquitto
      libreoffice-qt6-fresh
      mqttui
      lazygit
      neovim 
      wget
      yazi
      zsh
      git
      gh
      kitty
      hyprland
      stow
      waybar
      hypridle
      hyprpaper
      firefox
      gcc
      unzip
      zip
      neofetch
      calcurse
      brightnessctl
      pulsemixer
      luarocks
      pkgs.wl-clipboard
      rofi
      swaynotificationcenter
      pkgs.wlogout
      grim
      slurp
      libnotify
      nodejs
      python3
      bluez
      bluez-tools
      ani-cli
      htop-vim
      xdragon
      gnumake
      kanshi
      zathura
      ranger  # Just because of rifle
    ];
}
