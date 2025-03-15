{ config, pkgs, ... }:

{
  # Configurações comuns do hyprland

  wayland.windowManager.hyprland = {
    enable = true;
  };

  imports = [
    ./appearance.nix
    ./auto-start.nix
    ./bindings.nix
    ./env_vars.nix
    ./plugins.nix
    ./window_rules.nix
    ./input.nix
    ./workspaces.nix
  ];


  wayland.windowManager.hyprland.settings = {

    # Some Applications var utils
    "$logoutMenu" = "wlogout --css $HOME/.config/wlogout/styleGoku.css --layout $HOME/.config/wlogout/layout  --buttons-per-row 4";


    # Programs Variables
    "$terminal" = "kitty";
    "$fileManager" = "yazi";
    "$openTerminal" = "$terminal";
    "$openMiniTerminal" = "$terminal --class=miniTerminal";
    "$openFileManager" = "$terminal -e $fileManager";
    "$openMiniFileManager" = "$terminal --class=miniTerminal -e $fileManager";
    "$appLauncher" = "rofi -show drun -disable-history -show-icons";
    "$cmdLauncher" = "rofi -show run";
    "$browser" = "firefox";
    "$fzfShot" = "$scripts_root/fzfShot.sh";
    "$fuzzyShot" = "$terminal --class=floatingTerminal -e fzfShot.sh";
    "$calendar" = "$scripts_root/openCalendar.sh";
    "$calculator" = "$scripts_root/pythonCalculator/python_calculator.sh";


    # SPECIAL WORKSPACES
    "$spotify_workspace"="9";


    # Layout
    dwindle = {
      pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # you probably want this
    };

    master = {
      #new_is_master = false
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_cancel_ratio = 0.10;
    };

    misc = {
      force_default_wallpaper = 0; # Set to 0 to disable the anime mascot wallpapers
      disable_splash_rendering = true;
    };

    binds = {
      workspace_back_and_forth = true;
    };

  };
}
