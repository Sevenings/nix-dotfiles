{ ... }:

{
  home.file = {
    ".zshrc".source = ./zshrc;
    ".config/zsh".source = ./extensions;
    ".config/zsh/plugins".source = ./plugins;
  };
}
