{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Propo";
    themeFile = "Monokai_Pro";
    settings = {
      background = "#0d0f18";
      background_opacity = "0.75";

      confirm_os_window_close = 0;
      enable_audio_bell = false;
      remember_window_size = false;
    };
  };
}
