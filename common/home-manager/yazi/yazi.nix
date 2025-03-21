{ inputs, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    enableZshIntegration = true;
		shellWrapperName = "y";

    initLua = ./init.lua;

    # plugins = {
    #   full-border = ./plugins/full-border.yazi;
    #   lazygit = ./plugins/lazygit.yazi;
    #   load-template = ./plugins/load-template.yazi;
    #   smart-enter = ./plugins/smart-enter.yazi;
    #   smart-filter = ./plugins/smart-filter.yazi;
    #   sudo = ./plugins/sudo.yazi;
    # };

  };

  # Solução temporária dos plugins do yazi enquanto a solução via nix não funciona
  home.file.".config/yazi/plugins".source = ./plugins;

  imports = [
    ./settings.nix
    ./keymap.nix
    ./theme.nix
  ];

}
