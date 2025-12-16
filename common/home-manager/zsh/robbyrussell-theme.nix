# Tema robbyrussell otimizado para performance
# Baseado no tema original do oh-my-zsh, mas sem overhead do framework
{
  # Configuração do prompt robbyrussell
  promptConfig = ''
    # Initial prompt setup (basic, will be enhanced by precmd)
    if [[ -n "$IN_NIX_SHELL" ]]; then
      PS1='[nix-shell] %F{cyan}%c%f ➜ '
    else
      PS1='%F{cyan}%c%f ➜ '
    fi
  '';

  # Configuração do git para o prompt
  gitPromptConfig = ''
    # Git integration using vcs_info (lightweight)
    autoload -Uz vcs_info
    setopt prompt_subst
    
    # Git prompt styles (robbyrussell-like)
    zstyle ':vcs_info:*' formats ' (%F{green}%b%f)'
    zstyle ':vcs_info:*' actionformats ' (%F{green}%b%f|%F{red}%a%f)'
    
    # Enable only git for performance
    zstyle ':vcs_info:*' enable git
  '';

  # Função precmd que atualiza o prompt dinamicamente
  precmdFunction = ''
    precmd() {
      vcs_info
      if [[ -n "$IN_NIX_SHELL" ]]; then
        PS1="[nix-shell] %F{cyan}%c%f\$vcs_info_msg_0_ ➜ "
      else
        PS1="%F{cyan}%c%f\$vcs_info_msg_0_ ➜ "
      fi
    }
  '';

  # Tema completo combinado
  fullTheme = ''
    # Optimized robbyrussell-style theme
    
    # Initial prompt setup (basic, will be enhanced by precmd)
    if [[ -n "$IN_NIX_SHELL" ]]; then
      PS1='[nix-shell] %F{cyan}%c%f ➜ '
    else
      PS1='%F{cyan}%c%f ➜ '
    fi
    
    # Git integration using vcs_info (lightweight)
    autoload -Uz vcs_info
    setopt prompt_subst
    
    # Git prompt styles (robbyrussell-like)
    zstyle ':vcs_info:*' formats ' (%F{green}%b%f)'
    zstyle ':vcs_info:*' actionformats ' (%F{green}%b%f|%F{red}%a%f)'
    
    # Enable only git for performance
    zstyle ':vcs_info:*' enable git
    
    # Dynamic prompt update function
    precmd() {
      vcs_info
      if [[ -n "$IN_NIX_SHELL" ]]; then
        PS1="[nix-shell] %F{cyan}%c%f\$vcs_info_msg_0_ ➜ "
      else
        PS1="%F{cyan}%c%f\$vcs_info_msg_0_ ➜ "
      fi
    }
  '';
}