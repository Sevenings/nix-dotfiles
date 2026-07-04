{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tinty
  ];

  home.file.".config/tinted-theming/tinty/config.toml".text = ''
    [[items]]
    path = "https://github.com/tinted-theming/tinted-yazi"
    name = "tinted-yazi"
    themes-dir = "flavors"
    hook = ''''
    mkdir -p "$HOME/.config/yazi/flavors/tinted-scheme.yazi"
    cp -f "$TINTY_THEME_FILE_PATH" "$HOME/.config/yazi/flavors/tinted-scheme.yazi/flavor.toml"
    ''''
  '';
}
