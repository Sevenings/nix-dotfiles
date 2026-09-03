{ config, lib, pkgs, nixpkgs-unstable, ... }:

let
  cfg = config.systemSettings.packages;
in
{
  options.systemSettings.packages = {
    enable = lib.mkEnableOption "Enable packages";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      yt-dlp
      lua5_3_compat
      jq
      socat
      fd
      eww
      unar
      usbutils
      sqlite
      hyprpolkitagent
      clipcat
      eog
      pnpm
      bash
      xauth
      xhost
      yq
      hyprpicker
      exiftool
      killall
      tree-sitter
      pandoc
      firefox
      undollar
      postman
      wiki-tui
      direnv
      mpv
      libreoffice-qt6-fresh
      nixpkgs-unstable.neovim
      wget
      gh
      kitty
      stow
      hypridle
      hyprpaper
      gcc
      unzip
      zip
      calcurse
      brightnessctl
      pulsemixer
      lua-language-server
      luarocks
      pkgs.wl-clipboard
      pkgs.wlogout
      grim
      slurp
      libnotify
      nodejs
      bluez
      bluez-tools
      htop-vim
      dragon-drop
      gnumake
      kanshi
      ranger # Just because of rifle
      gparted

      # Latex
      texliveFull
      texlivePackages.latexmk
    ];
  };
}
