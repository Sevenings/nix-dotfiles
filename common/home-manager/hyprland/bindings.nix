{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {

    "$mainMod" = "SUPER";
    "$specialWorkspace"="S";

    bind = [
      "$mainMod, U, exec, notify-send $(slurp -p)"

      "$mainMod, Return, exec, kitty"
      "$mainMod SHIFT, Return, exec, $openMiniTerminal"
      "$mainMod, T, exec, $openTerminal"
      "$mainMod SHIFT, T, exec, $openMiniTerminal"
      "$mainMod, W, exec, zen"
      "$mainMod, Q, killactive, "
      "$mainMod, 0, exec, $logoutMenu "
      "$mainMod, Escape, exec, $logoutMenu"
      "$mainMod, E, exec, $openFileManager"
      "$mainMod SHIFT, E, exec, $openMiniFileManager"
      "$mainMod, V, togglesplit, "
      "$mainMod, D, exec, $cmdLauncher"
      "$mainMod, A, exec, $appLauncher"
      # "$mainMod, O, exec, $appLauncher"
      "$mainMod, F, togglefloating, "
      "$mainMod, I, fullscreen, 1"
      "$mainMod SHIFT, I, fullscreen"
      "$mainMod SHIFT, F, fullscreen"
      ", F11, fullscreen"
      ", XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5"
      ", XF86AudioLowerVolume, exec, pulsemixer --change-volume -5"
      ", XF86AudioMute, exec, pulsemixer --toggle-mute"
      ", XF86AudioMicMute, exec, toggle-mic-mute.sh"
      ", XF86Calculator, exec, $calculator"
      "$mainMod, O, centerwindow"
      "$mainMod CTRL, S, pin"
      "$mainMod, C, exec, openCalendar.sh"
      "Ctrl, XF86Calculator, exec, kitty -e nvim"
      "$mainMod, N, exec, obsidian"
      "$mainMod, F1, exec, kitty --class=\"miniTerminal\" -e nvim '$HOME/Anotações/Todo/todo atual.md'"

      # Copy from Memory
      "$mainMod SHIFT, C, exec, memoryCopy.sh"

      # Open Menu
      "$mainMod, Z, exec, launch_dashboard.sh"

      # Print
      ", Print, exec, grim -g \"$(slurp)\" - | wl-copy && notify-send \"Captura de Tela\" \"Seleção enviada para o Ctrl+C\""
      "SHIFT, Print, exec, grim -g \"$(slurp)\" ~/Imagens/Screenshots/$(date +%Y%m%d%H%M%S).png && notify-send \"Captura de Tela\" \"Seleção salva em Imagens\""
      "CTRL, Print, exec, grim - | wl-copy && notify-send \"Captura de Tela\" \"Tela Inteira enviada para o Ctrl+C\""
      "CTRL+SHIFT, Print, exec, grim ~/Imagens/Screenshots/$(date +%Y%m%d%H%M%S).png && notify-send \"Captura de Tela\" \"Tela Inteira salva em Imagens\""

      "$mainMod, Print, exec, grim -g \"$(hyprctl activewindow | grep at: | awk -F'[:,]' '{print $2 \",\" $3}') $(hyprctl activewindow | grep size: | awk -F'[:,]' '{print $2 \"x\" $3}')\" - | wl-copy && notify-send \"Captura de Janela\" \"Janela enviada para o Ctrl+C\""
      "$mainMod SHIFT, Print, exec, grim -g \"$(hyprctl activewindow | grep at: | awk -F'[:,]' '{print $2 \",\" $3}') $(hyprctl activewindow | grep size: | awk -F'[:,]' '{print $2 \"x\" $3}')\" && notify-send \"Captura de Janela\" \"Janela salva em Imagens\""
      # $mainMod, M, exec, firefox web.whatsapp.com
      "$mainMod, M, exec, firefox mail.google.com"
      # "$mainMod, Space, exec, $fuzzyShot"
      "$mainMod, B, exec, babel.sh"

      # ColorPicker
      "ALT, Print, exec, colorPicker.sh"

      # Atalhos de Pastas
      "CTRL ALT, P, exec, kitty -e yazi ~/Projetos"
      "CTRL ALT, T, exec, kitty -e yazi ~/Estagio\ TCE"
      "CTRL ALT, M, exec, kitty -e yazi ~/Documentos/monitoria"
      "CTRL ALT, A, exec, kitty -e yazi ~/Documentos/atividades"
      "CTRL ALT, B, exec, kitty -e yazi ~/Documentos/biblioteca\ de\ babel"
      "CTRL ALT, S, exec, kitty -e yazi ~/.myScripts"
      "CTRL ALT, G, exec, kitty -e nvim ~/.config/globals/global_variables.sh"
      "$mainMod, F12, exec, kitty -e yazi ~/.dotfiles"

      # Controls
      ", XF86MonBrightnessUp, exec, brightnessctl --exponent=4 s +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl --exponent=4 s 5%-"

      # Switch Dwindle and Master
      "$mainMod, Y, exec, switchLayout.sh"
      
      # Switch keyboard style
      "$mainMod, Space, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next"


      # ---------------------------------------------------
      #              Movement Bindings
      # ---------------------------------------------------

      # Move focus with mainMod + arrow keys
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Move windows
      "$mainMod SHIFT, H, movewindow, l"
      "$mainMod SHIFT, L, movewindow, r"
      "$mainMod SHIFT, K, movewindow, u"
      "$mainMod SHIFT, J, movewindow, d"

      # Alt + TAB
      "$mainMod, Tab, cyclenext,"
      "$mainMod SHIFT, Tab, cyclenext, prev"
      "alt, Tab, cyclenext,"
      "alt SHIFT, Tab, cyclenext, prev"


      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, apostrophe, workspace, 9"
      "$mainMod CTRL, H, workspace, -1"
      "$mainMod CTRL, L, workspace, +1"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"

      "$mainMod CTRL, 1, movetoworkspacesilent, 1"
      "$mainMod CTRL, 2, movetoworkspacesilent, 2"
      "$mainMod CTRL, 3, movetoworkspacesilent, 3"
      "$mainMod CTRL, 4, movetoworkspacesilent, 4"
      "$mainMod CTRL, 5, movetoworkspacesilent, 5"
      "$mainMod CTRL, 6, movetoworkspacesilent, 6"
      "$mainMod CTRL, 7, movetoworkspacesilent, 7"
      "$mainMod CTRL, 8, movetoworkspacesilent, 8"
      "$mainMod CTRL, 9, movetoworkspacesilent, 9"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Special Workspace configuration
      "$mainMod, $specialWorkspace, togglespecialworkspace, magic"
      "$mainMod SHIFT, $specialWorkspace, movetoworkspace, special:magic"
      "$mainMod CTRL, $specialWorkspace, movetoworkspacesilent, special:magic"
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
      
  };
}
