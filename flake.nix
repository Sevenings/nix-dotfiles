# Link do template dessa configuração:
# https://github.com/Misterio77/nix-starter-configs/tree/main?tab=readme-ov-file
{
  description = "My nix config";

  inputs = {
    # Caelestia Shell
    caelestia-shell = {
      url = "github:Sevenings/my-caelestia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Claude Code
    nix-claude-code.url = "github:ryoppippi/nix-claude-code";

    # Nix-Colors
    nix-colors.url = "github:misterio77/nix-colors";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland 
    hyprland.url = "github:hyprwm/Hyprland/v0.55.0";

    # Hyprland  Dynamic Cursors
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland"; # to make sure that the plugin is built for the correct version of hyprland
    };

    # Hyprland Plugins
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins/v0.55.0";
      inputs.hyprland.follows = "hyprland";
    };

    # Yazi
		yazi.url = "github:sxyazi/yazi"; 

    # Yazi Plugins
    smart-filter-yazi = {
      url = "github:Sevenings/smart-filter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen-Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: 
  let
    inherit (self) outputs;

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    extraSpecialArgs = { inherit system inputs outputs; nixpkgs-unstable = nixpkgs-unstable.legacyPackages.${system};};  # <- passing inputs to the attribute set for home-manager
    specialArgs = { inherit system inputs outputs; nixpkgs-unstable = nixpkgs-unstable.legacyPackages.${system};};  # <- passing inputs to the attribute set for configuration

    auxiliar = import ./misc/auxiliar { inherit nixpkgs home-manager specialArgs extraSpecialArgs inputs; };
    nixosConfigurations = auxiliar.nixosConfigurations;
    homeConfigurations = auxiliar.homeConfigurations;

  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = import ./misc/pkgs pkgs;

    # Your custom packages and modifications, exported as overlays
    overlays = import ./misc/overlays {inherit inputs;};

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./misc/modules/nixos;

    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./misc/modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      fatima = nixosConfigurations { user = "okabe"; };
      stonebox = nixosConfigurations { user = "senku"; };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "okabe@fatima" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance
        inherit extraSpecialArgs;
        modules = [
          # > Our main home-manager configuration file <
          inputs.caelestia-shell.homeManagerModules.default
          ./common/home-manager/home.nix # Retrocompatibilidade
          ./okabe/home-manager/home.nix  # Retrocompatibilidade
          ./hosts/okabe/home.nix # Importa a home nova
        ];
      };

      "senku@stonebox" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance
        inherit extraSpecialArgs;
        modules = [
          # > Our main home-manager configuration file <
          inputs.caelestia-shell.homeManagerModules.default
          ./common/home-manager/home.nix # Retrocompatibilidade
          ./senku/home-manager/home.nix  # Retrocompatibilidade
          ./hosts/senku/home.nix # Importa a home nova
        ];
      };

    };
  };
}
