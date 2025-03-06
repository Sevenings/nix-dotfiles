{ config, pkgs, ... }:

{
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # symlink to the Nix store copy.
    ".config/waybar".source = ./waybar;
  };

  programs.waybar = {
    enable = true;
    settings = builtins.fromJSON ( builtins.readFile ./waybar/gruvbox/config.json );
    style = ./waybar/gruvbox/style.css;
  };

}
