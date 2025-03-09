{ config, pkgs, ... }:

{
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # symlink to the Nix store copy.
    ".config/calcurse".source = ./common/calcurse;
    ".config/nvim".source = ./common/nvim;
    ".config/ranger".source = ./common/ranger;
    ".config/zsh".source = ./common/zsh;

    ".config/neofetch".source = ./system/neofetch;
    ".config/rofi".source = ./system/rofi;
    ".config/swaync".source = ./system/swaync;
    ".config/wlogout".source = ./system/wlogout;
    ".zshrc".source = ./system/dot-zshrc;
  };

}
