{ inputs, pkgs, system, ... }:

{
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
      mount = ./plugins/mount.yazi;
      restore = ./plugins/restore.yazi;
      smart-enter = pkgs.yaziPlugins.smart-enter;
      smart-filter = inputs.smart-filter-yazi.packages.${system}.default;
      sudo = ./plugins/sudo.yazi;
    };

  };

  imports = [
    ./settings.nix
    ./keymap.nix
    ./theme.nix
  ];

}
