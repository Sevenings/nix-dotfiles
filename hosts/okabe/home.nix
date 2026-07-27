{ config, lib, pkgs, ... }:

let
  importDir = import ../../misc/auxiliar/importDir.nix {inherit lib;};
in
{
  imports = importDir ../../modules/user;


  userSettings = {
    username = "okabe";

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
    foliate.enable = true;
    freecad.enable = true;
    general.enable = true;
    gimp.enable = true;
    git.enable = true;
    go.enable = true;
    gtk.enable = true;

    hyprland = {
      enable = true;
      monitors = [
        "eDP-1, highres, 0x0, 1" # Monitor principal
        "desc:Dell Inc. DELL D2216H 70GJH69U1SII, highres, 0x-1080, 1" # Monitor do estágio
        # Outros monitores: espelhados por padrão
        ", highres, 0x1080, 1, mirror, eDP-1"
      ];
      extraAnimations = [
        "workspaces, 1, 3, default, slidefade 10%"
      ];
      keyboardName = "at-translated-set-2-keyboard";
      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
      };
      extraSettings = {
        plugin.touch_gestures = {
          # The default sensitivity is probably too low on tablet screens,
          # I recommend turning it up to 4.0
          sensitivity = 4.0;

          # must be >= 3
          workspace_swipe_fingers = 3;

          # switching workspaces by swiping from an edge, this is separate from workspace_swipe_fingers
          # and can be used at the same time
          # possible values: l, r, u, or d
          # to disable it set it to anything else
          workspace_swipe_edge = "d";

          # in milliseconds
          long_press_delay = 400;

          # resize windows by long-pressing on window borders and gaps.
          # If general:resize_on_border is enabled, general:extend_border_grab_area is used for floating
          # windows
          resize_on_border_long_press = true;

          # in pixels, the distance from the edge that is considered an edge
          edge_margin = 10;

          # emulates touchpad swipes when swiping in a direction that does not trigger workspace swipe.
          # ONLY triggers when finger count is equal to workspace_swipe_fingers
          #
          # might be removed in the future in favor of event hooks
          emulate_touchpad_swipe = false;

          experimental = {
            # send proper cancel events to windows instead of hacky touch_up events,
            # NOT recommended as it crashed a few times, once it's stabilized I'll make it the default
            send_cancel = 0;
          };
        };
      };
    };

    hypridle = {
      enable = false;
      lockTimeout = 300;
      suspendTimeout = 485;
    };

    hyprpaper = {
      enable = false;
      preload = [ "$imagePath" "$secondMonitorPath" ];
      wallpapers = [
        "eDP-1, $imagePath"
        "HDMI-A-1, $secondMonitorPath"
      ];
    };

    swaylock = {
      enable = true;
      image = "/home/okabe/Imagens/Wallpapers/steins gate/steins-gate-rainbow.png";
      indicatorImage = "/home/okabe/Imagens/Wallpapers/swaylock/omnitrix.png";
    };

    inkscape.enable = false;
    keepass.enable = true;

    kitty = {
      enable = true;
      fontSize = 12.0;
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
      tesseract
      ocrmypdf
      se_expediente
      horario_ponto
      cura-appimage
    ];
  };

  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
  };

}
