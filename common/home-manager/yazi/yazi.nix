{ inputs, pkgs, system, ... }:

{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    enableZshIntegration = true;
		shellWrapperName = "y";

    initLua = ./init.lua;

    plugins = {
      compress = ./plugins/compress.yazi;
      full-border = ./plugins/full-border.yazi;
      git = pkgs.yaziPlugins.git;
      lazygit = ./plugins/lazygit.yazi;
      load-template = ./plugins/load-template.yazi;
      mount = ./plugins/mount.yazi;
      restore = ./plugins/restore.yazi;
      smart-enter = ./plugins/smart-enter.yazi;
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
