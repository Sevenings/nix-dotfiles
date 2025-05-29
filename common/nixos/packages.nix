{ pkgs, system, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
      gparted
      clipcat
      eog
      filezilla
      pnpm
      bash
      xorg.xauth
      xorg.xhost
      yq
      gimp
      hyprpicker
      exiftool
      killall
      tree-sitter
      pandoc
      firefox
      inputs.zen-browser.packages."${system}".default
      undollar
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
      swaynotificationcenter
      pkgs.wlogout
      grim
      slurp
      libnotify
      nodejs
      bluez
      bluez-tools
      ani-cli
      htop-vim
      xdragon
      gnumake
      kanshi
      ranger  # Just because of rifle

      # Latex
      texliveFull
      texlivePackages.latexmk
    ];
}
