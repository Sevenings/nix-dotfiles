{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = builtins.fromJSON ( builtins.readFile ./gruvbox/config.json );
    };
    style = ./gruvbox/style.css;
  };

}
