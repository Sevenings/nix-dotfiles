{ ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = /home/senku/Musicas;
    dataDir = /home/senku/.local/share/mpd;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
