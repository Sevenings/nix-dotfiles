{
  description = "My new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland Plugins
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };

    # Yazi
		yazi.url = "github:sxyazi/yazi"; 

    # Zen-Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    split-monitor-workspaces,
    yazi,
    zen-browser,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
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

      okabe = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; system = system; };
        modules = [
          # > Our main nixos configuration file <
          ./okabe/nixos/configuration.nix
        ];
      };

      stonebox = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs system;};
        modules = [
          # > Our main nixos configuration file <
          ./senku/nixos/configuration.nix
        ];
      };

    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      
      "okabe@fatima" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs nixpkgs-unstable;};
        modules = [
          # > Our main home-manager configuration file <
          ./okabe/home-manager/home.nix
        ];
      };

      "senku@stonebox" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs nixpkgs-unstable;};
        modules = [
          # > Our main home-manager configuration file <
          ./senku/home-manager/home.nix
        ];
      };

    };
  };
}
