{ inputs, pkgs, system, ... }:

{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    enableZshIntegration = true;
		shellWrapperName = "y";

    initLua = ./init.lua;

    plugins = {
      full-border = ./plugins/full-border.yazi;
      git = ./plugins/git.yazi;
      lazygit = ./plugins/lazygit.yazi;
      load-template = ./plugins/load-template.yazi;
      mount = ./plugins/mount.yazi;
      smart-enter = ./plugins/smart-enter.yazi;
      smart-filter = inputs.smart-filter-yazi.packages.${system}.default;
      sudo = ./plugins/sudo.yazi;
    };

  };

  # Solução temporária dos plugins do yazi enquanto a solução via nix não funciona
  # home.file.".config/yazi/plugins".source = ./plugins;

  imports = [
    ./settings.nix
    ./keymap.nix
    ./theme.nix
  ];

}
