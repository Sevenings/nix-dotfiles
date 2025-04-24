{ ... }:

{
  home.file = {
    ".zshrc".source = ./zshrc;
    ".config/zsh".source = ./extensions;
  };
}
