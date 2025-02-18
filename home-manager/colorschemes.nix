{ pkgs, config, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.kanagawa;

  programs.kitty = {
    enable = true;
    settings = {
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
    };
  };
}
