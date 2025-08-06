{ ... }:

{

  imports = [
    ./clipcat.nix
    ./hyprland/hyprland.nix
    ./environment_variables.nix
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./kitty.nix
    ./mimetypes.nix
    ./nvim.nix
    ./programs.nix
    ./scripts/scripts.nix
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    # ./xdg.nix
    ./yazi/yazi.nix
    ./zathura.nix
    ./zsh/zsh.nix
  ];

  manual.html.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
