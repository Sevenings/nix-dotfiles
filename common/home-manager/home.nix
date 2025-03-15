{ ... }:

{

  imports = [
    ./hyprland/hyprland.nix
    # ./hyprpaper.nix
    # ./hypridle.nix
    # ./swaylock.nix
    ./environment_variables.nix
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./kitty.nix
    ./mimetypes.nix
    ./nvim.nix
    # ./waybar/waybar.nix
    # ./legacy/legacy.nix
    # ./scripts/scripts.nix
    # ./python/environment.nix
    # ./colorschemes.nix
    # ./yazi/yazi.nix
  ];

  manual.html.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
