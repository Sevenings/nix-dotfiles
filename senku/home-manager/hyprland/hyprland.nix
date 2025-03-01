{ config, pkgs, ... }:

{
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
    ];


    wayland.windowManager.hyprland.settings = {

        # Some Applications var utils
        "$logoutMenu" = "wlogout --css $HOME/.config/wlogout/styleGoku.css --layout $HOME/.config/wlogout/layout  --buttons-per-row 4";

        # Monitor configuration
        monitor = [
			# Monitor principal
            "DP-2, highres, 0x0, 1"	

			# Meu segundo monitor
            "HDMI-A-1, highres, 0x1920, 1"	

			# Outros monitores: espelhados por padrão
            ", highres, 0x1080, 1, mirror, eDP-1"  
        ];

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


        # Keyboard and Mouse
        input = {
            kb_layout = "br, us";
            kb_options = "caps:escape";

            repeat_rate = 35;
            repeat_delay = 340;

            follow_mouse = 1;
            touchpad = {
                natural_scroll = true;
                disable_while_typing = true;
            };

            sensitivity = 1.0; # -1.0 - 1.0, 0 means no modification.
            accel_profile = "flat";
        };
    
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
