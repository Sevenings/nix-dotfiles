{ outputs, inputs, ... }:

{
  imports = [
    ./aseprite
    ./caelestia
    ./claude-code
    ./clipcat.nix
    ./cruise
    ./colors
    ./hyprland
    ./elixir
    ./environment_variables.nix
    ./fastfetch.nix
    ./general
    ./git.nix
    ./go
    ./gtk.nix
    ./kitty.nix
    ./kubernetes-utils
    ./kubernetes-local-cluster
    ./matrix
    ./mimetypes.nix
    ./mpd.nix
    ./nextcloud-client
    ./nvim.nix
    ./obsidian
    ./packages.nix
    ./programs.nix
    ./scripts/scripts.nix
    ./taskwarrior
    ./tce
    ./tinty
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    ./xdg.nix
    ./yazi/yazi.nix
    ./zathura.nix
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
