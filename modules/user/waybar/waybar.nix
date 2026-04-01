{ ... }:


{
  programs.waybar = {
    enable = false;
    style = ./css/monokai.css;
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./modules.json );
    };
  };
}
