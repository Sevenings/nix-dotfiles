{ ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = ~/Musicas;
    dataDir = ~/.local/share/mpd;
    services.mpd.extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
