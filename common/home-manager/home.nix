{ outputs, inputs, ... }:

{
  imports = [
    ./colors
    # ./hyprland
    ./environment_variables.nix
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./matrix
    ./mimetypes.nix
    ./mpd.nix
    # ./nvim.nix
    # ./obsidian
    ./packages.nix
    ./programs.nix
    ./scripts/scripts.nix
    ./vpntce
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    ./xdg.nix
    ./yazi/yazi.nix
    # ./zathura.nix
    ./zsh/zsh.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  manual.html.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.overlays = [ 
    outputs.overlays.additions 
    outputs.overlays.modifications
    outputs.overlays.unstable-packages
  ];
}
