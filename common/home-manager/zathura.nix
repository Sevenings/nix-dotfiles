{ nixpkgs-unstable, ... }:

{
  home.file.".config/zathura".source = ./zathura;

   programs.zathura = {
    enable = true;
    package = nixpkgs-unstable.zathura;
  };
}
