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
      package = inputs.yazi.packages.${pkgs.system}.default;
      # enableZshIntegration = true;
      # shellWrapperName = "y";

      initLua = ./init.lua;

      plugins = {
        compress = ./plugins/compress.yazi;
        full-border = ./plugins/full-border.yazi;
        git = pkgs.yaziPlugins.git;
        lazygit = ./plugins/lazygit.yazi;
        load-template = ./plugins/load-template.yazi;
        local-shell = ./plugins/local-shell.yazi;
        mount = ./plugins/mount.yazi;
        restore = ./plugins/restore.yazi;
        smart-enter = pkgs.yaziPlugins.smart-enter;
        smart-filter = inputs.smart-filter-yazi.packages.${system}.default;
        sudo = ./plugins/sudo.yazi;
      };
    };
  };
}
