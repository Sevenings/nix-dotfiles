sys:
	nixos-rebuild switch --use-remote-sudo --flake ~/.dotfiles#fatima

home:
	home-manager switch
