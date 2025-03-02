{ ... }:

{
  programs = {

    git = {
      enable = true;
      userName = "Sevenings";
      userEmail = "lvlassis.2@gmail.com";
    };

    lazygit = {
      enable = true;
      settings = {};
    };

    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };

    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = [];
    };

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    waybar.enable = true;

    firefox = {
      enable = true;
      languagePacks = [ "br" "en-US" "fr" ];
    };

  };
}
