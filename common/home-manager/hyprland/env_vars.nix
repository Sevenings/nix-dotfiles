{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland.settings = {
        
        env = [
            "XCURSOR_SIZE,16"
            "XDG_CURRENT_DESKTOP, Hyprland"
            "XDG_SESSION_TYPE, wayland"
            "XDG_SESSION_DESKTOP, Hyprland"
            "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
            "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
            "QT_QPA_PLATFORMTHEME, qt5ct"
            "GDK_BACKEND, wayland,x11"
            "QT_QPA_PLATFORM, xcb"
            "SDL_VIDEODRIVER, wayland"
            "CLUTTER_BACKEND, wayland"
            "EDITOR, nvim"
            "VISUAL, nvim"
        ];

    };
}
