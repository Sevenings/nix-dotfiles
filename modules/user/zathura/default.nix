{ config, nixpkgs-unstable, ... }:

let
  cfg = config.userSettings.zathura;
in
{
  options.userSettings.hyprland = {
    enable = lib.mkEnableOption "Enable Zathura";
  };

  config = lib.mkIf cfg.enable {
    programs.zathura = {
      enable = true;
      package = nixpkgs-unstable.zathura;
    };

    home.file.".config/zathura".source = ./dotfiles;
  };
}
