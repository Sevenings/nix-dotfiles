{ 
  nixpkgs, 
  home-manager,
  specialArgs,
  extraSpecialArgs,
  system ? "x86_64-linux",
}:
{
  nixosConfigurations = {user, extraModules ? [] }@args: (nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = [
        ../../common/nixos/configuration.nix
        ../../${user}/nixos/configuration.nix
      ] ++ extraModules;
    });

  homeConfigurations = { user, extraModules ? [] }@args: (home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance
      inherit extraSpecialArgs;
      modules = [
        # > Our main home-manager configuration file <
        ../../common/home-manager/home.nix
        ../../${user}/home-manager/home.nix
      ] ++ extraModules;
    });
}
