{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./monokai/config.json );
    };
    style = ./monokai/style.css;
  };

}
