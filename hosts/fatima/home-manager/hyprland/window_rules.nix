{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland.settings = {

        windowrulev2 = [
            # pulsemixer
            "float,title:(pulsemixer)"

            # nmtui
            "float,title:(nmtui)"

            # MiniTerminal
            "float,class:(miniTerminal)"
            "workspace special:magic,class:(miniTerminal)"

            # Floating Terminal
            "float,class:(floatingTerminal)"

            # Dictionary
            "float,class:(org.gnome.Dictionary)"
            "size 400 300,class:(org.gnome.Dictionary)"
            "move 1515 390,class:(org.gnome.Dictionary)"

            # Calcurse
            "size 1200 700, class:(miniTerminal), title:(calcurse)"
            "move 360 190, class:(miniTerminal), title:(calcurse)"

            # Wlogout
            "noanim,fullscreen, class:(wlogout)"

            # KDE Password Agent
            "float,class:(org.kde.polkit-kde-authentication-agent-1)"
         
            # Pygame window
            "float,title:(pygame window)"

            # Stayfocused Windows
            #windowrulev2 = stayfocused,class:(jetbrains-studio)
            #windowrulev2 = stayfocused,class:(steam)

            # Spotify Workspace
            "workspace $spotify_workspace, class:(Spotify)"
        ];

    };
}
