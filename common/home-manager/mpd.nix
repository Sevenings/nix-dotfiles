{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Musicas";
    dataDir = "${config.home.homeDirectory}/.local/share/mpd";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };

  # Clients
  home.packages = with pkgs; [
    mpc
    rmpc
  ];
}
