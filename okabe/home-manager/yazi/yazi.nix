{ nixpkgs-unstable, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    package = nixpkgs-unstable.yazi;
  };

  programs.yazi = {
    initLua = ./init.lua;

    flavors = {
      everforest-medium = ./flavors/everforest-medium.yazi;
    };

    plugins = {
      full-border = ./plugins/full-border.yazi;
      lazygit = ./plugins/lazygit.yazi;
      load-template = ./plugins/load-template.yazi;
      smart-enter = ./plugins/smart-enter.yazi;
      smart-filter = ./plugins/smart-filter.yazi;
      sudo = ./plugins/sudo.yazi;
    };

  };

  imports = [
    ./settings.nix
    ./keymap.nix
    ./theme.nix
  ];

}
