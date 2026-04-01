# Integrações e plugins do zsh
{
  # Hook integrations (direnv, zoxide, etc.)
  hooks = ''
    # Hook integrations
    eval "$(direnv hook zsh)"
    eval "$(zoxide init zsh)"
  '';

  # Plugin loading
  plugins = ''
    # Load nix-shell plugin (essential for nix-shell prompt)
    if [ -f ~/.config/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh ]; then
      source ~/.config/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh
    fi
    
    # Load yazi wrapper (must be sync for immediate use)
    if [ -f ~/.config/zsh/yazi.sh ]; then
      source ~/.config/zsh/yazi.sh
    fi
  '';

  # Startup commands
  startup = ''
    # Startup commands
    clear
    fastfetch
    calcurse -d 7
  '';

  # Background completions loading
  backgroundCompletions = ''
    # Load completions lazily in background after startup
    {
      autoload -U compinit
      compinit -C
      if [ -f ~/.zsh_arduino-completion.sh ]; then
        source ~/.zsh_arduino-completion.sh
      fi
    } &!
  '';

  # Full integration script
  fullIntegration = ''
    # Hook integrations
    eval "$(direnv hook zsh)"
    eval "$(zoxide init zsh)"
    
    # Load nix-shell plugin (essential for nix-shell prompt)
    if [ -f ~/.config/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh ]; then
      source ~/.config/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh
    fi
    
    # Load yazi wrapper (must be sync for immediate use)
    if [ -f ~/.config/zsh/yazi.sh ]; then
      source ~/.config/zsh/yazi.sh
    fi
    
    # Startup commands
    clear
    fastfetch
    calcurse -d 7
    
    # Load completions lazily in background after startup
    {
      autoload -U compinit
      compinit -C
      if [ -f ~/.zsh_arduino-completion.sh ]; then
        source ~/.zsh_arduino-completion.sh
      fi
    } &!
  '';
}