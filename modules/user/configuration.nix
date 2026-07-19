{ outputs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  manual.html.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ 
    outputs.overlays.additions 
    outputs.overlays.modifications
    outputs.overlays.unstable-packages
  ];
}
