run:
	nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles#fatima

compile:
	make run
