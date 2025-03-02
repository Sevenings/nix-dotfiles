okabe-rebuild:
	nixos-rebuild switch --flake .#okabe --use-remote-sudo

okabe-home:
	home-manager switch --flake .#okabe@fatima

senku-rebuild:
	nixos-rebuild switch --flake .#senku --use-remote-sudo

senku-home:
	home-manager switch --flake .#senku@stonebox
