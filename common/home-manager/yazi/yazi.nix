{ inputs, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
  };

  programs.yazi = {
    initLua = ./init.lua;

    flavors = {
      everforest-medium = ./flavors/everforest-medium.yazi;
    };

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
