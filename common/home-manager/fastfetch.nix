{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        padding = {
          right = 1;
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "wm"
        "terminal"
        "shell"
        "packages"
        "memory"
        "disk"
        "uptime"
        "separator"
        "break"
        "colors"
      ];
    };
  };
}
