{ config, lib, inputs, pkgs, system, ... }:

let
  cfg = config.userSettings.yazi;
in
{
  options.userSettings.yazi = {
    enable = lib.mkEnableOption "Enable Yazi";
  };

  imports = [
    ./settings.nix
    ./keymap.nix
    ./theme.nix
  ];

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
    programs.yazi = {
      enable = true;
      # enableZshIntegration = true;
      shellWrapperName = "y";

      initLua = ./init.lua;

      plugins = {
        compress = pkgs.yaziPlugins.compress;
        full-border = pkgs.yaziPlugins.full-border;
        git = pkgs.yaziPlugins.git;
        githead = pkgs.yaziPlugins.githead;
        lazygit = pkgs.yaziPlugins.lazygit;
        load-template = ./plugins/load-template.yazi;
        local-shell = ./plugins/local-shell.yazi;
        minecraft-skin = inputs.minecraft-skin-yazi.packages.${system}.default;
        mount = ./plugins/mount.yazi;
        restore = ./plugins/restore.yazi;
        smart-enter = pkgs.yaziPlugins.smart-enter;
        smart-filter = inputs.smart-filter-yazi.packages.${system}.default;
        sudo = ./plugins/sudo.yazi;
      };
    };

    home.packages = with pkgs; [
      trash-cli
      fzf
      zoxide
    ];
  };
}
