{ ... }:

{
  programs.yazi.enable = true;

  programs.yazi = {
    initLua = ./init.lua;

    flavors = {
      everforest-medium = ./flavors/everforest-medium.yazi;
    };

    plugins = {
      full-border = ./plugins/full-border.yazi;
      lazygit = ./plugins/lazygit.yazi;
      load-template = ./plugins/load-template.yazi;
      new-project = ./plugins/new-project.yazi;
      smart-enter = ./plugins/smart-enter.yazi;
      smart-filter = ./plugins/smart-filter.yazi;
      sudo = ./plugins/sudo.yazi;
    };

    shellWrapperName = "yy";
  };

  imports = [
    ./settings.nix
    ./keymap.nix
    ./theme.nix
  ];

}
