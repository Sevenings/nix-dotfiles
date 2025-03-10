{ pkgs, system, inputs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
      inputs.zen-browser.packages."${system}".default
      minecraft
      inkscape
      cargo
      nodePackages.live-server
      postman
      wiki-tui
      direnv
      obsidian
      mpv
      mosquitto
      libreoffice-qt6-fresh
      mqttui
      neovim 
      wget
      gh
      git
      kitty
      stow
      hypridle
      hyprpaper
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
