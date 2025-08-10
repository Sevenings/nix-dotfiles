{ ... }:

{
  programs.waybar = {
    enable = true;
    style = ./css/monokai.css;
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./modules.json );
    };
  };
}
