{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.nvim;
in
{
  options.userSettings.nvim = {
    enable = lib.mkEnableOption "Enable Neovim";
  };

  config = lib.mkIf cfg.enable {

    # Configurações do módulo
    home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/common/link/nvim";

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    home.packages = with pkgs; [
      tinty
    ];

  };
}
