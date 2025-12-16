{ pkgs, ... }:

let
  theme = import ./robbyrussell-theme.nix;
  integrations = import ./integrations.nix;
in
{
  programs.zsh = {
    enable = true;
    
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    # Aliases
    shellAliases = {
      ":q" = "exit";
      "quit" = "exit";
      "vim" = "nvim";
      "vimrc" = "nvim ~/.config/nvim/vimrc.vim";
      "zshrc" = "nvim ~/.zshrc";
      "get_idf" = ". $HOME/esp/esp-idf/export.sh";
      "allow_acm" = "sudo chmod a+rw /dev/ttyACM0";
      "allow_usb" = "sudo chmod a+rw /dev/ttyUSB0";
      "allow_usb1" = "sudo chmod a+rw /dev/ttyUSB1";
      "clip" = "wl-copy";
      "venv" = "source .venv/bin/activate";
      "dovenv" = "python -m venv .venv && source .venv/bin/activate && if [[ -e requirements.txt ]]; then; pip install -r requirements.txt; fi";
      "rmvenv" = "rm -r .venv && deactivate";
      ":qvenv" = "deactivate";
      "s" = "kitten ssh";
      "goserver" = "kitten ssh lucas@tce-automacao";
      "dockerserver" = "kitten ssh docker@tce-automacao";
      "bebop" = "s edie@beebopi";
      "beebopi" = "s edie@beebopi";
      "sudo" = "sudo -E -s";
      "todo" = "nvim ~/todo.txt";
      "rebuild" = "nixos-rebuild switch --use-remote-sudo --upgrade";
      "confone" = "bluetoothctl connect 68:59:32:F7:D3:89";
      "lg" = "lazygit";
      "cd" = "z";
      "vpntce" = "sudo openfortivpn vpn.tce.go.gov.br:443 -u lvinicius";
      "lzapdos" = "s lucas@zapdos.tce.go.gov.br";
      "zapdos" = "s zapdos@zapdos.tce.go.gov.br";
      "emac" = "ssh -i \"reserve-emac.pem\" ec2-user@ec2-18-231-39-183.sa-east-1.compute.amazonaws.com";
    };
    
    # Environment variables
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      MOZ_ENABLE_WAYLAND = "1";
      RANGER_LOAD_DEFAULT_RC = "false";
      FZF_DEFAULT_COMMAND = "find .";
    };
    
    # Optimizations
    enableCompletion = false; # Disable automatic completion loading
    
    # Init scripts
    initContent = ''
      # Load robbyrussell-style theme (optimized)
      ${theme.fullTheme}
      
      # Load integrations, hooks, and plugins
      ${integrations.fullIntegration}
    '';
  };
  
  # Keep the config directory for extensions
  home.file = {
    ".config/zsh".source = ./extensions;
  };
}
