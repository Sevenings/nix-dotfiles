{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./gruvbox/config.json );
    };
    style = ./gruvbox/style.css;
  };

}
