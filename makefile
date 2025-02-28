nixos:
	nixos-rebuild switch --flake .#okabe

home:
	home-manager switch --flake .#okabe@fatima
