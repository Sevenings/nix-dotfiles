{ config, lib, ... }:

let
  cfg = config.userSettings.nvim;
in
{
  options.userSettings.nvim = {
    enable = lib.mkEnableOption "Enable Neovim";
  };

  config = lib.mkIf cfg.enable {

    # Configurações do módulo
    home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/senku/.dotfiles/common/link/nvim;

  };
}
