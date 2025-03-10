{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Monokai";
    font = {
      name = "Source Code Pro";
      size = 13.0;
    };
    settings = {
      background_opacity = 0.75;
      confirm_os_window_close = false;
      enable_audio_bell = false;
    };
  };
}
