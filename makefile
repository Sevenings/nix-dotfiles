nixos:
	nixos-rebuild --flake .#okabe

home:
	home-manager --flake .#okabe@fatima
