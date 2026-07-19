{ config, pkgs, inputs, lib, ... }:

let
  cfg = config.userSettings.hyprland;
in
{
  # Configurações comuns do hyprland

  imports = [
    ./appearance.nix
    ./auto-start.nix
    ./bindings.nix
    ./env_vars.nix
    ./input.nix
    ./plugins.nix
  ];

  options.userSettings.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland";

    monitors = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Linhas de configuração de monitor (wayland.windowManager.hyprland.settings.monitor)";
    };

    workspaces = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Atribuição de workspaces a monitores (settings.workspace)";
    };

    windowRules = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Regras de janela específicas do host (settings.windowrule)";
    };

    extraBinds = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Binds adicionais específicos do host (mesclados com os binds comuns)";
    };

    extraEnv = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Variáveis de ambiente extras do Hyprland (ex: drivers de GPU)";
    };

    extraAnimations = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Animações extras específicas do host";
    };

    extraPlugins = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "Plugins de Hyprland extras específicos do host";
    };

    keyboardName = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Nome do dispositivo de teclado usado na variável \$keyboard (ex: p/ switchxkblayout)";
    };

    hyprtrailsColor = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Cor do plugin hyprtrails, quando habilitado";
    };

    touchpad = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
      description = "Configurações extras de input.touchpad (notebooks)";
    };

    extraSettings = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
      description = "Escape hatch: mesclado diretamente em wayland.windowManager.hyprland.settings (ex: plugins específicos de um host)";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        systemd.enable = false;
        configType = "hyprlang";
        plugins = cfg.extraPlugins;
      };

      home.packages = with pkgs; [
        playerctl
        workspace
        switchlayout
        togglecapslock
      ];


      wayland.windowManager.hyprland.extraConfig = ''
        source = ~/.config/hypr/dev.conf
      '';

      wayland.windowManager.hyprland.settings = {

        # Some Applications var utils
        "$logoutMenu" = "wlogout --buttons-per-row 4";


        # Programs Variables
        "$terminal" = "kitty";
        "$fileManager" = "yazi";
        "$openTerminal" = "$terminal";
        "$openMiniTerminal" = "$terminal --class=miniTerminal";
        "$openFileManager" = "$terminal -e $fileManager";
        "$openMiniFileManager" = "$terminal --class=miniTerminal -e $fileManager";
        "$appLauncher" = "rofi -show drun -disable-history -show-icons";
        "$cmdLauncher" = "rofi -show run";
        "$browser" = "zen";
        "$fzfShot" = "$scripts_root/fzfShot.sh";
        "$fuzzyShot" = "$terminal --class=floatingTerminal -e fzfShot.sh";
        "$calendar" = "openCalendar";
        "$calculator" = "python_calculator";


        # SPECIAL WORKSPACES
        "$spotify_workspace"="9";


        # Layout
        dwindle = {
          preserve_split = true; # you probably want this
        };

        master = {
          #new_is_master = false
        };

        gesture = [
          "3, horizontal, workspace"
        ];

        misc = {
          force_default_wallpaper = 0; # Set to 0 to disable the anime mascot wallpapers
          disable_splash_rendering = true;
        };

        binds = {
          workspace_back_and_forth = true;
        };

        # Específico do host
        monitor = cfg.monitors;
        workspace = cfg.workspaces;
        windowrule = cfg.windowRules;
        bind = cfg.extraBinds;
        env = cfg.extraEnv;
        animation = cfg.extraAnimations;
      };
    })

    (lib.mkIf (cfg.enable && cfg.keyboardName != null) {
      wayland.windowManager.hyprland.settings."$keyboard" = cfg.keyboardName;
    })

    (lib.mkIf (cfg.enable && cfg.hyprtrailsColor != null) {
      wayland.windowManager.hyprland.settings.plugin.hyprtrails.color = cfg.hyprtrailsColor;
    })

    (lib.mkIf (cfg.enable && cfg.touchpad != { }) {
      wayland.windowManager.hyprland.settings.input.touchpad = cfg.touchpad;
    })

    (lib.mkIf (cfg.enable && cfg.extraSettings != { }) {
      wayland.windowManager.hyprland.settings = cfg.extraSettings;
    })
  ];
}
