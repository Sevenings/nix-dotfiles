{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.systemSettings.programs;
in
{
  options.systemSettings.programs = {
    enable = lib.mkEnableOption "Enable programs";
  };

  config = lib.mkIf cfg.enable {
    programs = {

      git.enable = true;

      lazygit = {
        enable = true;
        settings = { };
      };

      zsh.enable = true;

      obs-studio = {
        enable = true;
        enableVirtualCamera = true;
        plugins = [ ];
      };

      hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      };

      nix-ld.enable = true;
      nix-ld.libraries = with pkgs; [

        # Básicas do sistema
        stdenv.cc.cc.lib
        glibc

        # DBus e sistema
        dbus
        systemd

        # X11 e gráficos
        libx11
        libxext
        libxi
        libxrender
        libxrandr
        libxfixes
        libxcursor
        libxinerama
        libxcb
        libxcomposite
        libxdamage
        libxtst
        libSM
        libICE

        # OpenGL
        libGL
        libGLU
        mesa

        # Fontes e renderização
        fontconfig
        freetype

        # Qt e GTK (caso precise)
        qt5.qtbase
        qt5.qtdeclarative
        glib

        # Audio
        alsa-lib
        libpulseaudio

        # Outras comuns
        zlib
        libpng
        libjpeg
        expat
        libxkbcommon
        libdrm

        # NSS/SSL
        nss
        nspr
        openssl
      ];

    };
  };
}
