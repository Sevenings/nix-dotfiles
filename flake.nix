# Link do template dessa configuração:
# https://github.com/Misterio77/nix-starter-configs/tree/main?tab=readme-ov-file
{
  description = "My new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland Plugins
    hyprland.url = "github:hyprwm/Hyprland";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };

    # Yazi
		yazi.url = "github:sxyazi/yazi"; 

    # Zen-Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    specialArgs = { inherit system inputs; nixpkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;};  # <- passing inputs to the attribute set for home-manager
    extraSpecialArgs = { inherit system inputs; nixpkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;};  # <- passing inputs to the attribute set for home-manager
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = import ./misc/pkgs nixpkgs.legacyPackages.${system};

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./misc/modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./misc/modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {

      fatima = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          # > Our main nixos configuration file <
          ./common/nixos/configuration.nix
          ./okabe/nixos/configuration.nix
        ];
      };

      stonebox = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          # > Our main nixos configuration file <
          ./common/nixos/configuration.nix
          ./senku/nixos/configuration.nix
        ];
      };

    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      
      "okabe@fatima" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        inherit extraSpecialArgs;
        modules = [
          # > Our main home-manager configuration file <
          ./common/home-manager/home.nix
          ./okabe/home-manager/home.nix
        ];
      };

      "senku@stonebox" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        inherit extraSpecialArgs;
        modules = [
          # > Our main home-manager configuration file <
          ./common/home-manager/home.nix
          ./senku/home-manager/home.nix
        ];
      };

    };
  };
}
