{ config, lib, pkgs, inputs, ... }:

let
  importDir = import ../../misc/auxiliar/importDir.nix {inherit lib;};
in
{
  imports = importDir ../../modules/user;


  userSettings = {
    username = "senku";

    actions.enable = true;
    aseprite.enable = false;
    babel.enable = true;
    bambu-studio.enable = false;
    blender.enable = false;
    caelestia.enable = true;
    calcurse.enable = true;
    claude.enable = true;
    clipcat.enable = true;
    colors.enable = true;
    colorpicker.enable = true;
    cruise.enable = false;
    elixir.enable = false;
    fastfetch.enable = true;
    foliate.enable = false;
    freecad.enable = false;
    general.enable = true;
    gimp.enable = true;
    git.enable = true;
    go.enable = true;
    gtk.enable = true;

    hyprland = {
      enable = true;
      monitors = [
        "DP-1, highres, 0x0, 1" # Monitor principal
        "HDMI-A-1, highres, 1920x0, 1" # Meu segundo monitor
      ];
      workspaces = [
        "1, monitor:DP-1, default:true"
        "10, monitor:HDMI-A-1, default:true"
      ];
      windowRules = [
        "match:initial_title Picture-in-Picture, float on, size 518 291, pin on, move 1386 772"
      ];
      extraBinds = [
        "$mainMod CTRL, J, workspace, +1"
        "$mainMod CTRL, K, workspace, -1"
      ];
      extraEnv = [
        # Nvidia
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
      extraAnimations = [
        "workspaces, 1, 3, default, slidefadevert 10%"
      ];
      extraPlugins = [
        inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      ];
      keyboardName = "royuan-rt100-wired";
      hyprtrailsColor = "rgba(A9DC7680)";
    };

    hypridle = {
      enable = false;
      lockTimeout = 240;
      suspendTimeout = 242;
    };

    hyprpaper = {
      enable = false;
      preload = [ "$imagePath" "$secondMonitorPath" ];
      wallpapers = [
        "DP-1, $imagePath"
        "HDMI-A-1, $secondMonitorPath"
      ];
    };

    swaylock = {
      enable = false;
      image = "/home/senku/Imagens/Wallpapers/1330715.png";
    };

    inkscape.enable = false;
    keepass.enable = true;

    kitty = {
      enable = true;
      fontSize = 11.0;
    };

    kubernetes-local-cluster.enable = true;
    kubernetes-utils.enable = true;
    matrix.enable = false;
    mimetypes.enable = true;
    mpd.enable = true;
    musicnow.enable = true;
    nvim.enable = true;
    obsidian.enable = true;
    openCalendar.enable = false;
    python.enable = true;
    python_calculator.enable = false;
    qbittorrent.enable = false;
    ranger.enable = true;
    rofi.enable = true;
    rust.enable = true;
    swaync.enable = true;
    taskwarrior.enable = true;
    tce.enable = true;
    tinty.enable = true;
    vscode.enable = false;

    waybar = {
      enable = false;
      configFile = ./waybar-config.json;
    };

    xdg.enable = true;
    yazi.enable = true;
    zathura.enable = true;
    zen.enable = true;
    zsh.enable = true;
  };

  # Home Manager needs a bit of information about you and the paths it should manage.
  home = {
    username = config.userSettings.username;
    homeDirectory = "/home/${config.userSettings.username}";
    stateVersion = "24.11"; # Do not change

    # Pacotes extras específicos desta máquina
    packages = with pkgs; [
      kdePackages.kdenlive
    ];
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
  };

}
