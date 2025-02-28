nixos:
	nixos-rebuild switch --flake .#okabe --use-remote-sudo

home:
	home-manager switch --flake .#okabe@fatima
