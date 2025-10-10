{ pkgs, inputs, ... }:

{
  programs = {

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
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
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
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    nix-ld.enable = true;

  };
}
