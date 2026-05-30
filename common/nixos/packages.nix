{ pkgs, system, inputs, nixpkgs-unstable, ... }:

{
    environment.systemPackages = with pkgs; [
      yt-dlp
      # webtorrent_desktop
      # torrential
      lua5_3_compat
      jq
      socat
      fd
      eww
      # nautilus
      unar
      # udisks
      usbutils
      # usb-blaster-udev-rules
      # dbeaver-bin
      sqlite
      # wireshark-qt
      hyprpolkitagent
      # kdePackages.partitionmanager
      clipcat
      eog
      # filezilla
      pnpm
      bash
      xorg.xauth
      xorg.xhost
      yq
      # gimp
      hyprpicker
      exiftool
      killall
      tree-sitter
      pandoc
      firefox
      # inputs.zen-browser.packages."${system}".default  # Movido para Home Manager com wrapper
      undollar
      # nodePackages.live-server # error: 'live-server' has been removed because it was unmaintained upstream
      postman
      wiki-tui
      direnv
      mpv
      # mosquitto
      libreoffice-qt6-fresh
      # mqttui
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
      # ani-cli
      htop-vim
      dragon-drop
      gnumake
      kanshi
      ranger  # Just because of rifle

      # Latex
      texliveFull
      texlivePackages.latexmk
    ];
}
