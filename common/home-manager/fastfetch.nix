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
        # "packages" # Comentado pois é lento (enumera 7000+ pacotes)
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
