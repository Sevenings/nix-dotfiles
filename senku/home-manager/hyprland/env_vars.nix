{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland.settings = {
        
        env = [
            # Nvidia
            "LIBVA_DRIVER_NAME,nvidia"
            "XDG_SESSION_TYPE,wayland"
            "GBM_BACKEND,nvidia-drm"
            "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        ];

    };
}
