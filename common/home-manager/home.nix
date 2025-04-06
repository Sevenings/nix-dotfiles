{ ... }:

{

  imports = [
    ./hyprland/hyprland.nix
    ./environment_variables.nix
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./kitty.nix
    ./mimetypes.nix
    ./nvim.nix
    ./wlogout/wlogout.nix
    ./yazi/yazi.nix
    ./zathura.nix
    ./scripts/scripts.nix
    ./zsh/zsh.nix
    ./programs.nix
  ];

  manual.html.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
