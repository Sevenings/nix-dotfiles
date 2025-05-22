rebuild:
	nixos-rebuild switch --flake .# --use-remote-sudo

home:
	home-manager switch --flake .

pull:
	git pull

update: pull home rebuild
