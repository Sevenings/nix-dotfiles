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
    ./wlogout/wlogout.nix
    ./yazi/yazi.nix
    ./zathura.nix
    # ./waybar/waybar.nix
    # ./legacy/legacy.nix
    ./scripts/scripts.nix
    # ./python/environment.nix
    # ./colorschemes.nix
  ];

  manual.html.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
