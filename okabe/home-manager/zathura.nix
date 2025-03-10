{ nixpkgs-unstable, ... }:

{
  home.file.".config/zathura".source = ./zathura;

  programs.zathura = {
    enable = true;
    package = nixpkgs-unstable.legacyPackages.x86_64-linux.zathura;
  };

}
