{
  nixpkgs,
  home-manager,
  specialArgs,
  extraSpecialArgs,
  system ? "x86_64-linux",
  inputs,
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

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [ "claude" ];
        overlays = [ inputs.nix-claude-code.overlays.default ];
      };
      inherit extraSpecialArgs;
      modules = [
        # > Our main home-manager configuration file <
        inputs.caelestia-shell.homeManagerModules.default
        ../../common/home-manager/home.nix
        ../../${user}/home-manager/home.nix
      ] ++ extraModules;
    });
}
